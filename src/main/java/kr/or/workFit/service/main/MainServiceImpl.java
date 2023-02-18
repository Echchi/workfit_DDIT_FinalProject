package kr.or.workFit.service.main;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.main.MainMapper;
import kr.or.workFit.vo.MemberVO;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	MainMapper mapper;
	
	@Override
	public MemberVO loginCheck(Map<String, Object> loginInfo) {
		return mapper.loginCheck(loginInfo);
	}

	@Override
	public String getDeptName(String memId) {
		return mapper.getDeptName(memId);
	}

	@Override
	public MemberVO securityLogin(String username) {
		return mapper.securityLogin(username);
	}

	@Override
	public String getMemberShipInfo(String memCo) {
		return mapper.getMemberShipInfo(memCo);
	}
	
	

}
