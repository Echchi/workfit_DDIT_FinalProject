package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailTargetVO {
	// 영호가 추가함 원활한 진행을 위해서 ㅎㅎ 
	private String memEmail;
	private String emailTargetCode;
	private String emailCode;
	private String memId;
	private String targetStatus;
	private String emailReadStatus;
	private String deleteStatus;
	private char emailStatus;

	// 영호가 추가함 원활한 진행을 위해서 ㅎㅎ 
	private String mailFlag;
	private String memName;
}
