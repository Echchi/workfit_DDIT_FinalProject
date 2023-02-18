package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeptCalendarVO {
	private String deptCalenCode;
	private String deptCode;
	private Date deptCalenStartDate;
	private Date deptCalenEndDate;
	private Date deptCalenTime;
	private String deptCalenTitle;
	private String deptCalenContent;
	private String deptCalenColor;
	private Date deptCalenDday;
	private int deptCalenPeriod;

	

}
