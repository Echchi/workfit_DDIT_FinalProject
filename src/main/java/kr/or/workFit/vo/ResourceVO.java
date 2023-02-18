package kr.or.workFit.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ResourceVO {
	private String resourceCode;
	private String resourceType;
	private String resourcePrice;
	private Date resourceDate;
	private String resourcePlace;
	private String resourceName;
	private String resourceCoFk;
	private String resourceInfo;
	private String resourceImg;
	private List<FixtureVO> fixtures;
}
