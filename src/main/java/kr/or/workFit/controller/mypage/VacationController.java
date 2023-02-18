package kr.or.workFit.controller.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.mypage.VacationService;
import kr.or.workFit.vo.VacationTypeVO;
import kr.or.workFit.vo.VacationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/mypage")
public class VacationController {
	
	@Inject
	VacationService service;

	/**
	 * 휴가 관리 페이지 리턴하는 메소드
	 * @param model
	 * @return
	 */
	@GetMapping("/vacation")
	public String vacationPage(Model model, @SessionAttribute("memId") String memId){
		log.debug("휴가관리 창!");
		List<VacationTypeVO> vacationList = service.vacationList();
		int useDate = service.useVacationNum(memId);
		Map<String, Object> vacationMap = mapMaker(vacationList);
		log.debug("맵 변환 : {}", vacationMap);
		model.addAttribute("vacationType", vacationMap);
		model.addAttribute("useDate", useDate);
		model.addAttribute("menu", "commuteManage");
		return "workfit/mypage/vacation";
	}
	
	/**
	 * 휴가 신청하기
	 * @param vacationVO
	 * @return
	 */
	@PostMapping(value = "/insertVacation", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String insertVacation(VacationVO vacationVO) {
		log.debug("휴가 신청 VO, {}", vacationVO);
		int result = service.insertVacation(vacationVO);
		log.debug("휴가 신청 등록 완료 ? " + result);
		if(result > 0 ) return "OK";
		return "FAILED"; 
	}
	
	/**
	 * 본인 휴가 신청 리스트
	 * @param param
	 * @return
	 */
	@PostMapping(value = "/myVacationList")
	@ResponseBody
	public List<VacationVO> myVacation(@RequestBody Map<String, Object> param) {
		log.debug("보낸 json Map으로 받기, {}", param);
		List<VacationVO> myVacationList = service.myVacationList(param);
//		List<VacationVO> myVacationList = new ArrayList<VacationVO>();
		log.info("내 휴가 목록 띄워줌 ?, {}", myVacationList);
		return myVacationList;
	}
	
	/**
	 * 휴가 삭제하는 메소드
	 * @param code
	 * @return
	 */
	@PostMapping(value = "/deleteVacation")
	@ResponseBody
	public String deleteVacation(@RequestBody String code) {
		log.debug("휴가 삭제, 코드 : {}", code);
		int result = service.deleteVacation(code);
		if(result > 0) return "OK";
		return "FAILED";
	}
	
	/**
	 * 리스트 휴가 코드 첫번째를 키로 가지는 맵으로 바꿔주는 메소드
	 * @param list
	 * @return
	 */
	public Map<String, Object> mapMaker(List<VacationTypeVO> list){
		Map<String, Object> vacationMap = new HashMap<>();
		for (VacationTypeVO type : list) {
			String code = type.getVctCode().substring(0, 1);
			// 해당 코드 종류 첫번째 글자가 없으면
			if(!vacationMap.containsKey(code)) {		
				List<VacationTypeVO> typeList = new ArrayList<VacationTypeVO>();
				typeList.add(type);
				vacationMap.put(code, typeList);
			}else {
				// 이미 있는 종류의 종류가 온다면
				List<VacationTypeVO> existList = (List<VacationTypeVO>) vacationMap.get(code);
				existList.add(type);
				vacationMap.put(code, existList);
			}
		}
		return vacationMap;
	}
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                