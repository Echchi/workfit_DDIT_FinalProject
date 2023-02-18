package kr.or.workFit.controller.mail;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

import kr.or.workFit.service.mail.MailService;
import kr.or.workFit.vo.BoardAttachVO;
import kr.or.workFit.vo.EmailAttachVO;
import kr.or.workFit.vo.EmailTargetVO;
import kr.or.workFit.vo.EmailVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.PostVO;
import kr.or.workFit.vo.byhutil.CurrMailCode;
import lombok.extern.slf4j.Slf4j;

/**
 * 
 * @author jjeuuun
 *
 */
@Slf4j
@Controller
@RequestMapping("/workfit")
public class MailController {
	
	@Inject
	MailService mailService;
	
	@GetMapping(value = "/mail/mailView")
	public String goMailMainView(Model model, @SessionAttribute("member") MemberVO member) {
		log.info("mail 메인 뷰 이동하기");
		
		model.addAttribute("menu","mail");
		// 받은 메일함 
		List<EmailVO> receiveMailList = mailService.selectReceiveMailList(member);
		
		
		model.addAttribute("mailList",receiveMailList);
		
		return "workfit/mail/sendedmail";
	}
	
	@GetMapping(value = "/mail/mailWrite")
	public String goMailWriteView(Model model,@RequestParam(value="mailReceiverId",required = false)String mailReceiverId) {
		log.info("mail 작성하는 뷰 이동하기");
		
		model.addAttribute("menu","mail");
		model.addAttribute("modifyFlag","no");
		
		
//		System.out.println("if문 바깥 mailReceiverId확인 : "+mailReceiverId);
		if(mailReceiverId != null) {
//			System.out.println("if문 안쪽 mailReceiverId확인 : "+mailReceiverId);
			MemberVO member = mailService.selectMemData(mailReceiverId);
			Gson gson = new Gson();
			
			// 에러방지를 위한 더미데이터 삽입 시작 
			member.setMemApproveStatus('1');
			member.setUsageStatus('1');
			member.setMemGender('1');
			member.setMemSalary(0);
			// 에러방지를 위한 더미데이터 삽입 끝  
			
			model.addAttribute("mailReceiver",member);
			model.addAttribute("mailReceiverJsonString",gson.toJson(member));
		}
		
		
		return "workfit/mail/writemail";

	}
	
	@GetMapping(value = "/mail/memSearch")
	public String goCompanyTree(Model model,String memId) {
		log.info("mail 사원 검색하는 자식창 띄우기");
		
		if(memId != null || "".equals(memId)) {
			Gson gson = new Gson();
			MemberVO member = mailService.selectMemData(memId);
			
			// 에러방지를 위한 더미데이터 삽입 시작 
			member.setMemApproveStatus('1');
			member.setUsageStatus('1');
			member.setMemGender('1');
			member.setMemSalary(0);
			// 에러방지를 위한 더미데이터 삽입 끝  
			
			model.addAttribute("mailReceiver",gson.toJson(member));
		}
		
		return "workfit/main/noTiles/companyMemberSearch";
	}
	/**
	 * 
	 * @param model
	 * @param member
	 * @param mailFlag
	 * @return
	 */
	@GetMapping(value = "/mail/sendedMailView")
	public String goSendedMailView(Model model, @SessionAttribute("member") MemberVO member, String mailFlag) {
		log.info("메일함 이동하기");
		
		model.addAttribute("menu","mail");
		
		List<EmailVO> mailList = new ArrayList<EmailVO>();
		String mailListFlag = "";
		if("sended".equals(mailFlag)) {
			// 보낸 메일함 
			mailList = mailService.selectSendMailList(member);
			mailListFlag = "sendList";
		}else if("received".equals(mailFlag)) {
			// 받은 메일함 
			mailList = mailService.selectReceiveMailList(member);
			mailListFlag = "receiveList";
		}else if("important".equals(mailFlag)){
			// 중요 메일함 
			mailList = mailService.selectReceiveImportantMailList(member);
			mailListFlag = "importantList";
			
		}else if("temp".equals(mailFlag)){
			// 임시 메일함 
			mailList = mailService.selectTempMailList(member); 
			mailListFlag = "tempList";
			
		}else {
			// 휴지통 
			mailList = mailService.selectTrashMailList(member);
			mailListFlag = "trashList";
		}
		
		
		
		
		
		model.addAttribute("mailList",mailList);
		model.addAttribute("mailListFlag",mailListFlag);
		return "workfit/mail/sendedmail";
	
	
	
	}
	
