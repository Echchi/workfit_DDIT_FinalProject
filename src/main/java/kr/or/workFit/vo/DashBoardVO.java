package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DashBoardVO {
	private String dashboardCode;
	private String dashListCode;
	private String memId;
	private String dashSeq;
	private DashBoardListVO dashBoardListVO;
	
	

}
