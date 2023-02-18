package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyVO {
	private String boardReplyCode;
	private String postCode;
	private String memId;
	private String replyContent;
	private Date replyDate;
	
	

}
