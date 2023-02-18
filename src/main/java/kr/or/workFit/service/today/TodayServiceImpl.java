package kr.or.workFit.service.today;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.today.TodayMapper;
import kr.or.workFit.vo.TodayVO;

@Service
public class TodayServiceImpl implements TodayService {
	
	@Inject
	TodayMapper mapper;
	
	@Override
	public int insert(TodayVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(String todayCode) {
		return mapper.delete(todayCode);
	}

	@Override
	public List<TodayVO> select(String memId) {
		return mapper.select(memId);
	}

	@Override
	public int update(Map<String, Object> map) {
		return mapper.update(map);
	}



}