	@ResponseBody
	@PostMapping("/mail/deleteMail")
	public void delteMail(@SessionAttribute("memId")String memId, EmailTargetVO emailTargetVO) {
		log.debug("emailTargetVO 확인{}",emailTargetVO);
		// 받은 메일이든 보낸 메일이든 로그인 한 회원이 주체일 것임 
		emailTargetVO.setMemId(memId);
		
		// 아래 로직을 실행하기 위해서는 우선 삭제하려는 액션이 받은 메일함에서 일어난 것인지 보낸 메일함에서 일어난 것인지 구분해주는 것이 필요함 
		
		if("sendList".equals(emailTargetVO.getMailFlag())) { // 보낸 메일함
			System.out.println("보낸 메일함 if문 들어오는지 확인");
			// 보낸 메일함에서 삭제했을 경우 ==> email 테이블에서 email_status를 바꿔줘야 함 
			mailService.deleteMailAtSended(emailTargetVO);
		}
		
		if("receiveList".equals(emailTargetVO.getMailFlag())) { // 받은 메일함 
			
			System.out.println("받은 메일함 if문 들어오는지 확인");
			// 받은메일함에서 삭제했을 경우 ==> 로그인 한 회원을 셋팅해준다. email_target테이블에서 where절로 emailcode와 memId로 row하나를 특정지을수 있을 것  
			mailService.deleteMailAtReceived(emailTargetVO);
		}
		
	}
	
