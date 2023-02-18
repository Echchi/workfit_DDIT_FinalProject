package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CareerVO {
	private String careerCode;
	private String memId;
	private String workDepartment;
	private String assignedTask;
	private Date workedStart;
	private Date workedEnd;
	private String jobGrade;
	
	
}
