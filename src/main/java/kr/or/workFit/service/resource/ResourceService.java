package kr.or.workFit.service.resource;

import java.util.List;
import java.util.Map;

import kr.or.workFit.controller.commons.ServiceResult;
import kr.or.workFit.vo.ReservationVO;
import kr.or.workFit.vo.ResourceVO;

public interface ResourceService {
	public List<ResourceVO> getAllResources(Map<String, String> findKeyWord );

	public List<String> getType(Map<String, String> findKeyWord);

	public ResourceVO getOneResource(String resourceCode) throws Exception;

	public List<ResourceVO> getTypeList(Map<String, String> typeMap) throws Exception;

	public int insertNewRes(ResourceVO resourceVO) throws Exception;

	public int secondPwCheck(Map<String, Object> newEvent) throws Exception;

	public int insertNewEvent(Map<String, Object> newEvent) throws Exception;

	public List<ReservationVO> getReservations(Map<String, String> resInfo);

	public int eventModify(ReservationVO resVO);

	public ServiceResult eventDelete(String code) throws Exception;
}
