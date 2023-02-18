package kr.or.workFit.service.chatbot;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.ChatBotFAQVO;

public interface ChatBotService {
//	public List<Map<String, String>> getChat(Map<String,String> map);
	public List<ChatBotFAQVO> getChat(Map<String,String> map);
//	public Map<String, String> getChat(Map<String,String> map);
	
	public ChatBotFAQVO getAnswer(String chatbotQ);
	
	public Map<String, String> getInfoUse(String coCode);
	public int checkCreatedChatbotCode(String coCode);
	public int createChatbotCode(String coCode);
	public int updateCoChatbotCode(String coCode);
}