	@ResponseBody
	@PostMapping("/mail/updateImportantMail")
	public void updateImportantMail(@SessionAttribute("memId")String memId, EmailTargetVO emailTargetVO) {
		log.debug("emailTargetVO 확인{}",emailTargetVO);
		// 받은 메일이든 보낸 메일이든 로그인 한 회원이 주체일 것임 
		emailTargetVO.setMemId(memId);
		
		// 아래 로직을 실행하기 위해서는 우선 삭제하려는 액션이 받은 메일함에서 일어난 것인지 보낸 메일함에서 일어난 것인지 구분해주는 것이 필요함 
		
		if("sendList".equals(emailTargetVO.getMailFlag())) { // 보낸 메일함
			System.out.println("보낸 메일함 if문 들어오는지 확인");
			// 보낸 메일함에서 별모양 클릭했을 경우 ==> email 테이블에서 email_status를 바꿔줘야 함 
			
			
			mailService.updateMailAtSended(emailTargetVO);
		}
		
		if("receiveList".equals(emailTargetVO.getMailFlag())) { // 받은 메일함 
			
			System.out.println("받은 메일함 if문 들어오는지 확인(중요 메일)");
			// 받은메일함에서 삭제했을 경우 ==> 로그인 한 회원을 셋팅해준다. email_target테이블에서 where절로 emailcode와 memId로 row하나를 특정지을수 있을 것  
			mailService.updateMailAtReceived(emailTargetVO);
		}
		
	}
	
	
	@GetMapping(value = "/mail/mailDetail")
	public String mailDetailView(Model model, @SessionAttribute("member") MemberVO member, String emailCode, String mailListFlag, String memId) {
		
		log.info("메일 상세뷰 들어가기");
		
		
		// 메일을 작성한 회원에 대한 데이터 row하나 
		MemberVO mem = mailService.selectMemData(memId);
		
		// 이메일에 대한 데이터 row하나 
		EmailVO mail = mailService.selectEmailData(emailCode);
		
		// 이메일을 받은 사람들에 대한 데이터 row들  
		List<EmailTargetVO> mailTargetDatas = mailService.selectEmailTargetDatas(emailCode);
		
		
		List<EmailTargetVO> receiverVOList = new ArrayList<EmailTargetVO>();
		List<EmailTargetVO> refererVOList = new ArrayList<EmailTargetVO>();
		List<EmailTargetVO> hiderefererVOList = new ArrayList<EmailTargetVO>();
		
		for(EmailTargetVO emtVO : mailTargetDatas) {
			if("수신자".equals(emtVO.getTargetStatus())) {
				receiverVOList.add(emtVO);
			}else if("참조자".equals(emtVO.getTargetStatus())) {
				refererVOList.add(emtVO);
				
			}else {
				hiderefererVOList.add(emtVO);
			}
			
		}
		
		
		
		
		// 메일에 달린 첨부파일도 리스트 형태로 뽑아서 가져와야 함 
		List<EmailAttachVO> emailFileList = new ArrayList<EmailAttachVO>();
		emailFileList = mailService.selectMailAttachFile(emailCode);
		
		
		
		
		if(emailFileList != null && emailFileList.size() != 0) {
			
			
			model.addAttribute("mailAttachFile",emailFileList);
			
			Gson gson = new Gson();
			
			
			model.addAttribute("mailAttachFileJsonString",gson.toJson(emailFileList));
		}
		
		
		model.addAttribute("menu","mail");
		model.addAttribute("mailListFlag",mailListFlag);
		model.addAttribute("memData",mem);
		model.addAttribute("mailData",mail);
		
		model.addAttribute("receiverList",receiverVOList);
		model.addAttribute("refererList",refererVOList);
		model.addAttribute("hiderefererList",hiderefererVOList);
		
		String returnURL = "workfit/mail/mailDetail";
		// 임시메일함일 경우 상세뷰가 등록하는 폼으로 이동하도록 해야함 
		if("tempList".equals(mailListFlag)) {
			model.addAttribute("modifyFlag","yes");
			returnURL = "workfit/mail/writemail";
			
		}
		
		// 답장하기를 클릭해서 들어왔을 경우 
		if("replyMail".equals(mailListFlag)) {
			
			model.addAttribute("loginMember",member);
			model.addAttribute("replyFlag","yes");
			returnURL = "workfit/mail/writemail";
		}
		
		
		return returnURL;
	}
	
	
//	public void sendORtempSaveEmail(HttpServletRequest req, @RequestParam("receiverIdList") String receiverIdList,
//			@RequestParam("referIdList") String referIdList, @RequestParam("hideReferIdList") String hideReferIdList
//			) throws Exception {
	@ResponseBody
	@PostMapping(value = "/mail/sendmail", produces = "application/json;charset=UTF-8")
	public ResponseEntity<String> sendORtempSaveEmail(HttpServletRequest req,@SessionAttribute("member") MemberVO member, @RequestParam Map<String,Object> rows 
			) throws Exception {

		log.info("mail송신 또는 임시저장 처리");

		
		Gson gson = new Gson(); 
		
		Map<String,List<EmailTargetVO>> emailRelatedPerson = new HashMap<>();
		
		
		for(String key : rows.keySet()) {
			System.out.println(key);
			System.out.println(rows.get(key));
		}
		
		List<EmailTargetVO> receiver = gson.fromJson((String) rows.get("receiverIdList"),new TypeToken<List<EmailTargetVO>>(){}.getType());
		List<EmailTargetVO> referer = gson.fromJson((String) rows.get("referIdList"),new TypeToken<List<EmailTargetVO>>(){}.getType());
		List<EmailTargetVO> hidereferer = gson.fromJson((String) rows.get("hideReferIdList"),new TypeToken<List<EmailTargetVO>>(){}.getType());
		
		
		
		emailRelatedPerson.put("receiverIdList", receiver);
		emailRelatedPerson.put("referIdList", referer);
		emailRelatedPerson.put("hideReferIdList", hidereferer);
		
		// insert된 메일의 메일코드를 에이잭스의 success콜백 함수에 반환할 ResponseEntity 
		ResponseEntity<String> entity = null;
		
		
		
		
		
		if("yes".equals((String)rows.get("isUpdate"))) {  // 임시저장함에서 보내기를 클릭 했을 때!  
			// 업데이트 
			
			EmailVO mailVO = new EmailVO();
			
			mailVO.setEmailContent((String)rows.get("mailContent"));
			mailVO.setEmailTitle(((String)rows.get("mailTitle")));
			mailVO.setEmailStatus("0");
			mailVO.setMemId(member.getMemId());
			
			mailService.insertMail(mailVO);
			
			CurrMailCode instance = CurrMailCode.getInstance();
			String currMailCode = instance.getCurrMailCode();
		
			mailVO.setEmailCode(currMailCode);
			
			mailService.updateMail(mailVO);
//			String currMailCode = mailVO.getIq();
			
			
			// 먼저 기존에 있던 email_target테이블 속 데이터들을 지운다 
			mailService.deleteTargetDatas(mailVO);
			
			// 그 이후 그냥 insert시켜줌 기존에 했던 방식 대로 (emailCode는 동일하므로 상관없을것임)
			
			targetMailProcessing(emailRelatedPerson, currMailCode,'1');
			
			
			return entity;
		}
		
		
		
		
		// 임시저장일 경우
		if("true".equals(rows.get("isTempSave"))) {
			
			// 이미 DB에 있는 임시메일이면은 생성하는게 아니라 업데이트를 해줘야 됨 
//			mailService.isExistTempMail(rows.get(key))
			EmailVO mailVO = new EmailVO();
//			else {
				// Email 테이블에 대한 데이터 처리 
				mailVO.setEmailContent((String)rows.get("mailContent"));
				mailVO.setEmailTitle(((String)rows.get("mailTitle")));
				mailVO.setEmailStatus("1");
				mailVO.setMemId(member.getMemId());
				mailService.insertMail(mailVO);
				
				CurrMailCode instance = CurrMailCode.getInstance();
				String currMailCode = mailVO.getIq();
				
				instance.setCurrMailCode(currMailCode);
				
//				System.out.println(mailVO.getIq());
				
				
				// Email Target테이블에 대한 데이터 처리 
				targetMailProcessing(emailRelatedPerson, currMailCode,'1');
				return entity;
//			}
			
			
		
			
			
			
			// 첨부파일에 대한 처리 + 중요메일인지 아닌지 확인해서 이후에 들어올 때 중요메일 클릭한 상태가 유지되도록 해야함 ==> 이건 메소드 따로 파놓고 걔를 활용하는 식으로 가면 될듯?
			
		}else {   // 임시저장이 아닐 경우 ==> 중요메일 인지 아닌지 체크하는 과정 추가 필요
			if("true".equals(rows.get("isImportant"))) { // 중요 메일일 경우 
				EmailVO mailVO = new EmailVO();
				mailVO.setEmailContent((String)rows.get("mailContent"));
				mailVO.setEmailTitle(((String)rows.get("mailTitle")));
				mailVO.setEmailStatus("2");
				mailVO.setMemId(member.getMemId());
				
				mailService.insertMail(mailVO);
					
				String currMailCode = mailVO.getIq();
				entity = new ResponseEntity<String>(currMailCode,HttpStatus.OK);
				targetMailProcessing(emailRelatedPerson, currMailCode,'2');
				
				return entity;
			}else { // 중요 메일이 아닐 경우 
				EmailVO mailVO = new EmailVO();
				mailVO.setEmailContent((String)rows.get("mailContent"));
				mailVO.setEmailTitle(((String)rows.get("mailTitle")));
				mailVO.setEmailStatus("0");
				mailVO.setMemId(member.getMemId());
				
				mailService.insertMail(mailVO);
					
				String currMailCode = mailVO.getIq();
				entity = new ResponseEntity<String>(currMailCode,HttpStatus.OK);
				targetMailProcessing(emailRelatedPerson, currMailCode,'0');
				
				
				return entity;
			}
		}
		
		
		 
		
		
		
		
//		List<EmailVO> receiverList = objectMapper.readValue(receiverIdList, new TypeReference<List<EmailVO>>() {
//		});
//
//		
//		List<EmailVO> referList = objectMapper.readValue(referIdList,
//				new TypeReference<List<EmailVO>>() {
//				});
//		
//		List<EmailVO> hideReferList = objectMapper.readValue(hideReferIdList,
//				new TypeReference<List<EmailVO>>() {
//		});
		
		
//		for(EmailVO mailVO : receiverList) {
//			System.out.println("mailVO아이디 확인");
//			System.out.println("mailVO아이디 확인"+mailVO.getMemId());
//		}
		
		// 1. 우선 메일 테이블에 데이터 insert 
//		mailService.insertMail()
//		
//		
//
//		// 결재문서 인서트
//		int docCnt = service.insertApprovalDoc(approvalDocVO);
//
//		log.debug("결재문서 테이블 인서트 성공여부 : " + docCnt);
//		log.debug("결재문서 코드 생성여부 확인  : " + approvalDocVO.getApprovalDocCode());
//		String docCode = approvalDocVO.getApprovalDocCode();
//		for (ApprovalVO approvalVO : appList) {
//			approvalVO.setApprovalDocCode(docCode);
//			if (approvalVO.getApprovalComment() == null || approvalVO.getApprovalComment() == "") {
//				approvalVO.setApprovalComment("");
//			}
//			// 결재
//			int appCnt = service.insertApprovalLine(approvalVO);
//			log.debug("결재 테이블 인서트 성공여부 : " + appCnt);
//		}
//
//		// ApprovalReference 바인딩 List<ApprovalReferenceVO> referenceList =
//		for (ApprovalReferenceVO approvalReferenceVO : refList) {
//			approvalReferenceVO.setApprovalDocCode(docCode);
//			// 결재 참조 인서트
//			int refCnt = service.insertApprovalReference(approvalReferenceVO);
//			log.debug("결재 참조 테이블 인서트 성공여부 : " + refCnt);
//		}
//
//		// ApprovalAttachVO 바인딩
//		List<ApprovalAttachVO> attachList = new ArrayList<ApprovalAttachVO>();
//		ServletContext sc = req.getSession().getServletContext();
//		String realPath = sc.getRealPath("/resources/uploads/approvalAttach");
//		log.debug("리얼패스:" + realPath);
////		List<String> filePathList = new ArrayList<String>(); // 파일 경로 담을 리스트
//
//		for (int i = 0; i < fileList.size(); i++) {
//
//			String sharePath = "Y:\\upload";
//			String fileName = UUID.randomUUID().toString();
//			String fileType = fileList.get(i).getContentType().substring(fileList.get(i).getContentType().lastIndexOf("/")+1); 
//			
//			File shareFile = new File(sharePath + "/" + fileName + "." + fileType);
//
//			fileList.get(i).transferTo(shareFile);
//
//			ApprovalAttachVO attVO = new ApprovalAttachVO();
//			attVO.setApprovalAttachName(fileList.get(i).getOriginalFilename());
//			attVO.setApprovalAttachSavepath(sharePath);
//			attVO.setApprovalDocCode(docCode);
//			attVO.setApprovalAttachNewname(fileName);
//			attVO.setApprovalAttachSize(fileList.get(i).getSize());
//			attVO.setApprovalAttachType(fileType);
//
//			int attCnt = service.insertApprovalAttach(attVO);
//			log.debug("결재 첨부 테이블 인서트 성공여부 : " + attCnt);
//
//		}
//		return 1;
	}
	
	
	@PostMapping("/mail/insertFile")
	public String fileProcessing(HttpSession session,
			  Model model,
			  EmailVO emailVO,
			  HttpServletRequest req,
			  MultipartHttpServletRequest request,
			  @RequestParam(value="mailCode",required = false)String mailCode,@SessionAttribute("member") MemberVO member) throws IOException, Exception {
			
		Map<String, MultipartFile> fileMap = request.getFileMap();
		
		
		log.debug("파일맵:"+fileMap.values());
		
		log.info("영호의 메일코드 체크"+mailCode);
//		EmailVO emailVO = new EmailVO();
		
		log.info("영호의 파일맵 크기 체크"+fileMap.size());
		
		{
			List<EmailAttachVO> fileList = new ArrayList<EmailAttachVO>(); // << 이 코드도 왜 존재하는지 의문 
			

			MultipartFile[] emailFile = new MultipartFile[fileMap.size()];
			
			
			
			int index = 0;
			for (MultipartFile multipartFile : fileMap.values()) {
				EmailAttachVO fileInfo = new EmailAttachVO(multipartFile); // 이 코드는 왜 있는지 모르겠음 .... 필요 없는 코드 같음  
				fileList.add(fileInfo);
				emailFile[index++] = multipartFile;
			}
			
			log.debug("emailFile확인1 {}",emailFile);
			emailVO.setEmFile(emailFile); 
			
			log.debug("emailVO확인1 {}",emailVO);
			// emailFile이라는 MultipartFile 배열에서 요소 하나하나를 꺼내 각각의 EmailAttachVO에다가 파일관련 정보를 저장해준 후에 
			//이들을 리스트로 묶어서 emailVO에다가 List<EmailAttachVO> emailattachs라는 녀석을 쥐어다 줌 
			
			
		}
//		postVO.setMemId(postVO.getMemId());
//		postVO.setMemId("m001");
		
		emailVO.setEmailCode(mailCode);
		log.info("영호의 메일코드 체크2"+emailVO.getEmailCode());
		// 여기 까지 오게 되면 emailVO에는 List<EmailAttachFile> 과 mailCode가 셋팅되있을 것! 
		
		
		
		
//		int result = 0;
		
		mailService.insertAttachFile(req, emailVO);
		
//		if (result == 1) {
//			model.addAttribute("success","success");
//		} else {
//			model.addAttribute("message", "서버에러, 다시 시도해주세요!");
//		}
		
		
		
		
		model.addAttribute("menu","mail");
		// 받은 메일함 
		List<EmailVO> receiveMailList = mailService.selectReceiveMailList(member);
		
		
		model.addAttribute("mailList",receiveMailList);
		
		
		return "workfit/mail/sendedmail";
	}
	
