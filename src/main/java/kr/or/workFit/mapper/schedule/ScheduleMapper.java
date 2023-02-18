package kr.or.workFit.mapper.schedule;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import kr.or.workFit.vo.MemCalendarVO;

public interface ScheduleMapper {
	public List<Calendar> getCalendar(Map<String, Object> dataMap);
	public int insert(MemCalendarVO vo);
	public int delete (int groupId);
	public MemCalendarVO selectOne(int groupId);
	public int update(MemCalendarVO vo);
	public List<MemCalendarVO> getDeptCal(String memId);
	
}
