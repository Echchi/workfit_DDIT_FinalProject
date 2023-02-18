package kr.or.workFit.controller.approval;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.workFit.service.approval.ReportService;
import kr.or.workFit.service.approval.ReqService;
import kr.or.workFit.vo.ApprovalAttachVO;
import kr.or.workFit.vo.ApprovalBookmarkVO;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.ApprovalReferenceVO;
import kr.or.workFit.vo.ApprovalVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/workfit/approval")
public class ReqApprovalController {
	public static int cnt = 13;
	
	@Inject
	ReqService service;
	
	@Inject
	ReportService reportService;
	
	@PostMapping(value="/appCheckedAll",produces="application/json;charset=utf-8")
	@ResponseBody
	public String appCheckedAll (@SessionAttribute("memId") String memId, @RequestBody List<String> list) {
		for(String item : list) {
			log.debug("(컨트롤러) 일괄승인 할 문서 번호 : {}",item);
		}
		
		// 최종 결과 전송
		String finalResult = "";
		String result = "";
		List<String> results = new ArrayList<String>();
		
		// 최종승인 확인용 vo list
		List<ApprovalVO> forfinalCheckList = new ArrayList<ApprovalVO>(); 
		
		for(String code : list) {
			// 아이디 + 문서번호로 해당 결재객체 만들기
			ApprovalVO forfinalCheck = new ApprovalVO();
			forfinalCheck.setMemId(memId);
			forfinalCheck.setApprovalDocCode(code);
			// 위에서 만든 결재객체에 해당하는 결재 문서 뽑기
			ApprovalVO forfinalCheck2 = new ApprovalVO();
			forfinalCheck2 = service.selectAppv(forfinalCheck);
			// 뽑은 결재문서 배열에 넣기
			forfinalCheckList.add(forfinalCheck2);
		}
		 
		// 최종 승인인지 확인 (forfinalCheck2 == vo)
		for(ApprovalVO vo : forfinalCheckList) {
			// 내 결재에 있는 결재번호의 최종 결재번호
			int approvalFinalStatus = service.approvalFlagCheck(vo.getApprovalDocCode());
			log.debug("(일괄승인) 이번 문서의 가장 마지막 결재 순번은 ~? {}",approvalFinalStatus);
			// 내 결재의 최종 결재번호
			String myAppStatus = vo.getApprovalFlag();
			
			// 결재 승인 처리
			int resultMid = service.updateMidApproval(vo);
			
			result = (resultMid == 1)? "승인" : "미승인";
			results.add(result);
			
			log.debug("(일괄승인) 중간결재자 결재 완료 {}",resultMid);
			
			log.debug("(일괄승인) 나의 결재 스테이터스 값 {}",myAppStatus);
			
			
			if(myAppStatus.equals( approvalFinalStatus+"")) {
				int resultFinal = service.updateFinalApproval(vo.getApprovalDocCode());
				log.debug("(일괄승인) 최종승인완료 {}",resultFinal);
				result = (resultFinal == 1)? "승인" : "미승인";
				results.add(result);
			}
			
		}
		
		if(results.contains("미승인")) {
			finalResult = "일괄승인 실패";
		}else {
			finalResult = "일괄승인 성공";
		}
		
		
		return finalResult;
		
	}
	
	
	
	
	
	@GetMapping(value="/insertBookMark", produces="text/plain;charset=utf-8")
	@ResponseBody	
	public void insertBookMark (@SessionAttribute("memId") String memId, String docCode) {
		log.debug("(컨트롤러) 북마크 추가할 문서 번호 : {}",docCode);
		ApprovalVO vo = new ApprovalVO();
		vo.setApprovalDocCode(docCode);
		vo.setMemId(memId);
		service.insertBookMark(vo);
	}
	
