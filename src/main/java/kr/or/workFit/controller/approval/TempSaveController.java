package kr.or.workFit.controller.approval;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.workFit.service.approval.ReportServiceImpl;
import kr.or.workFit.service.approval.TempService;
import kr.or.workFit.service.approval.TempServiceImpl;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/approval")
public class TempSaveController {

//	@Autowired
	@Resource(name = "TempService")
	private TempService service;
	
	@Autowired
	private ReportServiceImpl service2;
	
	
	@PostMapping("/delTempDoc")
	@ResponseBody
	public int delTempDoc(@RequestBody String delCode) throws Exception {
		
		log.debug("delCode:{}",delCode);
		
		int referenceCnt = service.deleteRefer(delCode);
		int appCnt = service.deleteApprovalLine(delCode);
		int attachCnt = service.deleteAttachFromDocCode(delCode);
		int docCnt = service.deleteDoc(delCode);
		
		
		return 1;
		
	}
	

	/**
	 * 임시저장함 리스트
	 * 
	 * @param model
	 * @param memId
	 * @param memName
	 * @param memJobGrade
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/tempList")
	public String tempList(Model model, 
			@SessionAttribute("memId") String memId,
			@SessionAttribute("memName") String memName,
			@SessionAttribute("memJobGrade") String memJobGrade
			) throws Exception {

		
		//leftNav
		model.addAttribute("menu", "approval");
		// 작성일 들어가는 map
		Map<String, Object> dateMap = new HashMap<String, Object>();
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy.MM.dd.");

		log.debug("memID:" + memId);

		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setMemId(memId);
		approvalVO.setMemName(memName);
		approvalVO.setApprovalMemGrade(memJobGrade);
		approvalVO.setDelegationStatus('0');

		log.debug("approvalVO 확인 , {}", approvalVO);

		// 결재 문서 리스트 select
		List<ApprovalDocVO> tempList = service.tempList(approvalVO);

		log.debug("임시저장 문서 리스트 반환,{}", tempList);

		if (tempList == null || tempList.size() == 0) {
			return "workfit/approval/tempList";
		}
		
		log.debug("임시저장 문서 리스트 반환: " + tempList);
		

		// select한 결재 문서의  결재일 포매팅
//		for (ApprovalDocVO vo : tempList) {
//			vo.setApprovalDate(newDtFormat.format(vo.getApprovalDate()));
//			approvalVO.setApprovalDocCode(vo.getApprovalDocCode());
//			approvalVO = service.selectApprovalData(approvalVO);
//			
//			dateMap.put(vo.getApprovalDocCode(), newDtFormat.format(approvalVO.getApprovalDate()));
//		}
		
		//내정보
		model.addAttribute("myInfo", approvalVO);
		//임시저장 리스트
		model.addAttribute("tempList", tempList);
		//결재일 들어간 맵
//		model.addAttribute("dateMap", dateMap);

		return "workfit/approval/tempList";
	}

	@PostMapping(value = "showTempDetail")
	@ResponseBody
	public Map<String, Object> showDetail(@RequestBody String docCode) throws Exception {
		
		log.debug("docCode 데이터 확인,{}",docCode);
		String code = docCode.substring(docCode.lastIndexOf(":")+2);
		String newCode = code.substring(0,code.lastIndexOf('"'));
		log.debug("docCode 가공:{}", newCode );
		Map<String, Object> tempInfo = new HashMap<String, Object>();
		
		//결재문서 정보 가져오기
		ApprovalDocVO appDocVO = service.selectDetail(newCode);
		log.debug("appDocVO 데이터 확인,{}",appDocVO);
		
		//결재라인 정보 가져오기
		List<ApprovalVO> appLineList = service.selectAppLineList(newCode);
		log.debug("appLineList 데이터 확인,{}",appLineList);
		
		//첨부파일 정보 가져오기
		List<ApprovalAttachVO> attachList = service.selectAttachList(newCode);
		log.debug("attachList 데이터 확인,{}",attachList);
		
		//참조자 정보 가져오기
		List<ApprovalReferenceVO> referList = service.selectReferenceList(newCode);
		for(ApprovalReferenceVO vo : referList) {
			MemberVO memVO =  service.getMemINfo(vo.getMemId());
			vo.setMemName(memVO.getMemName());
			vo.setMemGrade(memVO.getMemJobGrade());
		}
		log.debug("referList 데이터 확인,{}",referList);
		
		tempInfo.put("appDocVO", appDocVO);
		tempInfo.put("appLineList", appLineList);
		tempInfo.put("attachList", attachList);
		tempInfo.put("referList", referList);
		
		log.debug("임시저장 문서 데이터 확인 {}", tempInfo);
		
		return tempInfo;
				
	}
	
	/**
	 * 임시저장 문서 상신하기
	 * @param req
	 * @param approvalList
	 * @param referenceList
	 * @param DocVO
	 * @param delAttachList
	 * @param attachList
	 * @param fileList
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping(value = "uploadTemp", produces = "application/json;charset=utf-8")
	public int uploadTemp(HttpServletRequest req, 
			@RequestParam("approvalList") String approvalList,
			@RequestParam("referenceList") String referenceList, 
			@RequestParam("approvalDocVO") String DocVO,
			@RequestParam("delAttachList") String delAttachList,
			@RequestParam("attachList") String attachList,
			@RequestParam("uploadFiles") List<MultipartFile> fileList,
			@SessionAttribute("memCo") String memCo
			) throws Exception {
		
		log.debug("결재자리스트 : {}", approvalList);
		log.debug("참조자리스트 : {}", referenceList);
		log.debug("결재문서VO : {}", DocVO);
		log.debug("첨부 추가리스트 : {}", fileList);
		log.debug("첨부파일 유지 리스트 : {}", attachList);
		log.debug("첨부파일 삭제 리스트 : {}", delAttachList);
		
		ObjectMapper objectMapper = new ObjectMapper();
		// ApprovalVO 바인딩
		List<ApprovalVO> appList = objectMapper.readValue(approvalList, new TypeReference<List<ApprovalVO>>() {});
		log.debug("appList관련:,{}", appList);
		// ApprovalReferenceVO 바인딩
		List<ApprovalReferenceVO> refList = objectMapper.readValue(referenceList,new TypeReference<List<ApprovalReferenceVO>>() {});
		log.debug("refList관련:,{}", refList);
		log.debug("refList관련길이:,{}", refList.size());
		
		// ApprovalDocVO 바인딩
		ApprovalDocVO approvalDocVO = objectMapper.readValue(DocVO, new TypeReference<ApprovalDocVO>() {});
		// 첨부파일 유지 리스트  바인딩
		List<String> attList = objectMapper.readValue(attachList,new TypeReference<List<String>>() {});
		// 첨부파일 삭제리스트  바인딩
		List<String> delAttList = objectMapper.readValue(delAttachList,new TypeReference<List<String>>() {});
		
		//결재문서 코드
		String docCode = approvalDocVO.getApprovalDocCode();
		log.debug("임시저장 docCode:,{}" ,docCode);
		
		//첨부파일 삭제 
		for(String attachCode : delAttList) {
			/*셀렉트 해와서 폴더에서 삭제하고
			삭제 되면 디비 내용 삭제하고
			새로운거 인서트
			*/
			ApprovalAttachVO attVO = service.selectAttachInfo(attachCode);
			File file = new File(attVO.getApprovalAttachSavepath()+"\\" + attVO.getApprovalAttachNewname() + "." + attVO.getApprovalAttachType());
		    boolean fileDeleted = file.delete();
		    
