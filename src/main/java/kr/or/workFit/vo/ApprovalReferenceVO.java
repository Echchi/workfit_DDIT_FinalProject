package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalReferenceVO {
	private String approvalReferenceCode;
	private String approvalDocCode;
	private String memId;
	private String approvalReferenceContent;
	private Date approvalReferenceDate;
	private String memName;
	private String memGrade;

	
	
}
