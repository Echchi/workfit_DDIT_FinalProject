package kr.or.workFit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentHistoryVO {
	private String paymentHistoryCode;
	private String coCodeFk;
	private String serviceCode;
	private int servicePrice;
	private Date serviceDate;

}
