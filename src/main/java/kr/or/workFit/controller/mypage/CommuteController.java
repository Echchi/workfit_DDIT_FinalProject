package kr.or.workFit.controller.mypage;

import java.util.HashMap; 
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.mypage.MyWorkService;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit")
public class CommuteController {
	
	@Inject
	MyWorkService service;
	
	@GetMapping("/mypage/commute")
	public String myCommuteView(Model model) {
		log.info("나의 출퇴근 현황 조회");
		model.addAttribute("menu","mypage");
		return "workfit/mypage/commute";
	}
	
	@PostMapping("/mypage/commuteData")
	public ResponseEntity<Map<String, Object>> giveTwoListOfData(@RequestBody DayInfo dayInfo, @SessionAttribute("memId")String memId){
		Map<String,Object> map = new HashMap<String, Object>();
		
		dayInfo.setMemId(memId);
		map.put("monthlyDays",service.monthlyDays(dayInfo));
		map.put("monthlyMemWork", service.monthlyWorkDays(dayInfo));
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<>(map,HttpStatus.OK);
		
		return entity;
	}
	
	@PostMapping("mypage/weeklyData")
	public ResponseEntity<Map<String, Object>> giveTwoListOfData2(@RequestBody DayInfo dayInfo, @SessionAttribute("memId")String memId){
		Map<String,Object> map = new HashMap<String, Object>();
		
		dayInfo.setMemId(memId);
		map.put("weeklyDays",service.weeklyDays(dayInfo));
		map.put("weeklyMemWork", service.weeklyWorkDays(dayInfo));
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<>(map,HttpStatus.OK);
		
		return entity;
	}
	
	

}
