package kr.or.workFit.service.additional;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.DashBoardListVO;
import kr.or.workFit.vo.DashBoardVO;

public interface DashboardService {

	public List<DashBoardVO> getMyDashboardList(String memId) throws Exception;

	public List<DashBoardListVO> getDashboardItemImage(String memId);
	
	public int insertDashboardMain2DB(List<DashBoardVO> newDashList);

	public int deleteDashboardMain2DB(Map<String, Object> deleteMap);

	public List<Map<String, Object>> getMemStatus(String deptCode);

}
