package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeceaseVO {
	private String deceaseCode;
	private String memId;
	private Date deceaseDate;
	private String deceaseReason;
	private int workedDate;
	
}
