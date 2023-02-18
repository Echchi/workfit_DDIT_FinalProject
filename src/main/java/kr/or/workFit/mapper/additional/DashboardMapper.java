package kr.or.workFit.mapper.additional;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.workFit.vo.DashBoardListVO;
import kr.or.workFit.vo.DashBoardVO;

@Mapper
public interface DashboardMapper {

	public List<DashBoardVO> getMyDashboardList(String memId) throws Exception;

	public List<DashBoardListVO> getDashboardItemImage(String memId);
	
	public int insertDashboardMain2DB(List<DashBoardVO> newDashList);

	public int deleteDashboardMain2DB(Map<String, Object> deleteMap);

	public List<Map<String, Object>> getMemStatus(String deptCode);
}
