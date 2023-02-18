package kr.or.workFit.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NotificationVO {
	private String notNum;
	private String notSender;
	private String notReceiver;
	private String notContent;
	private String notIsread;
	private String notRelatedUrl;
	private String requestType;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd HH:mm")
	private Date notSendedDate;
	
	// 날짜를 String 타입으로도 받아주기 위해 그냥 새로 선언 
	private String notStringDate;
	
	private String memProfileUrl;
	
	// 발신자의 프로필 사진을 쉽게 구하기 위해서 멤버변수를 새로 선언함 
	private String senderProfileUrl;
	
	private String notCurrNum;
}
