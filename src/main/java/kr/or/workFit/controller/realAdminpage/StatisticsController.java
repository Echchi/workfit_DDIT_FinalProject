package kr.or.workFit.controller.realAdminpage;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.realAdminpage.AdminService;
import kr.or.workFit.service.realAdminpage.StatisticsService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/admin")
public class StatisticsController {

	@Autowired
	private StatisticsService service;
	
	@Autowired
	private AdminService service2;
	
	@GetMapping("/sPage")
	public String sPage(@SessionAttribute("memId") String memId,@SessionAttribute("memCo") String memCo, Model model) throws Exception {
		String check = service2.selectCoInfo(memCo);
		log.debug("현재 사용중인 멤버십:{}", check);
		
		model.addAttribute("myService", check);
		model.addAttribute("menu", "admin");
		return "workfit/realAdminpage/sPage";
	}
	
	
	@PostMapping(value = "/statistics", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Map<String, String>> getData(@SessionAttribute("memCo") String memCo ,@SessionAttribute("memId") String memId) {
		log.debug("getData 메소드 실행");
		
		List<Map<String, String>> pieData = service.getPieData(memCo);
		log.debug("pieData:{}",pieData );
		
		return pieData;
	}
	
	@GetMapping("/ssPage")
	public String chartPrac() {
		
		return "workfit/realAdminpage/ssPage";
	}
	
	
}
 