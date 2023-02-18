package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReservationVO {
	private String reservationCode;
	private String resourceCode;
	private Date reservationStarttime;
	private Date reservationEndtime;
	private String memId;
	private String reservationMem;
	private String reservationWhy;
}
