package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CertVO {
	private String certCode;
	private String memId;
	private String certCode2;
	private Date certDate;
	private String certContent;
}
