package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalTemplateVO {
	private String approvalTemplateCode;
	private String coCode;
	private String approvalTemplateType;
	private String approvalTemplateTitle;
	private String approvalTemplateContent;
	private char approvalTemplateStatus;
	private String approvalTemplateBookmark;
	private String approvalData;
	
}
