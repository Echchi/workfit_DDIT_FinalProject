package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BusinessTripVO {
	private String businessTripCode;
	private String memId;
	private String businessTripConfirmid;
	private String businessTripPurpose;
	private String businessTripDate;
	private String businessTripExpense;
	private String businessTripLocation;
	private char businessTripStatus;
	private Date businessTripSigndate;
	
	// 종은 추가
	private String memName;

	

}