	@GetMapping("/mail/downFile/{emailAttachCode}")
	public void getFile(HttpServletResponse response, @PathVariable String emailAttachCode) {
		EmailAttachVO dataFile = mailService.getFile(emailAttachCode);
		mailService.downFile(response,dataFile);
	}
	
	@GetMapping("/mail/showImgFile/{emailAttachCode}")
	public ResponseEntity<byte[]> showImgFile(@PathVariable String emailAttachCode, HttpServletRequest request, HttpServletResponse response) throws IOException {
		EmailAttachVO vo = mailService.getOneImgAttachFile(emailAttachCode);
		
		System.out.println("이미지 파일 컨트롤러 실행되??");
		File imgFile = new File(vo.getEmailAttachPath());
		
		FileInputStream fin = null;
		
		byte[] byteImgArray =  new byte[(int) imgFile.length()];;
		
		fin =new FileInputStream(imgFile);
		
		int read = 0;
		
		
		fin.read(byteImgArray);
		
		
		ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(byteImgArray,HttpStatus.OK);
		
		return entity;
	}
	
	public void targetMailProcessing(Map<String,List<EmailTargetVO>> emailRelatedPerson, String currMailCode, char receiverEmailStatus) {
		for(String key : emailRelatedPerson.keySet()) {
			String status = "";
			if("receiverIdList".equals(key)) {
				status = "수신자";
			}
			
			if("referIdList".equals(key)) {
				status = "참조자";
			}
			
			if("hideReferIdList".equals(key)) {
				status = "숨은 참조자";
			}
			
			
			for(EmailTargetVO vo : emailRelatedPerson.get(key)) {
				EmailTargetVO emtVO = new EmailTargetVO();
				emtVO.setEmailCode(currMailCode);
				emtVO.setMemId(vo.getMemId());
				emtVO.setMemEmail(vo.getMemEmail());
				emtVO.setTargetStatus(status);
				emtVO.setEmailStatus(receiverEmailStatus);
				
				
				mailService.insertEmailTarget(emtVO);
				
			}
		} // 이중 for문 끝... 
	}

	
	
	// 대시보드 메일
	@GetMapping("/dashGetMAil")
	@ResponseBody
	public List<EmailVO> dashGetMAil(@SessionAttribute("member")MemberVO member) {
		List<EmailVO> dataList = new ArrayList<EmailVO>();
		dataList = mailService.selectReceiveMailList(member);
		log.info("메일입니다 {}", dataList);
		return dataList;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
