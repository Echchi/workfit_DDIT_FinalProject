package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginLogVO {
	private String loginLogCode;
	private String memId;
	private Date loginDate;
	private Date logoutDate;
	private String logIp;

}
