package kr.or.workFit.service.chatbot;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.chatbot.ChatbotMapper;
import kr.or.workFit.vo.ChatBotFAQVO;

@Service
public class ChatBotServiceImpl implements ChatBotService{
	
	@Autowired
	private ChatbotMapper chatbotMapper;

	@Override
	public List<ChatBotFAQVO> getChat(Map<String, String> map) {
		System.out.println("getChat() ....::");
		return chatbotMapper.getChat(map);
	}

	@Override
	public Map<String, String> getInfoUse(String coCode) {
		System.out.println("getInfoUser() ::: ");
		return chatbotMapper.getInfoUse(coCode);
	}

	@Override
	public int checkCreatedChatbotCode(String coCode) {
		System.out.println("checkCreatedChatbotCode() ::: ");
		return chatbotMapper.checkCreatedChatbotCode(coCode);
	}

	@Override
	public int createChatbotCode(String coCode) {
		return chatbotMapper.checkCreatedChatbotCode(coCode);
	}

	@Override
	public int updateCoChatbotCode(String coCode) {
		return chatbotMapper.updateCoChatbotCode(coCode);
	}

	@Override
	public ChatBotFAQVO getAnswer(String chatbotQ) {
		System.out.println("getAnswer() ::: ");
		return chatbotMapper.getAnswer(chatbotQ);
	}
	
}
