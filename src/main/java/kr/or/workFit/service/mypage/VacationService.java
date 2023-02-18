package kr.or.workFit.service.mypage;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.VacationTypeVO;
import kr.or.workFit.vo.VacationVO;

public interface VacationService {
	public List<VacationTypeVO> vacationList();

	public int insertVacation(VacationVO vacationVO);

	public List<VacationVO> myVacationList(Map<String, Object> param);

	public int deleteVacation(String code);

	public int useVacationNum(String memId);	
}
