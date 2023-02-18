package kr.or.workFit.controller.resource;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.controller.commons.ServiceResult;
import kr.or.workFit.service.resource.ResourceService;
import kr.or.workFit.vo.ReservationVO;
import kr.or.workFit.vo.ResourceVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/resource")
@SuppressWarnings("unchecked")
public class ResourceController {

	@Resource(name="resourceService")
	private ResourceService service;
	
	@GetMapping("/manage")
	public String managePage(@SessionAttribute("memCo")String coCode, Model model) {
		model.addAttribute("menu", "resource");
		model.addAttribute("type", "자원관리");	
		
		// 걍 모든 자원들 다 가져오기
		Map<String,String> findKeyWord = new HashMap<>();
		findKeyWord.put("coCode", coCode);
		
		// 전체 자원들 목록
		List<ResourceVO> resources = service.getAllResources(findKeyWord);
		model.addAttribute("resources", resources);
		
		// 전체 자원 종류들
		List<String> resourceTypes = service.getType(findKeyWord);
		model.addAttribute("resourceType", resourceTypes);	
		
		// 자원별 타입 하위 목록
		// 룸
		findKeyWord.put("code", "R");
		List<String> rTypes = service.getType(findKeyWord);
		model.addAttribute("rTypes", rTypes);	

		// 차량
		findKeyWord.put("code", "C");
		List<String> cTypes = service.getType(findKeyWord);
		model.addAttribute("cTypes", cTypes);	
		
		// 전자기기
		findKeyWord.put("code", "E");
		List<String> eTypes = service.getType(findKeyWord);
		model.addAttribute("eTypes", eTypes);	

		// 대분류별 종류 가져오기
		log.debug("자원관리 모든 리스트, {}", resources);
		log.debug("자원관리, {}", resources);
		return "workfit/resource/manage";
	}
	/**
	 * 자원 예약 insert 하는 메소드
	 * @param newEvent
	 * @return
	 * @throws Exception 
	 */
	@PostMapping(value = "/insertNewEvent")
	@ResponseBody
	public String insertNewEvent(@RequestParam Map<String, Object> newEvent) throws Exception {
		log.debug("받은 데이터 확인 , {}", newEvent);
		newEvent.put("reservationCode", "");
		String result = "OK";
		int checkNum = service.secondPwCheck(newEvent);
		// 아이디 2차 비번 인증 안되면 FAILED리턴
		if(checkNum <1) { 
			result = "FAILED";
		}else {
			int insertCnt = service.insertNewEvent(newEvent);
			// insert 잘 되지 않으면 FAILED리턴
			if(insertCnt  < 1) result= "FAILED";
		}
		log.debug("자 잘 오냐  ? , {}", newEvent);
		return (String) newEvent.get("reservationCode");
	}
	/**
	 * 자원 등록하는 메소드
	 * @param model
	 * @param resourceVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/newResInsert")
	@ResponseBody
	public String newResInsert(Model model, @RequestBody ResourceVO resourceVO) throws Exception {
		int res = service.insertNewRes(resourceVO);
		log.debug("res 성공 갯수 : ", res);
		return "OK";
	}
	
	@PostMapping("/getAllReservation")
	@ResponseBody
	public List<ReservationVO> getAllReservation(@RequestParam Map<String, String> resInfo) {
		log.debug("받은 json data , {}", resInfo);
		List<ReservationVO> resList = service.getReservations(resInfo);
		log.debug("해당 예약정보!! , {}", resList);
		return resList;
	}
	
	/**
	 * 이벤트 수정하는 메소드
	 * @param resVO
	 * @return
	 */
	@PostMapping("/eventModify")
	@ResponseBody
	public String eventModify(@RequestBody ReservationVO resVO) {
		log.debug("수정할 데이터 : {}", resVO);
		int modifyResult = service.eventModify(resVO);
		if(modifyResult < 1) {
			return "FAILED";
		}
		return "OK";
	}
	
