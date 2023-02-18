package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ErrorReportVO {
	private String errorCode;
	private String memId;
	private String errorTitle;
	private String errorContent;
	private Date errorDate;
	
}
