package kr.or.workFit.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FixtureVO {
	private String fixtureCode;
	private String resourceCode;
	private String fixtureName;
	private int fixtureQuantity;

}
