package kr.or.workFit.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatBotFAQVO implements Serializable{
	
	private String chatbotQ;
	private String chatbotIdFk;
	private String chatbotUq;
	private String chatbotTitle;
	private String chatbotA;
	private int chatbotHitup;
	
	private int level;
	private String endStatus;
	private String chatbotType;
	
}	
