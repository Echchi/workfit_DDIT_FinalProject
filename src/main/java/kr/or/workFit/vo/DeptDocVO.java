package kr.or.workFit.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeptDocVO extends DocVO implements Serializable{
	/**
	 * 부서문서코드
	 */
	private String deptDocCode;
	private String docCode;
	private String deptDocName;
	private long deptDocSize;
	private String deptDocNewname;
	private String deptDocPath;
	private String deptDocType;
	private Date deptDocDate;
//	private DocVO docVO;
}
