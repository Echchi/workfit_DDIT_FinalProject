package kr.or.workFit.mapper.today;

import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.TodayVO;

public interface TodayMapper {
	public int insert(TodayVO vo);
	public int delete (String todayCode);
	public List<TodayVO> select (String memId);
	public int update (Map<String, Object> map);
	
}