		    if(fileDeleted) {
		    	int cnt = service.deleteAttach(attachCode);
		    }
		}
		
		//첨부파일 유지 리스트 파일 이동
		for(String attachCode : attList) {
			ApprovalAttachVO attVO = service.selectAttachInfo(attachCode);
			try {
				File oldfile = FileUtils.getFile(attVO.getApprovalAttachSavepath()+"\\" + attVO.getApprovalAttachNewname() + "." + attVO.getApprovalAttachType());
				File newfile = FileUtils.getFile("Z:\\upload" + "\\" + attVO.getApprovalAttachNewname() + "." + attVO.getApprovalAttachType());
				FileUtils.moveFile(oldfile, newfile);
			}catch (IOException e) {
				e.printStackTrace();
			}
			attVO.setApprovalAttachSavepath("Z:\\upload");
			
			int updateAttach = service.updateAttach(attVO);
		}
		//새 첨부 파일 인서트 하기
		ServletContext sc = req.getSession().getServletContext();
		String realPath = sc.getRealPath("/resources/uploads/approvalAttach");
		log.debug("리얼패스:" + realPath);

		for (int i = 0; i < fileList.size(); i++) {

			String sharePath = "Z:\\upload";
			String fileName = UUID.randomUUID().toString();
			String fileType = fileList.get(i).getContentType().substring(fileList.get(i).getContentType().lastIndexOf("/")+1); 
			
			File shareFile = new File(sharePath + "/" + fileName + "." + fileType);

			fileList.get(i).transferTo(shareFile);

			ApprovalAttachVO attVO = new ApprovalAttachVO();
			attVO.setApprovalAttachName(fileList.get(i).getOriginalFilename());
			attVO.setApprovalAttachSavepath(sharePath);
			attVO.setApprovalDocCode(docCode);
			attVO.setApprovalAttachNewname(fileName);
			attVO.setApprovalAttachSize(fileList.get(i).getSize());
			attVO.setApprovalAttachType(fileType);

			log.debug("파일 들어가기 전에 attVO:,{}", attVO);
			int attCnt = service2.insertApprovalAttach(attVO);
			log.debug("결재 첨부 테이블 인서트 성공여부 : " + attCnt);
		}
		
		// 결재 참조 처리
		int refInt = service.deleteRefer(docCode);
		
		for (ApprovalReferenceVO approvalReferenceVO : refList) {
			if(approvalReferenceVO.getMemId() !=null) {
				approvalReferenceVO.setApprovalDocCode(docCode);
				// 결재 참조 인서트
				int refCnt = service2.insertApprovalReference(approvalReferenceVO);
				log.debug("결재 참조 테이블 인서트 성공여부 : " + refCnt);
			}
		}
		
		
		
		//결재라인 처리
		int appInt = service.deleteApprovalLine(docCode);
		for (ApprovalVO approvalVO : appList) {
			approvalVO.setApprovalDocCode(docCode);
			if (approvalVO.getApprovalComment() == null || approvalVO.getApprovalComment() == "") {
				approvalVO.setApprovalComment("");
			}
			// 결재
			int appCnt = service2.insertApprovalLine(approvalVO);
			log.debug("결재 테이블 인서트 성공여부 : " + appCnt);
		}
		
		approvalDocVO.setMemCo(memCo);
		
		// 결재문서 정보 업데이트
		int docCnt = service.updateApprovalDoc(approvalDocVO);
		
		
		return 1;
	}

}
