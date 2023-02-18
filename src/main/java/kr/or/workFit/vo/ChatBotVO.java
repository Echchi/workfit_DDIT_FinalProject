package kr.or.workFit.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChatBotVO implements Serializable{

	private String chatbotId;
	private String chatbotStatus;

}
