package kr.or.workFit.service.additional;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.additional.DashboardMapper;
import kr.or.workFit.vo.DashBoardListVO;
import kr.or.workFit.vo.DashBoardVO;

@Service
public class DashboardServiceImpl implements DashboardService{

	@Inject
	DashboardMapper mapper;

	@Override
	public List<DashBoardVO> getMyDashboardList(String memId) throws Exception {
		return mapper.getMyDashboardList(memId);
	}

	@Override
	public List<DashBoardListVO> getDashboardItemImage(String memId) {
		return mapper.getDashboardItemImage(memId);
	}

	@Override
	public int deleteDashboardMain2DB(Map<String, Object> deleteMap) {
		return mapper.deleteDashboardMain2DB(deleteMap);
	}

	@Override
	public int insertDashboardMain2DB(List<DashBoardVO> newDashList) {
		return mapper.insertDashboardMain2DB(newDashList);
	}

	@Override
	public List<Map<String, Object>> getMemStatus(String deptCode) {
		return mapper.getMemStatus(deptCode);
	}
}
