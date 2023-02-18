package kr.or.workFit.service.resource;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.common.CommonDao;
import kr.or.workFit.controller.commons.ServiceResult;
import kr.or.workFit.vo.ReservationVO;
import kr.or.workFit.vo.ResourceVO;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Resource(name="commonDao")
	private CommonDao commonDao;
	
	public List<ResourceVO> getAllResources(Map<String, String> findKeyWord ) {
		return commonDao.selectList("getAllResources", findKeyWord);
	}

	@Override
	public List<String> getType(Map<String, String> findKeyWord) {
		return commonDao.selectList("getResourceType", findKeyWord);
	}

	@Override
	public ResourceVO getOneResource(String resourceCode) throws Exception {
		return commonDao.select("getOneResource", resourceCode);
	}

	@Override
	public List<ResourceVO> getTypeList(Map<String, String> typeMap) throws Exception {
		return commonDao.selectList("getTypeList", typeMap);
	}

	@Override
	public int insertNewRes(ResourceVO resourceVO) throws Exception {
		return commonDao.insert("insertNewRes", resourceVO);
	}

	@Override
	public int secondPwCheck(Map<String, Object> newEvent) throws Exception {
		return commonDao.select("secondPwCheck", newEvent);
	}

	@Override
	public int insertNewEvent(Map<String, Object> newEvent) throws Exception {
		return commonDao.insert("insertNewEvent", newEvent);
		
	}

	@Override
	public List<ReservationVO> getReservations(Map<String, String> resInfo) {
		return commonDao.selectList("getReservations", resInfo);
	}

	@Override
	public int eventModify(ReservationVO resVO) {
		return commonDao.update("eventModify", resVO);
	}

	@Override
	public ServiceResult eventDelete(String code) throws Exception {
		int deleteResult = commonDao.delete("eventDelete", code);
		if(deleteResult > 0) {
			return ServiceResult.OK;
		}
		return ServiceResult.FAILED;
	}
	
}
