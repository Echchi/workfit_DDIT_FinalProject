package kr.or.workFit.controller.adminpage;

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
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.workFit.controller.mypage.CommuteController;
import kr.or.workFit.service.adminpage.AdminCommuteService;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import kr.or.workFit.vo.admincommutehelper.AdminCommuteVO;
import kr.or.workFit.vo.myworkhelper.DayInfo;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/workfit")
public class CommuteManageController {
	
	@Inject
	AdminCommuteService adminCommuteService;
	
	@GetMapping(value = "/adminpage/commuteView")
	public String goCommuteManagingView(Model model, @SessionAttribute("member")MemberVO member) throws JsonProcessingException {
		log.info("근태관리 페이지 들어가기!");
		model.addAttribute("menu","commuteManage");
		
		String returnView = "workfit/mypage/commute";
		
		
		
		
		
		// Lv2인지 Lv3인지 확인 후 적절한 페이지로 이동시켜준다 
//		String returnView = "workfit/adminpage/commutelv3";
//		if(member.getMemApproveStatus() == '2') {
//			List<AdminCommuteVO> list = adminCommuteService.getLv2TodayData((String)member.getDeptFk());
//			ObjectMapper objectMapper = new ObjectMapper();
//			
//			String json = objectMapper.writeValueAsString(list);
//			model.addAttribute("list",list);
//			model.addAttribute("jsonList",json);
//			returnView = "workfit/adminpage/commutelv2";
//		}
//		
//		if(member.getMemApproveStatus() == '3') {
//			
//			List<AdminCommuteVO> list = adminCommuteService.getLv3Data();
//			model.addAttribute("list",list);
//			returnView = "workfit/adminpage/commutelv3";
//		}
		return returnView;
	}
	
	
	@GetMapping(value = "/adminpage/groupBy")
	public String groupByView(Model model, @SessionAttribute("member")MemberVO member) throws JsonProcessingException {
		
		model.addAttribute("menu","commuteManage");
		
		// Lv2인지 Lv3인지 확인 후 적절한 페이지로 이동시켜준다 
		String returnView = "workfit/adminpage/commutelv3";
		if(member.getMemApproveStatus() == '2') {
			List<AdminCommuteVO> list = adminCommuteService.getLv2TodayData((String)member.getDeptFk());
			ObjectMapper objectMapper = new ObjectMapper();
			
			String json = objectMapper.writeValueAsString(list);
			model.addAttribute("list",list);
			model.addAttribute("jsonList",json);
			returnView = "workfit/adminpage/commutelv2";
		}
		
		if(member.getMemApproveStatus() == '3') {
			
			List<AdminCommuteVO> list = adminCommuteService.getLv3Data();
			model.addAttribute("list",list);
			returnView = "workfit/adminpage/commutelv3";
		}
		return returnView;
	}
	
	
	@PostMapping(value = "/adminpage/lv3Data")
	public ResponseEntity<Map<String, Object>> level3Data(@RequestBody DayInfo dayInfo){
		
		List<AdminCommuteVO> avgWorkTimeList = adminCommuteService.getAvgWorkTime(dayInfo);
		List<DeptVO> deptList = adminCommuteService.getAlldept();
		List<AdminCommuteVO> avgWorkHistoryList = adminCommuteService.getAvgWorkHistory(dayInfo);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("avgWorkTimeList", avgWorkTimeList);
		resultMap.put("deptList", deptList);
		resultMap.put("avgWorkHistoryList", avgWorkHistoryList);
		
		ResponseEntity<Map<String, Object>> entity = new ResponseEntity<>(resultMap,HttpStatus.OK);
		
		return entity;
	}
	
	
	
	 
}
