package kr.or.workFit.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyDocVO extends DocVO implements Serializable{
	private String myDocCode;
	private String docCode;
	private String myDocName;
	private long myDocSize;
	private String myDocNewname;
	private String myDocPath;
	private String myDocType;
	private Date myDocDate;
//	private DocVO docVO;
}
