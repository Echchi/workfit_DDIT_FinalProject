package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class WorkVO {
	
//	@DateTimeFormat(pattern = "yyyyMMdd")
	private String workDate;
	private String memId;
	private String workStart;
	private String workEnd;
	private int workTime;
	private int restTime;
	private char lateStatus;

}
