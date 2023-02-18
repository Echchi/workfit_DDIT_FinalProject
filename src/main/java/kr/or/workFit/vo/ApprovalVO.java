package kr.or.workFit.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ApprovalVO {
	
	private char delegationStatus;
	private int approvalStatus;
	private Date approvalDate;
	private String approvalMemGrade;
	private String approvalComment;
	private String approvalFlag;
	private String memId;
	private String approvalDocCode;
	private String approvalCode;
	private String startDate;
	private String endDate;
	private String memName;
	private String agreementStatus;
	
}
