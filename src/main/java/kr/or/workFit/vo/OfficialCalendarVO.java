package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OfficialCalendarVO {
	private String officialDateCode;
	private String coCode;
	private Date officialDate;
}
