package kr.or.workFit.vo.organizationhelper;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TreeNode {
	private String deptCode;
	private String coCode;
	private String deptName;
	private String deptDirect;
	
	private String deptFk;
	private String memId;
	private String memName;
	private String memEmail;
	private String memLv;
	private String memJobGrade;
	private String memProfileUrl;
	private String flagForClassifyingDeptAndMem;
	

}
