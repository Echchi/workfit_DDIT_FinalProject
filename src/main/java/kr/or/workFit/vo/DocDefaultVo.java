package kr.or.workFit.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public  class DocDefaultVo implements Serializable{

	private String deptDocCode;
	private String docCode;
	private String deptDocName;
	private long deptDocSize;

}
