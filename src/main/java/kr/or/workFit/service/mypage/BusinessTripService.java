package kr.or.workFit.service.mypage;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.BusinessTripVO;
import kr.or.workFit.vo.MemberVO;

public interface BusinessTripService {

	public List<MemberVO> getMydeptList(String memDeptCode) throws Exception;

	public int insertBusinessTrip(BusinessTripVO buVo) throws Exception;

	public List<BusinessTripVO> myBusinessList(Map<String, Object> map);

	public int deleteBusinessTrip(String code);

	public List<BusinessTripVO> myBusinessTripApprove(Map<String, Object> map);

	public BusinessTripVO getOneBusiness(String businessTripCode) throws Exception;

	public int businessTripManage(Map<String, Object> map);

	public MemberVO getApproveMemInfo(String businessTripCode) throws Exception;

}
