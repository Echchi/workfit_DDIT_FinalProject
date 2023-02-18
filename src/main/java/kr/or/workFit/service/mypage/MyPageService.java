package kr.or.workFit.service.mypage;

import kr.or.workFit.controller.commons.ServiceResult;
import kr.or.workFit.vo.MemberVO;

public interface MyPageService {

	public MemberVO selectMem(String memId);

	public ServiceResult memberModify(MemberVO memberVO);
}
