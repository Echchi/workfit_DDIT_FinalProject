package kr.or.workFit.mapper.main;

import java.util.Map;

import kr.or.workFit.vo.MemberVO;

public interface MainMapper {

	public MemberVO loginCheck(Map<String, Object> loginInfo);

	public String getDeptName(String memId);

	public MemberVO securityLogin(String username);

	public String getMemberShipInfo(String memCo);


}
