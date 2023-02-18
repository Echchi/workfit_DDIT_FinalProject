package kr.or.workFit.service.mypage;

import java.util.List; 

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.mypage.MyWorkMapper;
import kr.or.workFit.vo.WorkVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;
import kr.or.workFit.vo.myworkhelper.ResultDayInfo;

@Service
public class MyWorkServiceImpl implements MyWorkService {
	
	@Inject
	MyWorkMapper mapper; 
	
	@Override
	public List<ResultDayInfo> monthlyDays(DayInfo dayInfo) {
		return mapper.monthlyDays(dayInfo);
	}

	@Override
	public List<WorkVO> monthlyWorkDays(DayInfo dayInfo) {
		// TODO Auto-generated method stub
		return mapper.monthlyWorkDays(dayInfo);
	}

	@Override
	public void insertCommuteStart(WorkVO workVO) {
		// TODO Auto-generated method stub
		mapper.insertCommuteStart(workVO);
	}

	@Override
	public void endCommute(String memId) {
		// TODO Auto-generated method stub
		mapper.endCommute(memId);
	}

	@Override
	public List<ResultDayInfo> weeklyDays(DayInfo dayInfo) {
		// TODO Auto-generated method stub
		return mapper.weeklyDays(dayInfo);
	}

	@Override
	public List<WorkVO> weeklyWorkDays(DayInfo dayInfo) {
		// TODO Auto-generated method stub
		return mapper.weeklyWorkDays(dayInfo);
	}

	@Override
	public List<WorkVO> findMemberForCommuteEndProcess() {
		// TODO Auto-generated method stub
		return mapper.findMemberForCommuteEndProcess();
	}

}