	@PostMapping("/eventDelete")
	@ResponseBody
	public String eventDelete(@RequestBody Map<String, Object> map, @SessionAttribute("memId") String memId) throws Exception {
		log.debug("받은 삭제 정보, {}", map);
		map.put("memId", memId);
		int checkNum = service.secondPwCheck(map);
		if(checkNum > 0) {
			String code = (String)map.get("reservationCode");
			ServiceResult res = service.eventDelete(code);
			return res.toString();
		}
		return "OK";
	}
	/**
	 * 자원별 출력 페이지
	 * @param coCode
	 * @param model
	 * @param resourceType
	 * @return
	 */
	@GetMapping("/{resources}")
	public String resourceType(@SessionAttribute("memCo")String coCode, Model model, @PathVariable("resources")String resourceType) {
		model.addAttribute("menu", "resource");
		
		Map<String,String> findKeyWord = new HashMap<>();
		findKeyWord.put("coCode", coCode);
		log.debug("무슨 페이지 ?? , {}", resourceType);
		List<ResourceVO> resources = new ArrayList<ResourceVO>();
		List<String> resourceTypes = new ArrayList<String>();
//		findKeyWord.put("code", "R");
		String page = "";
		// url패턴에 따라 페이지 처리
		switch (resourceType) {
		case "room":
			findKeyWord.put("code", "R");
			page = "회의실";
			break;
		case "car":
			findKeyWord.put("code", "C");
			page = "차량";
			break;
		case "electgoods":
			findKeyWord.put("code", "E");
			page = "전자기기";
			break;
		default:
			page = "전체조회";
			break;
		}
		resources = service.getAllResources(findKeyWord);
		resourceTypes = service.getType(findKeyWord);
		
		log.debug("resources, {}", resources);
		model.addAttribute("type", page);		// 회의실 / 차량 / 전자기기 
		model.addAttribute("resources", resources);	// 해당 코드에 대한 모든 자원들
		model.addAttribute("resourceType", resourceTypes);	// 페이지 별 종류들
		return "workfit/resource/resources";
	}
	
	/**
	 * 해당 자원 상세 정보를 json으로 반환하는 메소드
	 * @param resourceCode
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/detail", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public ResourceVO getOneResource(@RequestBody String resourceCode) throws Exception {
		ResourceVO res = service.getOneResource(resourceCode);
		log.debug("단건 자원, {}", res);
		return res;
	}
	
	/**
	 * 자원 종류 list를 json으로 반환하는 메소드
	 * @param type
	 * @param coCode
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "/typeList", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<ResourceVO> getTypeList(@RequestBody Map<String, Object> jsonMap , @SessionAttribute("memCo")String coCode) throws Exception {
		Map<String, String> typeMap = new HashMap<String, String>();
		typeMap.put("type", (String) jsonMap.get("type"));
		typeMap.put("code", (String) jsonMap.get("code"));
		typeMap.put("coCode", coCode);
		List<ResourceVO> typeList = service.getTypeList(typeMap);
		log.debug("종류별 자원, {}", typeList);
		return typeList;
	}
	
	
	/**
	 * 자원별 코드 첫번째를 키로 가지는 맵으로 바꿔주는 메소드
	 * @param list
	 * @return
	 */
	public Map<String, Object> mapMaker(List<ResourceVO> list, String key){
		Map<String, Object> resourceMap = new HashMap<>();
		for (ResourceVO type : list) {
			String code = key;
			if(key.equals("code")) {
				code = type.getResourceCode().substring(0, 1);
			}else if(key.equals("type")){
				code = type.getResourceType();
			}
			// 해당 코드 종류 첫번째 글자가 없으면
			if(!resourceMap.containsKey(code)) {		
				List<ResourceVO> typeList = new ArrayList<ResourceVO>();
				typeList.add(type);
				resourceMap.put(code, typeList);
			}else {
				// 이미 있는 종류의 종류가 온다면
				List<ResourceVO> existList = (List<ResourceVO>) resourceMap.get(code);
				existList.add(type);
				resourceMap.put(code, existList);
			}
		}
		return resourceMap;
	}
}
