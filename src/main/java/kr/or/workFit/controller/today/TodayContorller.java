package kr.or.workFit.controller.today;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.today.TodayService;
import kr.or.workFit.vo.TodayVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TodayContorller {
	
	@Inject
	private TodayService service;
	
	
	@PostMapping(value="/insertTodoList", produces = "application/json; charset=utf-8")
	@ResponseBody
	public void insertTodoList(@SessionAttribute("memId") String memId, @RequestBody Map<String, Object>map) {
		log.debug((String)map.get("todayCode"));
		log.debug((String)map.get("todayContent"));
		
		String todayCode = (String)map.get("todayCode");
		String todayContent = (String)map.get("todayContent");
		
		TodayVO vo = new TodayVO();
		vo.setMemId(memId);
		vo.setTodayCode(todayCode);
		vo.setTodayContent(todayContent);
		
		service.insert(vo);
	}
	
	@GetMapping(value="/deleteTodoList", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String deleteTodoList(String todayCode) {
		int res = service.delete(todayCode);
		String result = ""; 
		return result = res != 0? "야호":"ㅠㅠ";
	}
	
	@GetMapping(value="/selectTodoList")
	@ResponseBody
	public List<TodayVO> selectTodoList(@SessionAttribute("memId") String memId){
		return service.select(memId);
	}
	
	@PostMapping(value="/updateTodoList")
	@ResponseBody
	public void updateTodoList(@RequestBody Map<String, Object>map){
		log.info("map {}",map);
		service.update(map);
	}
	
	
	
}
