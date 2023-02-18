package kr.or.workFit.controller.chatbot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.chatbot.ChatBotService;
import kr.or.workFit.vo.ChatBotFAQVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/chatbot")
public class ChatBotController {
	
	@Autowired
	private ChatBotService chatBotService;
	
	@GetMapping("/main")
	public String chatMain(Model model) {
		log.debug("chatBotMain 입니다.");
		model.addAttribute("menu","board");
		return "workfit/chatbot/chatBotMain";
	}
	
	@GetMapping("/get/{selectValue}/{level}")
	@ResponseBody
	public List<ChatBotFAQVO> getChatBot (
			@SessionAttribute("memCo") String coCode,
			@SessionAttribute("memId") String memId,
			@PathVariable("level") String level,
			@PathVariable("selectValue") String selectValue,
			@RequestParam(value = "preValue", required = false) String preValue
			){
		log.debug("chatBot Get Controller ::::");
		log.debug("selectValue ::"+selectValue);
//		int cntValue = Integer.parseInt(level)+1;
//		String cntReturn = String.valueOf(cntValue) ;
		
		List<Map<String, String>> mapList = new ArrayList<Map<String,String>>();
		Map<String, String> map = new HashMap<String, String>();
		
		if(level.equals("0")) {
			log.debug("이전 값 ::::"+preValue);
			System.out.println("값이 0이 들어왔습니다!!!!:::::");
			System.out.println("고로 더 이상 값이 존재하지 않는 최종 답변을 위한 상태임을 표시할 수 있죠.");
			System.out.println("그러면 어떻게 해야 다음 전송에 있어서 전송 값이 전달이 될까요???");
			map.put("level", String.valueOf(preValue));
			
		}else {
			map.put("level", String.valueOf(level));
		}
		map.put("coCode", coCode);
		map.put("memId", memId);
		map.put("chatBotUq", selectValue);
		
		return chatBotService.getChat(map) ;
	}
	@GetMapping("/check")
	@ResponseBody
	public Map<String, String> checkChatbot(@SessionAttribute("memCo") String coCode){
		Map<String, String> map = new HashMap<String, String>();
		
		int result = chatBotService.checkCreatedChatbotCode(coCode);
		if(result != 0) {
			log.debug("Chatbot Code is existed!");
			map.put("isExisted", "y");
		}else {
			log.debug("Chatbot Code is not existed!");
			System.out.println("구매에 대해 특정 로직이 주어진다면 수정해야함...!");
			// Create Chatbot Code
			chatBotService.createChatbotCode(coCode);
			// Update Chatbot Code to Co Column
			chatBotService.updateCoChatbotCode(coCode);
			map.put("isExisted", "y");
		}
		return map;
	}
	
	@GetMapping("/status")
	@ResponseBody
	public Map<String, String> checkStatusChatbot(@SessionAttribute("memCo") String coCode){
		Map<String, String> map = new HashMap<String, String>();
		log.debug("ChatbotStatus :::");
		map = chatBotService.getInfoUse(coCode);
		return map;
	}
	@GetMapping("/getAnswer/{chatbotQ}")
	@ResponseBody
	public ChatBotFAQVO getAnswer(@SessionAttribute("memCo") String coCode,
			@PathVariable("chatbotQ") String chatbotQ
			){
		log.debug("getAnswer :::");
		ChatBotFAQVO chatbotFAQVO = new ChatBotFAQVO();
		chatbotFAQVO = chatBotService.getAnswer(chatbotQ);
		return chatbotFAQVO;
	}
	
	
	
	
	
	@PostMapping("/insert/{coCode}")
	public HashMap<String, String> insertChatBot(
			@PathVariable("coCode") String coCode,
			Model model
			) {
		log.debug("chatBot Insert Controller ::::");
		return null;
	}
	
}
