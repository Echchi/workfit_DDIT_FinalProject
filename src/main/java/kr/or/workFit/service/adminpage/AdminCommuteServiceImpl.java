package kr.or.workFit.service.adminpage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.adminpage.adminCommuteMapper;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.admincommutehelper.AdminCommuteVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;

@Service
public class AdminCommuteServiceImpl implements AdminCommuteService {
	
	@Inject
	adminCommuteMapper mapper;
	
	@Override
	public List<AdminCommuteVO> getLv3Data() {
		// TODO Auto-generated method stub
		return mapper.getLv3Data();
	}

	@Override
	public List<AdminCommuteVO> getLv2TodayData(String deptFk) {
		// TODO Auto-generated method stub
		return mapper.getLv2TodayData(deptFk);
	}

	@Override
	public List<AdminCommuteVO> getAvgWorkTime(DayInfo dayInfo) {
		// TODO Auto-generated method stub
		return mapper.getAvgWorkTime(dayInfo);
	}

	@Override
	public List<AdminCommuteVO> getAvgWorkHistory(DayInfo dayInfo) {
		// TODO Auto-generated method stub
		return mapper.getAvgWorkHistory(dayInfo);
	}

	@Override
	public List<DeptVO> getAlldept() {
		// TODO Auto-generated method stub
		return mapper.getAlldept();
	}


}
