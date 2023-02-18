package kr.or.workFit.controller.approval;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.workFit.service.approval.ReportServiceImpl;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalTemplateVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MyDocVO;
import lombok.extern.slf4j.Slf4j;


/**
 * @author PC-22
 *
 */
@Slf4j
@Controller
@RequestMapping("/workfit/approval")
public class TemplateController {

	@Autowired
	private ReportServiceImpl service;

	/**
	 * 결재 양식 생성 메서드
	 * 
	 * @param memId
	 * @param map
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/getTemplate", produces = "application/json;charset=UTF-8")
	public ApprovalTemplateVO getTemplateContent(@SessionAttribute("memId") String memId,
			@RequestBody Map<String, String> map) throws Exception {

		log.debug("ajax에서 전송된  templateTitle : " + map.get("templateTitle"));
		Map<String, String> dataMap = new HashedMap();
		dataMap.put("memId", memId);
		dataMap.put("templateTitle", map.get("templateTitle"));

		ApprovalTemplateVO vo = service.getTemplateContent(dataMap);

		return vo;

	}

	/**
	 * 결재 상신 메서드
	 * 
	 * @param req
	 * @param approvalList
	 * @param referenceList
	 * @param DocVO
	 * @param fileList
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "/uploadReport", produces = "application/json;charset=UTF-8")
	public Map<String,String> uploadReport(HttpServletRequest req, @RequestParam("approvalList") String approvalList,
			@RequestParam("referenceList") String referenceList, @RequestParam("approvalDocVO") String DocVO,
			@RequestParam("uploadFiles") List<MultipartFile> fileList,
			@SessionAttribute("memCo") String memCo) throws Exception {

		log.debug("결재자리스트 : {}", approvalList);
		log.debug("참조자리스트 : {}", referenceList);
		log.debug("결재문서VO : {}", DocVO);
		log.debug("파일리스트 : {}", fileList);

		ObjectMapper objectMapper = new ObjectMapper();
		// ApprovalVO 바인딩
		List<ApprovalVO> appList = objectMapper.readValue(approvalList, new TypeReference<List<ApprovalVO>>() {});

		// ApprovalReferenceVO 바인딩
		List<ApprovalReferenceVO> refList = objectMapper.readValue(referenceList,new TypeReference<List<ApprovalReferenceVO>>() {});
		log.debug("refList관련:,{}", refList);
		log.debug("refList관련길이:,{}", refList.size());
		// ApprovalDocVO 바인딩
		ApprovalDocVO approvalDocVO = objectMapper.readValue(DocVO, new TypeReference<ApprovalDocVO>() {});
		approvalDocVO.setMemCo(memCo);
		// 결재문서 인서트
		int docCnt = service.insertApprovalDoc(approvalDocVO);

		log.debug("결재문서 테이블 인서트 성공여부 : " + docCnt);
		log.debug("결재문서 코드 생성여부 확인  : " + approvalDocVO.getApprovalDocCode());
		String docCode = approvalDocVO.getApprovalDocCode();
		for (ApprovalVO approvalVO : appList) {
			approvalVO.setApprovalDocCode(docCode);
//			if (approvalVO.getApprovalComment() == null || approvalVO.getApprovalComment() == "") {
//				approvalVO.setApprovalComment(null);
//			}
			// 결재
			int appCnt = service.insertApprovalLine(approvalVO);
			log.debug("결재 테이블 인서트 성공여부 : " + appCnt);
		}

		// ApprovalReference 바인딩 List<ApprovalReferenceVO> referenceList =
		
		for (ApprovalReferenceVO approvalReferenceVO : refList) {
			if(approvalReferenceVO.getMemId() != null) {
				approvalReferenceVO.setApprovalDocCode(docCode);
				// 결재 참조 인서트
				int refCnt = service.insertApprovalReference(approvalReferenceVO);
				log.debug("결재 참조 테이블 인서트 성공여부 : " + refCnt);
			}
		}
		

		// ApprovalAttachVO 바인딩
		List<ApprovalAttachVO> attachList = new ArrayList<ApprovalAttachVO>();
		ServletContext sc = req.getSession().getServletContext();
		String realPath = sc.getRealPath("/resources/uploads/approvalAttach");
		log.debug("리얼패스:" + realPath);
//		List<String> filePathList = new ArrayList<String>(); // 파일 경로 담을 리스트

		for (int i = 0; i < fileList.size(); i++) {

			String sharePath = "Z:\\upload/approval/"+ docCode ;
			File file = new File(sharePath+"/"+docCode);								// 결재 문서에 대한 각각의 폴더로 분류.
			if(!file.exists()) {														// 없으면 폴더 만륻어
				file.mkdirs();															
			}
			String fileName = UUID.randomUUID().toString();
			String fileType = fileList.get(i).getOriginalFilename().split("\\.")[1]; 
			
			File shareFile = new File(sharePath + "/"+ fileName + "." + fileType);

			fileList.get(i).transferTo(shareFile);

			ApprovalAttachVO attVO = new ApprovalAttachVO();
			attVO.setApprovalAttachName(fileList.get(i).getOriginalFilename());
			attVO.setApprovalAttachSavepath(sharePath);
			attVO.setApprovalDocCode(docCode);
			attVO.setApprovalAttachNewname(fileName);
			attVO.setApprovalAttachSize(fileList.get(i).getSize());
			attVO.setApprovalAttachType(fileType);

			int attCnt = service.insertApprovalAttach(attVO);
			log.debug("결재 첨부 테이블 인서트 성공여부 : " + attCnt);

		}
		
		// 실시간 알림 기능을 위한 결재문서코드 데이터를 생성(Map Collection에 담아서)
		Map<String,String> map = new HashMap<>();
		map.put("docCode", docCode);
		return map;
	}

	@RequestMapping(value = "/get/{aprvId}", method = RequestMethod.GET)
	public void getApprovalAttachFile(HttpServletResponse response, @PathVariable String aprvId) {

		ApprovalAttachVO dataFile = service.getApprAttach(aprvId);
		String fileType = dataFile.getApprovalAttachName().split("\\.")[1];
		log.debug("fileType is What?"+fileType);
		log.debug("fileName is What?"+dataFile.getApprovalAttachName());
		File file = new File(dataFile.getApprovalAttachSavepath(), dataFile.getApprovalAttachNewname()+"."+fileType);
		String fileName = "";
		try {
			fileName = URLEncoder.encode(dataFile.getApprovalAttachName(), "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			response.setContentType(dataFile.getApprovalAttachType());
			response.setHeader("Content-disposition", "attachment; filename=\"" +fileName  + "\"");

			FileCopyUtils.copy(FileUtils.readFileToByteArray(file), response.getOutputStream());

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 임시저장 메서드
	 * @param req
	 * @param tempApprovalDocVO
	 * @param tempApprovalList
	 * @param tempReferenceList
	 * @param fileList
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "saveReport", produces = "application/json;cahrset=UTF-8")
	@ResponseBody
	public int tempSave(HttpServletRequest req, @RequestParam("tempApprovalDocVO") String tempApprovalDocVO,
			@RequestParam("tempApprovalList") String tempApprovalList,
			@RequestParam("tempReferenceList") String tempReferenceList, 
			@RequestParam("uploadFiles") List<MultipartFile> fileList)
			throws Exception {

		log.debug("임시결재자리스트 : {}", tempApprovalList);
		log.debug("임시참조자리스트 : {}", tempReferenceList);
		log.debug("임시결재문서VO : {}", tempApprovalDocVO);
		log.debug("임시파일리스트 : {}", fileList);

		ObjectMapper objectMapper = new ObjectMapper();
		// ApprovalVO 바인딩
		List<ApprovalVO> tempAppList = objectMapper.readValue(tempApprovalList, new TypeReference<List<ApprovalVO>>() {
		});

		// ApprovalReferenceVO 바인딩
		List<ApprovalReferenceVO> tempRefList = objectMapper.readValue(tempReferenceList,
				new TypeReference<List<ApprovalReferenceVO>>() {
				});

		// ApprovalDocVO 바인딩
		ApprovalDocVO temApprovalDocVO = objectMapper.readValue(tempApprovalDocVO, new TypeReference<ApprovalDocVO>() {
		});

		log.debug("임시결재자리스트 변환 후: {}", tempAppList);
		log.debug("임시참조자리스트 변환 후: {}", tempRefList);
		log.debug("임시결재문서VO 변환 후: {}", temApprovalDocVO);

		// 결재 문서 인서트
		int cnt = service.saveDoc(temApprovalDocVO);
		log.debug("임시저장 결재문서 코드 입력 성공여부:" + cnt);
		if (cnt != 1) {
			return 0;
		}
		// 결재 문서 인서트 후 반환되는 문서코드
		String tempDocCode = temApprovalDocVO.getApprovalDocCode();
		log.debug("임시결재문서 코드 반환 값 : " + tempDocCode);

		// 결재 라인 인서트
		if (tempAppList != null || tempAppList.size() != 0) {
			for (ApprovalVO approvalVO : tempAppList) {
				approvalVO.setApprovalDocCode(tempDocCode);
				// 결재
				int appCnt = service.insertApprovalLine(approvalVO);
				log.debug("결재 테이블 인서트 성공여부 : " + appCnt);
			}
		}

		// 결재 참조 라인 인서트
		if (tempRefList != null || tempRefList.size() != 0) {
			for (ApprovalReferenceVO approvalReferenceVO : tempRefList) {
				approvalReferenceVO.setApprovalDocCode(tempDocCode);
				// 결재 참조 인서트
				int refCnt = service.insertApprovalReference(approvalReferenceVO);
				log.debug("결재 참조 테이블 인서트 성공여부 : " + refCnt);
			}
		}

		// ApprovalAttachVO 바인딩
		List<ApprovalAttachVO> attachList = new ArrayList<ApprovalAttachVO>();
		ServletContext sc = req.getSession().getServletContext();
		String realPath = sc.getRealPath("/resources/uploads/approvalAttach");
		log.debug("리얼패스:" + realPath);
//			List<String> filePathList = new ArrayList<String>(); // 파일 경로 담을 리스트

		if (fileList != null || fileList.size() != 0) {
			for (int i = 0; i < fileList.size(); i++) {

				String sharePath = "Z:\\upload\\imsi";
				String fileName = UUID.randomUUID().toString();
				String fileType = fileList.get(i).getContentType().substring(fileList.get(i).getContentType().lastIndexOf("/")+1); 
						
				File shareFile = new File(sharePath + "/" + fileName + "." + fileType);

				fileList.get(i).transferTo(shareFile);

				ApprovalAttachVO attVO = new ApprovalAttachVO();
				attVO.setApprovalAttachName(fileList.get(i).getOriginalFilename());
				attVO.setApprovalAttachSavepath(sharePath);
				attVO.setApprovalDocCode(tempDocCode);
				attVO.setApprovalAttachNewname(fileName);
				attVO.setApprovalAttachSize(fileList.get(i).getSize());
				attVO.setApprovalAttachType(fileType);

				int attCnt = service.insertApprovalAttach(attVO);
				log.debug("결재 첨부 테이블 인서트 성공여부 : " + attCnt);

			}
		}
		return 1;

	}

	/*
	 * @PostMapping(value = "tempApprovalDoc",produces =
	 * "text/plain; charset=utf-8")
	 * 
	 * @ResponseBody public String saveDoc(@RequestBody ApprovalDocVO approvalDocVO)
	 * throws Exception {
	 * 
	 * log.debug("approvalDocVO 데이터 넘어오는지 확인:" + approvalDocVO); int cnt =
	 * service.saveDoc(approvalDocVO);
	 * 
	 * return approvalDocVO.getApprovalDocCode(); }
	 * 
	 * @PostMapping(value = "tempApproval",produces = "text/plain; charset=utf-8")
	 * 
	 * @ResponseBody public String saveApproval(@RequestParam("tempApprovalList")
	 * String tempApprovalList, @RequestParam("tempDocCode") String tempDocCode)
	 * throws Exception {
	 * 
	 * ObjectMapper objectMapper = new ObjectMapper(); List<ApprovalVO> tempAppList
	 * = objectMapper.readValue(tempApprovalList, new
	 * TypeReference<List<ApprovalVO>>() {});
	 * 
	 * 
	 * log.debug("tempApprovalList 데이터 넘어오는지 확인:" + tempAppList);
	 * log.debug("tempDocCode 데이터 넘어오는지 확인:" + tempDocCode);
	 * 
	 * return "성공?"; }
	 */

	/*
	 * @PostMapping(value = "/kjh1", produces = "text/plain; charset=utf-8")
	 * 
	 * @ResponseBody public String kjh1(@RequestBody List<ApprovalReferenceVO>
	 * referenceList1) throws Exception { log.debug("테스트 : {}", referenceList1);
	 * 
	 * return "지노1"; }
	 * 
	 * @PostMapping(value = "/kjh2", produces = "text/plain; charset=utf-8")
	 * 
	 * @ResponseBody public String kjh2(@RequestBody List<ApprovalReferenceVO>
	 * referenceList1) throws Exception { log.debug("테스트 : {}", referenceList1);
	 * 
	 * return "지노2"; }
	 * 
	 * @PostMapping(value = "/kjh3", produces = "text/plain; charset=utf-8")
	 * 
	 * @ResponseBody public String kjh3(@RequestBody List<ApprovalReferenceVO>
	 * referenceList1) throws Exception { log.debug("테스트 : {}", referenceList1);
	 * 
	 * return "지노3"; }
	 */

}
