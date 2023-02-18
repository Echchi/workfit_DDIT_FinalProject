package kr.or.workFit.mapper.mypage;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.workFit.vo.VacationTypeVO;
import kr.or.workFit.vo.VacationVO;

@Mapper
public interface VacationMapper {

	public List<VacationTypeVO> vacationList();
	public int insertVacation(VacationVO vacationVO);
	public List<VacationVO> myVacationList(Map<String, Object> param);
	public int deleteVacation(String code);
	public int useVacationNum(String memId);
}
