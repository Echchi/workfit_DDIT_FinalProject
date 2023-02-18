package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TodayVO {
	private String todayCode;
	private String memId;
	private String todayContent;
	private Date todayDate;
	private String todayStatus;
	private int todayCheck;

}
