package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AbsenceDelegationVO {
	private String absenceDelegationCode;
	private String absenceMemId;
	private String delegationMemId;
	private Date absenceStartDate;
	private Date absenceEndDate;

}
