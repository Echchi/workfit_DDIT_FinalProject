package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalNotificationVO {
	private String approvalNotificationCode;
	private String approvalCode;
	private String approvalNotificationType;
	private char approvalReadStatus;

	

}
