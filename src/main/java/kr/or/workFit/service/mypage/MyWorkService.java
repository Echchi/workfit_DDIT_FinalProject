package kr.or.workFit.service.mypage;

import java.util.List;

import kr.or.workFit.vo.WorkVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;
import kr.or.workFit.vo.myworkhelper.ResultDayInfo;

public interface MyWorkService {
	
	public List<ResultDayInfo> monthlyDays(DayInfo dayInfo);

	public List<WorkVO> monthlyWorkDays(DayInfo dayInfo);
	
	public void insertCommuteStart(WorkVO workVO);

	public void endCommute(String memId);

	public List<ResultDayInfo> weeklyDays(DayInfo dayInfo);

	public List<WorkVO> weeklyWorkDays(DayInfo dayInfo);

	public List<WorkVO> findMemberForCommuteEndProcess();
	
}
