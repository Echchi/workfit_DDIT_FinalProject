package kr.or.workFit.mapper.mypage;

import kr.or.workFit.vo.MemberVO;

public interface MypageMapper {

	public MemberVO selectMem(String memId);

	public int memberModify(MemberVO memberVO);
	
}
