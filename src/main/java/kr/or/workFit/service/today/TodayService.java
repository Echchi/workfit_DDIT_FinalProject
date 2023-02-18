package kr.or.workFit.service.today;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.workFit.vo.TodayVO;

public interface TodayService {
	public int insert(TodayVO vo);
	public int delete (String todayCode);
	public List<TodayVO> select (String memId);
	public int update (Map<String, Object> map);
}
