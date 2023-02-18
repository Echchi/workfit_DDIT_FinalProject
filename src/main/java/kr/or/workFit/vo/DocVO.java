package kr.or.workFit.vo;

import java.io.Serializable;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DocVO implements Serializable{
	private String docCode;
	private String memId;
	private String deptCode;
	
//	private MyDocVO myDocVO;
//	private List<MyDocVO> myDocList;
}
