package kr.or.workFit.controller.schedule;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.workFit.service.schedule.ScheduleService;
import kr.or.workFit.vo.MemCalendarVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/workfit/schedule")
public class ScheduleContorller {
	
	@Inject
	private ScheduleService scheduleservice;
	
	@GetMapping("/index")
	public String indexPage(@SessionAttribute("memName") String memName, @SessionAttribute("memDeptName") String memDeptName, @SessionAttribute("memId") String memId,@SessionAttribute("memDeptCode") String memDeptCode, Model model) {
		model.addAttribute("memName",memName);
		model.addAttribute("memId",memId);
		model.addAttribute("memDeptName",memDeptName);
		model.addAttribute("memDeptCode",memDeptCode);
		return "workfit/schedule/index";
	}
	
	@GetMapping("/index2")
	public String indexPage2(Model model) {
		model.addAttribute("menu","schedule");
		return "workfit/schedule/index2";
	}
	
	@ResponseBody
	@RequestMapping(value = "/calendar", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	public ResponseEntity<String> getCalendarList(@RequestBody Map<String,Object> dataMap) {
		
		log.info("getCalendarList");
//		log.info("들어온 파라미터예요 왜 이럴까요 {}",calType);
		List<Calendar> calendar = null;
//		dataMap.put("memId", memId);
//		dataMap.put("memDeptName", memDeptName);
		ResponseEntity<String> entity = null;
		String jsonArray = "";
		
		calendar = scheduleservice.getCalendar(dataMap);
		jsonArray = new Gson().toJson(calendar);
		entity = new ResponseEntity<String>(jsonArray, HttpStatus.OK);
		

		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getDeptCal", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public List<MemCalendarVO> getDeptCal(@SessionAttribute("memDeptCode")String memDeptCode, 
										  @SessionAttribute("memName") String memName, 
										  @SessionAttribute("memDeptName") String memDeptName) {
		List<MemCalendarVO> list = scheduleservice.getDeptCal(memDeptCode);
		log.info("컨트롤러에서 앞단으로 보낼 리스트 {}",list);
		if(list.size() == 0 || list==null) {
			MemCalendarVO vo = new MemCalendarVO();
			vo.setMemName(memName);
			vo.setDeptName(memDeptName);
			list.add(vo);
		}else {
			list.get(0).setMemName(memName);
			list.get(0).setDeptName(memDeptName);
			
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getMyCal", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	public List<MemCalendarVO> getMyCal(@SessionAttribute("memId")String memId, 
			@SessionAttribute("memName") String memName, 
			@SessionAttribute("memDeptName") String memDeptName) {
		List<MemCalendarVO> list = scheduleservice.getDeptCal(memId);
		log.info("컨트롤러에서 앞단으로 보낼 리스트 {}",list);
		if(list.size() == 0 || list==null) {
			MemCalendarVO vo = new MemCalendarVO();
			vo.setMemName(memName);
			vo.setDeptName(memDeptName);
			list.add(vo);
		}else {
			list.get(0).setMemName(memName);
			list.get(0).setDeptName(memDeptName);
			
		}
		return list;
	}
	
	
	
	@PostMapping(value = "/insert.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public int insertCalendar(@RequestBody Map<String, Object>map){

		log.info("캘린더 컨트롤러 로 넘어온 객체 {} ",map.get("calType"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {} ",map.get("title"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("memo"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("start"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("end"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("allDay"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("color"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("textColor"));
		
		String memId = (String)map.get("calType");
		String title = (String)map.get("title");
		String memo = (String)map.get("memo");
		String start = (String)map.get("start");
		String end = (String)map.get("end");
		String color = (String)map.get("color");
		String textColor = (String)map.get("textColor");
		boolean allDay = (boolean)map.get("allDay");
		
		
		MemCalendarVO vo = new MemCalendarVO();
		vo.setStart(start);
		vo.setEnd(end);
		vo.setMemo(memo);
		vo.setTitle(title);
		vo.setColor(color);		// 일단 색깔
		vo.setAllDay(allDay);	
		vo.setId(memId);
		vo.setTextColor(textColor);
	
		int res = scheduleservice.insert(vo);
		return res==1? vo.getGroupId():null;
	}
	
	
	@GetMapping(value="/delete.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String deleteCalendar (int groupId) {
		log.info("컨트롤러로 넘어온 캘린더 아이디 값 {}",groupId);
		int res = scheduleservice.delete(groupId);
		return res==1? "삭제완료" : "삭제실패"; 
	}
	
	
	@PostMapping(value="/update.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String updateCalendar (@RequestBody Map<String, Object> map) {
		log.info("캘린더 컨트롤러 로 넘어온 객체 {} ",map.get("title"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("memo"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("start"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("end"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("allDay"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("calType"));
		log.info("캘린더 컨트롤러 로 넘어온 객체 {}",map.get("groupId"));
		
		
		String memId = (String)map.get("calType");
		String title = (String)map.get("title");
		String memo = (String)map.get("memo");
		String start = (String)map.get("start");
		String end = (String)map.get("end");
		String color = (String)map.get("color");
		int groupId = Integer.parseInt((String)map.get("groupId"));
		boolean allDay = (boolean)map.get("allDay");
		
		MemCalendarVO oldVo = new MemCalendarVO();
		oldVo = scheduleservice.selectOne(groupId);
		oldVo.setTitle(title);
		oldVo.setMemo(memo);
		oldVo.setStart(start);
		oldVo.setEnd(end);
		oldVo.setGroupId(groupId);
		oldVo.setId(memId);
		oldVo.setColor(color);
		
		log.info("캘린더 update문 실행 직전 보낼 객체 {}", oldVo.toString());
		
		int res = scheduleservice.update(oldVo);
		
		return res==1? "수정완료" : "수정실패";
		
		
		
		
		
		
	}

	
}
