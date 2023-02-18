package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DashBoardListVO {
	private String dashListCode;		// 시퀀스 (대시보드 목록 번)
	private String dashName;			// 대시보드 이름
	private String dashImg;				// 대시보드 이미지 
	private char widgetStatus;			// 위젯 여부
	private String widgetMoveUri;		// 이동할 상세 uri
	private String widgetDataUri;		// 데이터 호출 uri 
	private String widgetContent;		// 위젯 내용 
	

}
