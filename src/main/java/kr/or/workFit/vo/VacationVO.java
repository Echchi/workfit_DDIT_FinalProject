package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class VacationVO {
	private String vCode;
	private String memIdFk;
	private String vTypeFk;
	private Date vStart;
	private Date vEnd;
	private String vReason;
	// 종은 추가 - 휴가테이블 휴가 종류명
	private String vcType;

}
