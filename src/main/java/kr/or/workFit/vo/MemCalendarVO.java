package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemCalendarVO {
	
	private String id;					// = MEM_ID
	private int groupId;			// = MEM_CALEN_CODE
	private String start;			// = MEM_CALEN_START_DATE
	private String end;				// = MEM_CALEN_END_DATE
	private String title;			// = MEM_CALEN_TITLE
	private String memo;			// = MEM_CALEN_CONTENT
	private String color;			// = MEM_CALEN_COLOR
	private boolean allDay;			// = MEM_CALEN_ALLDAY
	private String textColor;		// = MEM_CALEN_TEXTCOLOR
	private String deptName;		// 부서이름
	private String memName;			// 내이름 	
}
