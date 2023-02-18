package kr.or.workFit.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class ApprovalDocVO {
	private String approvalDocCode;
	
	private String approvalType;
	
	private Date approvalDeadline;
	
	private char approvalScope;
	
	private char approvalDocStatus;
	
	private String approvalAccessAuth;
	
	private String approvalDocTitle;
	
	private String approvalTemplateCode;
	
	private String approvalContent;
	
	private String approvalBookmark;

	private List<ApprovalVO> approvalList;
	
	private List<ApprovalAttachVO> approvalAttachList;
	
	private List<ApprovalReferenceVO> approvalReferenceList;
	
	private String approvalSavecheck;
	
	private Date approvalDate;
	
	private String memCo;

	@Override
	public String toString() {
		return "ApprovalDocVO [approvalDocCode=" + approvalDocCode + ", approvalType=" + approvalType
				+ ", approvalDeadline=" + approvalDeadline + ", approvalScope=" + approvalScope + ", approvalDocStatus="
				+ approvalDocStatus + ", approvalAccessAuth=" + approvalAccessAuth + ", approvalDocTitle="
				+ approvalDocTitle + ", approvalTemplateCode=" + approvalTemplateCode + ", approvalBookmark="
				+ approvalBookmark + ", approvalList=" + approvalList + ", approvalAttachList=" + approvalAttachList
				+ ", approvalReferenceList=" + approvalReferenceList + ", approvalSavecheck=" + approvalSavecheck + "]";
	}

	
	
}
