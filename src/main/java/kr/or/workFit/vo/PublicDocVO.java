package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PublicDocVO {
	private String publicDocCode;
	private String coCode;
	private String publicDocName;
	private long publicDocSize;
	private String publicDocNewname;
	private String publicDocPath;
	private String publicDocType;
	private Date publicDocDate;
}
