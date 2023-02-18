package kr.or.workFit.service.mypage;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.controller.commons.ServiceResult;
import kr.or.workFit.mapper.mypage.MypageMapper;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	MypageMapper mapper;
	
	@Override
	public MemberVO selectMem(String memId) {
		MemberVO mem = mapper.selectMem(memId);
		log.debug("회원 정보 가져오기, {}", mem);
		return mem;
	}

	@Override
	public ServiceResult memberModify(MemberVO memberVO) {
		int result = mapper.memberModify(memberVO);
		if(result > 0) {
			return ServiceResult.OK;
		}else {
			return ServiceResult.FAILED;
		}
	}

}
