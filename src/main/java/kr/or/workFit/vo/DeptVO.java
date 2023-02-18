package kr.or.workFit.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DeptVO implements Serializable{
	private String deptCode;
	private String coCode;
	private String deptName;
	private String deptDirect;
	private int coUserSize;
		
	

}