	@GetMapping(value="/deleteBookMark", produces="text/plain;charset=utf-8")
	@ResponseBody	
	public void deleteBookMark (@SessionAttribute("memId") String memId, String docCode) {
		log.debug("(컨트롤러) 북마크 삭제할 문서 번호 : {}",docCode);
		ApprovalVO vo = new ApprovalVO();
		vo.setApprovalDocCode(docCode);
		vo.setMemId(memId);
		service.DelBookMark(vo);
	}
	
	
	// 첨부파일 추가 ('결재할 것' 한정)
	@RequestMapping(value = "/req/upload", method = RequestMethod.POST)
	@ResponseBody
	public List<ApprovalAttachVO> upload(MultipartHttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();

		// Maintain a list to send back the files info. to the client side
		List<ApprovalAttachVO> uploadedFiles = new ArrayList<ApprovalAttachVO>();
		log.debug("첨부파일 추가 디버그 1 : " + fileMap.values());
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {
			cnt++;
			// Save the file to local disk
			saveFileToLocalDisk(multipartFile);

			ApprovalAttachVO fileInfo = getUploadedFileInfo(multipartFile);

			// Save the file info to database
//	      fileInfo =; 
			int success = saveFileToDatabase(fileInfo);

			// adding the file info to the list
			uploadedFiles.add(fileInfo);
		}

		return uploadedFiles;
	}
	
	
	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile);

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}

	private int saveFileToDatabase(ApprovalAttachVO fileInfo) {
//		  private MyDocVO saveFileToDatabase(MyDocVO uploadedFile) {
//		log.debug(docService.saveFile(uploadedFile) + "");	// 디버그라도 메소드를 적으면.. 두 번온다..
		return service.saveFile(fileInfo);

	}

	private String getOutputFilename(MultipartFile multipartFile) {

		return getDestinationLocation() + multipartFile.getOriginalFilename();
	}

	private ApprovalAttachVO getUploadedFileInfo(MultipartFile multipartFile) throws IOException {

		ApprovalAttachVO fileInfo = new ApprovalAttachVO();
//		fileInfo.setMyDocCode("md" + (cnt));		// 쿼리 시퀀스로 변경.
		fileInfo.setApprovalAttachName(multipartFile.getOriginalFilename());
		fileInfo.setApprovalAttachNewname("saved_" + multipartFile.getOriginalFilename());
		fileInfo.setApprovalDocCode("AD007");
		fileInfo.setApprovalAttachSize(multipartFile.getSize());
		fileInfo.setApprovalAttachType(multipartFile.getContentType());
		fileInfo.setApprovalAttachSavepath(getDestinationLocation());
		
//		fileInfo.setMyDocName(multipartFile.getOriginalFilename());
//		fileInfo.setMyDocNewname("saved_" + multipartFile.getOriginalFilename());
//		fileInfo.setDocCode("dc001");
//		fileInfo.setMyDocSize(multipartFile.getSize());
//		fileInfo.setMyDocType(multipartFile.getContentType());
//		fileInfo.setMyDocPath(getDestinationLocation());

		return fileInfo;
	}

	private String getDestinationLocation() {
//		return "D:/uploaded-files/";
		return "Z:/";
	}
	
	
	
	
	////////////////// 참조인 추가 
	@PostMapping(value="/addAppvRefMem", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String addAppvRefMem(@RequestBody Map<String,Object> map) {
		log.debug("전송받은 닥코드 {}",map.get("docCode"));
		log.debug("전송받은 회원 리스트 {}",map.get("addingRefList"));
		String docCode = (String)map.get("docCode");
		List<String> memIdList = (List<String>) map.get("addingRefList"); 
		List<Integer> resultList = new ArrayList<Integer>();
		String result = "";
		
		for(int i =0; i< memIdList.size(); i++) {
			ApprovalReferenceVO vo = new ApprovalReferenceVO();
			vo.setApprovalDocCode(docCode);
			vo.setMemId(memIdList.get(i));
			resultList.add(service.insertAppvRef(vo));
		}
		
		for(int res : resultList) {
			if(res == 0) {
				result += "참조자 추가 실패"; 
			}else {
				result = "참조자 추가 성공";
			}
		}
		
		
		return result;
	}
	
	// 참조자 추가 리스트 출력
	@GetMapping("/getAppvRefMem")
	@ResponseBody
	public List<MemberVO> getAppvRef(String docCode) {
		log.debug("참조자 추가 리스트 출력 docCode : {}",docCode);
		List<MemberVO> list = service.selectAllMemforRef(docCode);
		for(MemberVO vo : list) {
			log.debug("참조자 선택을 위한 회원 리스트 {} ", vo.getMemId());
		}
		return list;
	}
	
	
	// 모달 디테일 띄우기
	@GetMapping("/details/{DocCode}/{status}")
	public String test(@SessionAttribute("memId") String memId, @PathVariable("DocCode") String DocCode, @PathVariable("status") String status, Model model) {
		log.info("전자결재 - 디테일 - {} - {}",status, DocCode);
		// 문서번호, 제목, 작성자, 작성일, 결재경로(List), 내용, 첨부파일(List), 관련문서(List), 의견(List) 
		
		ApprovalDocVO approvalDoc = null;
		ApprovalVO startVO = null;
		List<ApprovalVO> approvalList = new ArrayList<ApprovalVO>();
		List<ApprovalAttachVO> approvalAttachList = new ArrayList<ApprovalAttachVO>();
		List<ApprovalReferenceVO> appvRefList = new ArrayList<ApprovalReferenceVO>();
		Map<String, Object> bookmarkMap = new HashMap<String, Object>();
		
		// 문서번호로 결재문서 뽑기 (제목, 내용)(1개)
		approvalDoc = service.selectAppvDoc(DocCode);
		// 문서번호로 참조자 뽑고 다시 넣기
		appvRefList = service.selectAppvRef(DocCode);
		for(ApprovalReferenceVO vo : appvRefList) {
			String mem_id = service.changeId2Nm(vo.getMemId());
			vo.setMemName(mem_id);
		}
		approvalDoc.setApprovalReferenceList(appvRefList);
		
		
		// 문서번호로 결재 뽑기 (결재경로, 결재라인번호 + 아이디 의견)
		approvalList = service.selectAppvContentList(DocCode);
		for(ApprovalVO vo : approvalList) {
			String name = service.changeId2Nm(vo.getMemId());
			vo.setMemName(name);
		}
		
		// 문서번호로 첨부파일 뽑기
		approvalAttachList = service.selectAttaches(DocCode);
		
		// 문서번호로 작성자, 작성일 뽑기
		startVO = service.selectAppvStart(DocCode);
		
		// 작성자 아이디 -> 이름
		startVO.setMemName(service.changeId2Nm(startVO.getMemId()));
		
		// 북마크 체크
        ApprovalBookmarkVO bookMarkVO = new ApprovalBookmarkVO();
        
        bookMarkVO.setApprovalDocCode(DocCode);
        bookMarkVO.setMemId(memId);
        int bookmarkCheck = reportService.checkBookmark(bookMarkVO);
        bookmarkMap.put(DocCode, bookmarkCheck);
		
		
		
		log.debug("전자문서 상세 페이지 내용 : " + approvalDoc.toString());
		for(ApprovalVO vo : approvalList) {
			log.debug("전자문서 상세 페이지 정보 : " + vo.toString());
		}
		for(ApprovalAttachVO vo : approvalAttachList) {
			log.debug("전자문서 첨부파일 정보 : " + vo.toString());
		}
		log.debug("전자문서 작성자/ 작성일 : " + startVO.toString());
		log.info("전자문서 상세 북마크 유무 {}",bookmarkMap.get(DocCode));
		log.info("approvalList {}",approvalList);
		
		
		
		model.addAttribute("bookmarkMap",bookmarkMap);
		model.addAttribute("approvalDoc",approvalDoc);
		model.addAttribute("approvalList",approvalList);
		model.addAttribute("approvalAttachList",approvalAttachList);
		model.addAttribute("startVO",startVO);
		model.addAttribute("DocCode",DocCode);
		model.addAttribute("status",status);


		return "workfit/approval/no-tiles/reqAppDetail";
	}	// 모달 디테일 띄우기 함수 끝
	
	@GetMapping("/getCountAppv")
	@ResponseBody
	public int getCountAppv(@SessionAttribute("memId") String memId) {
		int res = service.getCountAppv(memId);
		return res;
	}
	
	
	@GetMapping("/appvMain")
	public String appvMain(@SessionAttribute("memId")String memId, Model model){
		List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
		// 결재대기
		dataList = service.getRequested(memId);
		model.addAttribute("reqCount",dataList.size());
		model.addAttribute("menu","approval");
		return "workfit/approval/appvMain";
	}
	
	// 화면 뿌리기
	@GetMapping("/reception/{status}")
	public String requested(@SessionAttribute("memId")String memId, @PathVariable String status, Model model, @RequestParam(value = "alarmDocCode", required = false)String alarmDocCode) {
		
			
			 //리팩토링
			List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
			switch(status) {
				case "requested":
					dataList = service.getRequested(memId);
					model.addAttribute("title","결재대기");
					model.addAttribute("count",dataList.size());
					model.addAttribute("alarmDocCode",alarmDocCode);
					break;
				case "processing":
					dataList = service.getProcessing(memId);
					model.addAttribute("count",dataList.size());
					model.addAttribute("title","결재진행");
					break;
				case "processed":
					dataList = service.getProcessed(memId);
					model.addAttribute("count",dataList.size());
					model.addAttribute("title","결재완료");
					break;
				case "canceled":
					dataList = service.getCanceled(memId);
					model.addAttribute("title","결재취소");
					break;
				case "reference":
					dataList = service.getReference(memId);
					model.addAttribute("title","결재참조");
					break;
			}
			
			// 카드 값
		   int requestedCnt = service.getCountAppv(memId);
		   int processingCnt = service.getProcessingCnt(memId);
		   int processedCnt = service.getProcessedCnt(memId);
		   int cancledCnt = service.getCanceledCnt(memId);
		   int referenceCnt = service.getReferenceCnt(memId);
			
			
			// 네브바
			model.addAttribute("menu","approval");
			// 리팩토링
			model.addAttribute("dataList",dataList);
			
			
			model.addAttribute("requestedCnt",requestedCnt);
			model.addAttribute("processingCnt",processingCnt);
			model.addAttribute("processedCnt",processedCnt);
			model.addAttribute("cancledCnt",cancledCnt);
			model.addAttribute("referenceCnt",referenceCnt);
			
		return "workfit/approval/reception";
	} // 화면 뿌리기 함수 끝
	

	// 승인 처리
	@PostMapping(value="/appApproval", produces = "text/plain;charset=utf-8")	// get방식은 body를 넣지 않는다 
	@ResponseBody			// ajax 요청 URL엔 이것이 꼭 있어야 함, response.getWriter (완전메롱 페이지로 가는게 아니라 그대로 들어감)
	public String appApproval(@RequestBody Map<String, String> aVO) {
		log.debug("승인하기 위한 문서번호" + aVO.get("docCode"));
		log.debug("승인하기 위한 의견" + aVO.get("content"));
		log.debug("승인하기 위한 아이디" + aVO.get("id"));
		String approvalDocCode = aVO.get("docCode");
		String approvalComment = aVO.get("content");
		String id = aVO.get("id");
		
		// 최종 결과 전송
		String result="";
		
		// 의견 등록
		ApprovalVO forApprovalVO = new ApprovalVO();
		forApprovalVO.setApprovalDocCode(approvalDocCode);
		forApprovalVO.setApprovalComment(approvalComment);
		forApprovalVO.setMemId(id);
		
		int commentResult = service.updateAppvComment(forApprovalVO);
		log.debug("의견을 등록했어요~! " + commentResult);
		
		// 해당 결재 데이터 뽑기 (해당 결재문서 + 내 아이디)
//		ApprovalVO forfinalCheck = new ApprovalVO();
//		forfinalCheck.setMemId(id);
//		forfinalCheck.setApprovalDocCode(approvalDocCode);
//		
		ApprovalVO finalCheck = new ApprovalVO();
		finalCheck = service.selectAppv(forApprovalVO);
		
		// 최종 결재자인지 확인!
		int approvalFinalStatus = service.approvalFlagCheck(approvalDocCode);
		log.debug("이번 문서의 가장 마지막 결재 순번은 ~? {}",approvalFinalStatus);
		String myAppStatus = finalCheck.getApprovalFlag();
		
		// 결재 승인 처리
		int resultMid = service.updateMidApproval(finalCheck);
		
		result = (resultMid == 1)? "승인" : "미승인";
		
		log.debug("중간결재자 결재 완료 {}",resultMid);
		
		log.debug("나의 결재 스테이터스 값 {}",myAppStatus);
		
		
		if(myAppStatus.equals( approvalFinalStatus+"")) {
			int resultFinal = service.updateFinalApproval(finalCheck.getApprovalDocCode());
			log.debug("최종승인완료 {}",resultFinal);
			result = (resultFinal == 1)? "승인" : "미승인";
		}
		return result;
	}	// 승인 처리 함수 끝 
	
		
	
		// 반려 처리 
		@PostMapping(value="/appReject", produces = "text/plain;charset=utf-8")	// get방식은 body를 넣지 않는다 
		@ResponseBody			// ajax 요청 URL엔 이것이 꼭 있어야 함, response.getWriter (완전메롱 페이지로 가는게 아니라 그대로 들어감)
		public String appReject(@RequestBody Map<String, String> aVO) {
			log.debug("반려하기 위한 문서번호" + aVO.get("docCode"));
			log.debug("반려하기 위한 의견" + aVO.get("content"));
			log.debug("반려하기 위한 아이디" + aVO.get("id"));
			String rejectDocCode = aVO.get("docCode");
			String rejectComment = aVO.get("content");
			String id = aVO.get("id");
			
			// 최종 결과 전송 변수
			String result="";
			
			// 반려 사유 등록
			ApprovalVO forApprovalVO = new ApprovalVO();
			forApprovalVO.setApprovalDocCode(rejectDocCode);
			forApprovalVO.setApprovalComment(rejectComment);
			forApprovalVO.setMemId(id);
			
			int commentResult = service.updateAppvComment(forApprovalVO);
			log.debug("반려사유를 등록했어요~! " + commentResult);
			
			// 해당 결재 데이터 뽑기 (해당 결재문서 + 내 아이디)
//		ApprovalVO forfinalCheck = new ApprovalVO();
//		forfinalCheck.setMemId(id);
//		forfinalCheck.setApprovalDocCode(approvalDocCode);
//		
//			ApprovalVO finalCheck = new ApprovalVO();
//			finalCheck = service.selectAppv(forApprovalVO);
//			
//			// 최종 결재자인지 확인!
//			int approvalFinalStatus = service.approvalFlagCheck(approvalDocCode);
//			log.debug("이번 문서의 가장 마지막 결재 순번은 ~? {}",approvalFinalStatus);
//			String myAppStatus = finalCheck.getApprovalFlag();
			
			// 결재 반려 처리
			int resultReject = service.rejectApproval(forApprovalVO);
			log.debug("반려 완료 {}",resultReject);
		
			result = (resultReject == 1)? "반려" : "미반려";
			
			
//			log.debug("나의 결재 스테이터스 값 {}",myAppStatus);
			
			int resultFinalReject = service.updateFinalRej(rejectDocCode);
			
			log.debug("최종 문서 반려 완료 {}",resultFinalReject);
			result = (resultFinalReject == 1)? "반려" : "미반려";
		
		return result;
		
	} // 반려 처리 함수 끝
		
	
		// 대시보드 결재할 것
		@GetMapping("/reception/getRequested")
		@ResponseBody
		public List<Map<String, Object>> getRequested(@SessionAttribute("memId")String memId) {
			List<Map<String, Object>> dataList = new ArrayList<Map<String,Object>>();
			dataList = service.getRequested(memId);
			return dataList;
		}	
		
		
		
}
