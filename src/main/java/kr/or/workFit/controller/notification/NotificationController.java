package kr.or.workFit.controller.notification;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.or.workFit.controller.mail.MailController;
import kr.or.workFit.service.notification.NotificationService;
import kr.or.workFit.vo.ApprovalDocVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.NotificationVO;
import kr.or.workFit.vo.sserepository.EmitterRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit")
public class NotificationController {
	
	@Inject
	private NotificationService notificationService;
	
	@GetMapping(value= "/notification/subscribe")
	public SseEmitter subscribeProcess(Model model, @SessionAttribute("member") MemberVO member,@RequestParam(value="remainAlarmFlag", required = true)String remainAlarmFlag) {
		
		EmitterRepository emitterRepo = EmitterRepository.getInstance();
		
		String mem_id = member.getMemId();
//		String emitterId = makeTimeIncludeId(mem_id);
		
		
		// 기존에 이미 이벤트 에미터가 있다면 있던 것을 리턴하도록 한다 
//		if(emitterRepo.isContainEmitterId(mem_id)) {
//			
//			Map<String, SseEmitter> map = emitterRepo.findAllEmitterStartWithByMemberId(mem_id);
//			for(String eId : map.keySet()) {
//				System.out.println(eId);
//			}
//			
//			// 아래 함수는 읽지 않은 알람을 클라이언트한테 보내는 함수인데 이 함수는 클라이언트가 웹에서 활동을 하면서 페이지를 새롭게 request할 때마다 띄운다. 
//			sendUnreadNotification(mem_id,remainAlarmFlag);
//			
//			return emitterRepo.getOneEmitter(mem_id);
//			
//		}
		
		// 이벤트 에미터가  없을 경우 아래 로직 실행(이벤트 에미터를 새로 만듦 + 레포지토리에 저장)
		SseEmitter emitter = null;
		emitter = new SseEmitter(300000000L); // 시간은 30만초?? 시연에 아무 지장 없음 
		emitter.onTimeout(() -> emitterRepo.deleteEmitter(mem_id));
		emitterRepo.save(mem_id, emitter);
		
		
		Map<String, SseEmitter> map = emitterRepo.findAllEmitterStartWithByMemberId(mem_id);
		for(String eId : map.keySet()) {
			System.out.println("에미터 키값 확인"+eId);
		}
		

		
		// DB에서 알림에 대한 데이터를 끄집어와서 거기에 현재 로그인한 회원한테 보내진 알림데이터가 있을 경우 sendNotification을 해준 다음에 emitter를 리턴하도록 하는 로직을 추가적으로 작성
		// 위 줄에서 설명한 로직을 여기다가 작성해도 되는 이유는 어차피 여기라인은 최초 로그인했을 때에 한해서만 실행될 부분이므로   
		System.out.println("영호의 리메인 알람 플래그 확인"+remainAlarmFlag);
		
		String requestType = "subscribe";
		sendUnreadNotification(mem_id,remainAlarmFlag,requestType);
		
		
//		if("remain".equals(remainAlarmFlag)) {
//			
//			List<NotificationVO> notVOList = notificationService.selectReceivedNotification(mem_id);
//			// 로그인한 회원을 수신자로 한 알람들 중 확인 유무가 false 인 녀석들만 다시 따로 분류하여 데이터를 담아놓을 필요도 있을 것 
//			List<NotificationVO> uncheckedNotList = new ArrayList<NotificationVO>();
//			
//			for(NotificationVO notVO : notVOList) {
//				
//				if("false".equals(notVO.getNotIsread())) {
//					uncheckedNotList.add(notVO);
//					
//				}
//			}
//			
//			
//			Map<String, SseEmitter> emitterMap = emitterRepo.findAllEmitterStartWithByMemberId(mem_id);
//			
//			for(NotificationVO notVO : uncheckedNotList) {
//				for(Map.Entry<String, SseEmitter> ent : emitterMap.entrySet()) {
//					
//					String eventId = makeTimeIncludeId(mem_id);
//					sendNotification(ent.getValue(), eventId, ent.getKey(), notVO);
//				}
//				
//			}
//			
//			
//			
//		}
		
		
		return emitter;
	}
	
