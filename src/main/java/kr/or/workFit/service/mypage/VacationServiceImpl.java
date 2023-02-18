package kr.or.workFit.service.mypage;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.mypage.VacationMapper;
import kr.or.workFit.vo.VacationTypeVO;
import kr.or.workFit.vo.VacationVO;

@Service
public class VacationServiceImpl implements VacationService{

	@Inject
	VacationMapper mapper;
	
	@Override
	public List<VacationTypeVO> vacationList() {
		return mapper.vacationList();
	}

	@Override
	public int insertVacation(VacationVO vacationVO) {
		return mapper.insertVacation(vacationVO);
	}

	@Override
	public List<VacationVO> myVacationList(Map<String, Object> param) {
		return mapper.myVacationList(param);
	}

	@Override
	public int deleteVacation(String code) {
		return mapper.deleteVacation(code);
	}

	@Override
	public int useVacationNum(String memId) {
		return mapper.useVacationNum(memId);
	}

}
