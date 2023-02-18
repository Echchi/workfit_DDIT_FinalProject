package kr.or.workFit.service.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.workFit.vo.BusinessTripVO;
import kr.or.workFit.vo.MemberVO;

@Service("BusinessTripService")
public class BusinessTripServiceImpl implements BusinessTripService{

	@Resource(name = "commonDao")
	private CommonDao commonDao;

	@Override
	public List<MemberVO> getMydeptList(String memDeptCode) throws Exception {
		return commonDao.selectList("getMydeptList", memDeptCode);
	}

	@Override
	public int insertBusinessTrip(BusinessTripVO buVo) throws Exception {
		return commonDao.insert("insertBusinessTrip", buVo);
	}

	@Override
	public List<BusinessTripVO> myBusinessList(Map<String, Object> map) {
		return commonDao.selectList("myBusinessList", map);
	}

	@Override
	public int deleteBusinessTrip(String code) {
		return commonDao.delete("deleteBusinessTrip", code);
	}

	@Override
	public List<BusinessTripVO> myBusinessTripApprove(Map<String, Object> map) {
		return commonDao.selectList("myBusinessTripApprove", map);
	}

	@Override
	public BusinessTripVO getOneBusiness(String businessTripCode) throws Exception {
		return commonDao.select("getOneBusiness", businessTripCode);
	}
	
	/**
	 * 승인 반려 여러개 또는 한개 update하는 메소드
	 */
	@Override
	public int businessTripManage(Map<String, Object> map) {
		return commonDao.update("businessTripManage", map);
	}

	@Override
	public MemberVO getApproveMemInfo(String businessTripCode) throws Exception {
		return commonDao.select("getApproveMemInfo", businessTripCode);
	}

	
}
