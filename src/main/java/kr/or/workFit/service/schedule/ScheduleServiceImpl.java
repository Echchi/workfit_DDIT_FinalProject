package kr.or.workFit.service.schedule;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.workFit.mapper.schedule.ScheduleMapper;
import kr.or.workFit.vo.MemCalendarVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Inject
	private ScheduleMapper mapper;
	
	@Override
	public List<Calendar> getCalendar(Map<String, Object> dataMap){
		return mapper.getCalendar(dataMap);
	}

	@Override
	public int insert(MemCalendarVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int delete(int groupId) {
		return mapper.delete(groupId);
	}

	@Override
	public MemCalendarVO selectOne(int groupId) {
		return mapper.selectOne(groupId);
	}

	@Override
	public int update(MemCalendarVO vo) {
		return mapper.update(vo);
	}

	@Override
	public List<MemCalendarVO> getDeptCal(String memId) {
		return mapper.getDeptCal(memId);
	}


}
