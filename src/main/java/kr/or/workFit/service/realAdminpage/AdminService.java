package kr.or.workFit.service.realAdminpage;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;

/**
 * @author PC-11
 *
 */
/**
 * @author PC-11
 *
 */
public interface AdminService {

	/** 멤버십 결제시 payment history 테이블 인서트
	 * @param map
	 * @return
	 */
	public int insertPayment(Map<String, String> map);

	/**해당 회사가 결제내역에 있는지 확인하는 메서드
	 * @param memCo
	 * @return
	 */
	public int checkCompany(String memCo) throws Exception;

	/** 멤버시 결제시 결제내역 변경
	 * @param map
	 */
	public int updatePayment(Map<String, String> map);

	/** 회사내 사원리스트 조회
	 * @param memCo
	 * @return
	 */
	public List<MemberVO> selectMember(String memCo);


	/** 부서배정되어있는 멤버 리스트 출력
	 * @param memCo
	 * @return
	 */
	public List<Map<String, String>> selectMemberInDept(String memCo);

	/** 부서 미배정 멤버 리스트 출력
	 * @param memCo
	 * @return
	 */
	public List<Map<String, String>> selectMemberNotInDept(String memCo);

	/** 부서 종류 리스트 뽑아오기
	 * @param memCo
	 * @return
	 */
	public List<DeptVO> selectDeptListInAdmin(String memCo);

	
	/** 미배정 인원 배정하기
	 * @param assignInfoList
	 * @return
	 */
	public int assignMember(List<Map<String, String>> assignInfoList);

	
	/** mem_auth 인서트
	 * @param assignInfoList
	 * @return
	 */
	public int insertAuth(List<Map<String, String>> assignInfoList);

	/** 새 유저 추가하기
	 * @param newUserList
	 * @return
	 */
	public int addUser(List<Map<String, String>> newUserList);

	/** 사내 멤버 가져오기
	 * @param memCo
	 * @return
	 */
	public List<MemberVO> selectMyMember(String memCo);

	/** 유저 사용중지
	 * @param dataMap
	 * @return
	 */
	public int deleteMember(List<Map<String, String>> dataMap);

	/**퇴사자 테이블 인서트
	 * @param dataMap
	 * @return
	 */
	public int insertDecease(List<Map<String, String>> dataMap);

	/** 회사 이용 서비스 종류 셀렉트 
	 * @param memCo
	 * @return
	 */
	public String selectCoInfo(String memCo) throws Exception;

	/** 사용정지 리스트 반환
	 * @param memCo
	 * @return
	 */
	public List<Map<String, String>> selectMemberInStop(String memCo);

}
