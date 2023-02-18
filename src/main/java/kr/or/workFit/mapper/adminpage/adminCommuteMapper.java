package kr.or.workFit.mapper.adminpage;

import java.util.List;

import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.admincommutehelper.AdminCommuteVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;

public interface adminCommuteMapper {

	public List<AdminCommuteVO> getLv3Data();

	public List<AdminCommuteVO> getLv2TodayData(String deptFk);

	public List<AdminCommuteVO> getAvgWorkTime(DayInfo dayInfo);

	public List<AdminCommuteVO> getAvgWorkHistory(DayInfo dayInfo);

	public List<DeptVO> getAlldept();

}
