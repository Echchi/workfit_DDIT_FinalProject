package kr.or.workFit.service.realAdminpage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	/** 멤버십 결제시 payment history 테이블 인서트
	 * @param map
	 * @return
	 */
	@Override
	public int insertPayment(Map<String, String> map) {
		return commonDao.insert("insertPayment", map);
	}

	/**해당 회사가 결제내역에 있는지 확인하는 메서드
	 * @param memCo
	 * @return
	 * @throws Exception 
	 */
	@Override
	public int checkCompany(String memCo) throws Exception {
		return commonDao.select("checkCompany", memCo);
	}

	/**
	 *멤버시 결제시 결제내역 변경
	 */
	@Override
	public int updatePayment(Map<String, String> map) {
		return commonDao.update("updatePayment", map);
		
	}

	/**
	 * 회사내 사원 리스트 조회
	 */
	@Override
	public List<MemberVO> selectMember(String memCo) {
		return commonDao.selectList("selectMember", memCo);
	}

	
	/** 부서배정되어있는 멤버 리스트 출력
	 * @param memCo
	 * @return
	 */
	@Override
	public List<Map<String, String>> selectMemberInDept(String memCo) {
		return commonDao.selectList("selectMemberInDept", memCo);
	}

	/** 부서 미배정 멤버 리스트 출력
	 * @param memCo
	 * @return
	 */
	@Override
	public List<Map<String, String>> selectMemberNotInDept(String memCo) {
		return commonDao.selectList("selectMemberNotInDept", memCo);
	}
	
	/** 부서 종류 리스트 뽑아오기
	 * @param memCo
	 * @return
	 */
	@Override
	public List<DeptVO> selectDeptListInAdmin(String memCo) {
		return commonDao.selectList("selectDeptListInAdmin", memCo);
	}

	/**
	 * 부서 미배정 인원 배정하기
	 */
	@Override
	public int assignMember(List<Map<String, String>> assignInfoList) {
		return commonDao.update("assignMember", assignInfoList);
	}

	/**
	 * 권한 인서트
	 */
	@Override
	public int insertAuth(List<Map<String, String>> assignInfoList) {
		return commonDao.insert("insertAuth", assignInfoList);
	}

	/**
	 * 뉴 유저 인서트하는 부서도 들어가 있음
	 */
	@Override
	public int addUser(List<Map<String, String>> newUserList) {
		return commonDao.insert("addUser", newUserList);
	}

	/**
	 * 사내 회원 가져오기
	 */
	@Override
	public List<MemberVO> selectMyMember(String memCo) {
		return commonDao.selectList("selectMyMember", memCo);
	}

	/**
	 * 유저 사용중지
	 */
	@Override
	public int deleteMember(List<Map<String, String>> dataMap) {
		return commonDao.update("deleteMember", dataMap);
	}

	/**
	 * 퇴사자 테이블 인서트
	 */
	@Override
	public int insertDecease(List<Map<String, String>> dataMap) {
		return commonDao.insert("insertDecease", dataMap);
	}

	@Override
	public String selectCoInfo(String memCo) throws Exception {
		return commonDao.select("selectCoInfo", memCo);
	}

	/**
	 * 사용정지 리스트 메소드
	 */
	@Override
	public List<Map<String, String>> selectMemberInStop(String memCo) {
		return commonDao.selectList("selectMemberInStop", memCo);
	}

}
