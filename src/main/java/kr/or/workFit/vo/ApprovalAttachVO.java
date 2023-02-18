package kr.or.workFit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalAttachVO {
	private String approvalAttachCode;
	private String approvalDocCode;
	private String approvalAttachName;
	private String approvalAttachNewname;
	private String approvalAttachSavepath;
	private Date approvalAttachDate;
	private long approvalAttachSize;
	private String approvalAttachType;
	private List<MultipartFile> uploadFiles;

}