	@ResponseBody
	@PostMapping(value= "/notification/isAnyUnread")
	public ResponseEntity<Map<String,Object>> isAnyUnread(@SessionAttribute("memId")String memId) {

		Map<String,Object> map = new HashMap<>(); // entity로 map을 리턴함 이 녀석한테 정보들을 다 담아서 보내주는 것임!! 
		
		// 일단 알람 테이블에서 로그인한 회원을 수신자로 한 모든 알람들을 가져온다     
		List<NotificationVO> notVOList = notificationService.selectReceivedNotification(memId);
		// 로그인한 회원을 수신자로 한 알람들 중 확인 유무가 false 인 녀석들만 다시 따로 분류하여 데이터를 담아놓을 필요도 있을 것 
		List<NotificationVO> uncheckedNotList = new ArrayList<NotificationVO>();
		
		Map<String,String> senderProfileMap = new HashMap<String, String>(); // 알림 발신자의 프로필 사진을 띄우기 위해서 임시방편으로 만든 Map객체 
		for(NotificationVO notVO : notVOList) {
			System.out.println("영호의 notVO 날짜 확인"+notVO.getNotSendedDate());
			if("false".equals(notVO.getNotIsread())) {
				uncheckedNotList.add(notVO);
				
			}
			
			senderProfileMap.put(notVO.getNotSender(),notificationService.selectSenderProfile(notVO.getNotSender()));
			
		}
		
		map.put("senderProfileMap", senderProfileMap);
		
		map.put("notVOList",notVOList);
		map.put("uncheckedNotList",uncheckedNotList);
		
		ResponseEntity<Map<String,Object>> entity = null;
		if(uncheckedNotList.size() != 0) {
			map.put("isRemain", "remain");
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		}else {
			map.put("isRemain", "notRemain");
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		}
//		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		
		
		return entity;
	}
	
	@ResponseBody
	@PostMapping(value = "/notification/readProcess")
	public void notReadProcess(@RequestParam(value = "notNum", required = false)String notNum) {
		notificationService.updateReadState(notNum);
	}
	
	@ResponseBody
	@PostMapping(value = "/notification/deleteProcess")
	public void notDeleteProcess(@RequestParam(value = "notNum", required = false)String notNum) {
		notificationService.deleteNotification(notNum);
	}
	
	
	@ResponseBody
	@PostMapping(value = "/notification/payrequest")
	public void paymentRequest(Model model, @SessionAttribute("member") MemberVO member, @RequestParam Map<String,Object> rows) {
		EmitterRepository emitterRepo = EmitterRepository.getInstance();
		
		// DB에다가 결재 요청에 대한 데이터를 insert함  
		NotificationVO notiVO = new NotificationVO();
		
//		private int notNum;
//		private String notSender;
//		private String notReceiver;       
//		private String notContent;
//		private String notIsread;
//		private String notRelatedUrl;
		
		// notiVO에다가 수신자 / 알림 내용 / 알림URL / 발신자(여기서는 결재 상신자)를 집어넣어 줘야 함 
		for(String key : rows.keySet()) {
			System.out.println("실시간 알림 key값 확인 : " + key);
		}
		
		System.out.println("key값 이거 맞아? : "+rows.get("docCode"));
		System.out.println("key값 이거 맞아? : "+rows.get("approvalVO[0][memId]"));
		System.out.println("key값 이거 맞아? : "+rows.get("approvalVO[0][approvalFlag]"));
		
		
		// docCode(요청을 보낸 문서의 문서코드)로 문서의 제목을 꺼내오자 
		String docCode = (String)rows.get("docCode");
		ApprovalDocVO docVO = notificationService.selectDocInfo(docCode);
		notiVO.setNotReceiver((String)rows.get("approvalVO[1][memId]"));
		notiVO.setNotSender((String)rows.get("approvalVO[0][memId]"));
		
		System.out.println("영호의 결재 요청 확인 1 "+(String)rows.get("approvalVO[1][memId]"));
		System.out.println("영호의 결재 요청 확인 2 "+(String)rows.get("approvalVO[0][memId]"));
		
		
		notiVO.setNotContent((String)rows.get("approvalVO[0][memName]")+"님이 "+ docVO.getApprovalDocTitle() + " 결재 요청을 하였습니다.");
		notiVO.setNotRelatedUrl("/workfit/approval/reception/requested?alarmDocCode="+docCode);
		Date now = new Date();
		 
	 
	   SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd HH:mm");
	 
	   String formatedNow = formatter.format(now);
	   
	   notiVO.setNotStringDate(formatedNow);
		
		// 실시간 알림을 하기 전에 우선 DB에 데이터를 저장해야 됨 
		notificationService.insertNotification(notiVO);
		
		
		notiVO.setNotNum(notiVO.getNotCurrNum());
		
		// 아래는 알림을 주는 로직 
		String eventId = makeTimeIncludeId(notiVO.getNotReceiver());
		
		// 수신자와 관련된 모든 에미터 아이디(알림 이벤트를 주는 통로들의 식별자)들을 색출해서 map에 담음 
		Map<String, SseEmitter> map = emitterRepo.findAllEmitterStartWithByMemberId(notiVO.getNotReceiver());
		
		for(Map.Entry<String, SseEmitter> ent : map.entrySet()) {
			notiVO.setRequestType("payrequest");
			
			String senderProfileUrl = notificationService.selectSenderProfile(notiVO.getNotSender());
			
			notiVO.setSenderProfileUrl(senderProfileUrl);
			
			sendNotification(ent.getValue(), eventId, ent.getKey(), notiVO);
		}
		
		
	}
	
	private void sendNotification(SseEmitter emitter, String eventId, String emitterId, NotificationVO notificationVO) {
	    try {
	    	
	        emitter.send(SseEmitter.event()
	                     .id(eventId)
	                     .data(notificationVO));
	    } catch (IOException exception) {
	    	exception.printStackTrace();
	    }
	}
	
	private String makeTimeIncludeId(String memberId) {
		
        return memberId + "_" + System.currentTimeMillis();
	}
	
	private void sendUnreadNotification(String mem_id, String remainAlarmFlag,String requestType) {
		System.out.println("sendUnreadNotification실행되는지  확인");
		EmitterRepository emitterRepo = EmitterRepository.getInstance();
		
		System.out.println("영호의 리메인 알람 플래그 확인"+remainAlarmFlag);
		if("remain".equals(remainAlarmFlag)) {
			
			List<NotificationVO> notVOList = notificationService.selectReceivedNotification(mem_id);
			// 로그인한 회원을 수신자로 한 알람들 중 확인 유무가 false 인 녀석들만 다시 따로 분류하여 데이터를 담아놓을 필요도 있을 것 
			List<NotificationVO> uncheckedNotList = new ArrayList<NotificationVO>();
			
			for(NotificationVO notVO : notVOList) {
				
				
				if("false".equals(notVO.getNotIsread())) {
					uncheckedNotList.add(notVO);
					
				}
			}
			
			
			Map<String, SseEmitter> emitterMap = emitterRepo.findAllEmitterStartWithByMemberId(mem_id);
			
			for(NotificationVO notVO : uncheckedNotList) {
				for(Map.Entry<String, SseEmitter> ent : emitterMap.entrySet()) {
					
					notVO.setRequestType(requestType);
					
					String eventId = makeTimeIncludeId(mem_id);
					sendNotification(ent.getValue(), eventId, ent.getKey(), notVO);
				}
				
			}
			
			
			
		}
	}

}
