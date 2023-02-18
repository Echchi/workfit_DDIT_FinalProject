package kr.or.workFit.controller.realAdminpage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
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

import kr.or.workFit.service.realAdminpage.AdminService;
import kr.or.workFit.vo.DeptVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	/*
	 * @PostMapping(value = "/importExcel", produces = "text/plain;charset=utf-8")
	 * // public String importExcel(@RequestParam("importData") String importData) {
	 * public String importExcel(@RequestBody List<Map<String, String>> listMap) {
	 * 
	 * log.debug("importExcel 데이터 넘어온 것 확인 {}", listMap); return "성공이라능"; }
	 */
	
	@ResponseBody
	@PostMapping(value="/controllUser/{methodStatus}")
	public int controllUser(@PathVariable("methodStatus") String methodStatus,  @RequestBody List<Map<String, String>> dataMap, @SessionAttribute("memCo") String memCo) {
		
		log.debug("전송된 methodStatus:{}",methodStatus);
		log.debug("addUser 비동기 데이터 확인: {}", dataMap);
		int rslt = 0;
		
		switch (methodStatus) {
		case "delete":
			int cnt1 = service.deleteMember(dataMap);
			int cnt2 = service.insertDecease(dataMap);
			rslt = 2;
			break;
		case "insert":
			for(Map<String, String> map : dataMap) {
				map.put("coCode", memCo);
			}
			int addCnt = service.addUser(dataMap);
			
			List<MemberVO> memList = service.selectMyMember(memCo);
			
			//엑셀데이터에 아이디 넣어주기
			for(MemberVO vo : memList) {
				for(Map<String, String> map : dataMap) {
					if(map.get("memDeptId").equals(vo.getMemDeptId())) {
						map.put("memId", vo.getMemId());
					}
				}
			}
			
			log.debug("아이디 넣어준 map: {}", dataMap);
			
			int authCnt = service.insertAuth(dataMap);
			log.debug("addCnt:{}",addCnt); log.debug("authCnt:{}",authCnt);
			rslt = 2;
			break;

		}
		return rslt;
	}
	
	
	/*
	 * //일단 안쓰는 메소드
	 * 
	 * @ResponseBody
	 * 
	 * @PostMapping(value = "/assignMember", produces = "text/plain;charset=utf-8")
	 * public String assignMember(@RequestBody List<Map<String, String>>
	 * assignInfoList, @SessionAttribute("memCo") String memCo) {
	 * 
	 * log.debug("assingMember 비동기 데이터 확인: {}", assignInfoList); int updateCnt =
	 * service.assignMember(assignInfoList); int insertCnt =
	 * service.insertAuth(assignInfoList);
	 * log.debug("updateCnt:{}",updateCnt); log.debug("insertCnt:{}",insertCnt);
	 * 
	 * 
	 * return "성공"; }
	 */
	
	@ResponseBody
	@PostMapping(value = "/export", produces = "application/json;charset=utf-8")
	public List<Map<String, String>> exportData(@RequestBody String data, @SessionAttribute("memCo") String memCo){
		log.debug("전송받은 데이터:{}", data);
		
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy.MM.dd.");
		List<Map<String, String>> memListInDept = service.selectMemberInDept(memCo);
		
		//날짜 포매팅
		for(Map<String, String> map : memListInDept) {
			map.get("MEMWORKSTARTDAY");
			String date = newDtFormat.format(map.get("MEMWORKSTARTDAY"));
			map.put("MEMWORKSTARTDAY", date);
			
			String birthDate = newDtFormat.format(map.get("MEMBIRTH"));
			map.put("MEMBIRTH", birthDate);
		}
		
		return memListInDept;
	}
	
	
	
	
	
	/** 유저 관리 페이지 이동
	 * @return
	 */
	@GetMapping(value = "/manageUser")
	public String manageUser(@SessionAttribute("memId") String memId, @SessionAttribute("memCo") String memCo, Model model) {
		
		SimpleDateFormat newDtFormat = new SimpleDateFormat("yyyy.MM.dd.");
		
		//부서종류 셀렉트 및 인원 수 셀렉트 
		List<DeptVO> deptList = service.selectDeptListInAdmin(memCo);
		//부서배정된 인원 리스트
		List<Map<String, String>> memListInDept = service.selectMemberInDept(memCo);
		//사용중지 유저 리스트
		List<Map<String, String>> memStopList = service.selectMemberInStop(memCo);
		//부서 미배정 인원 리스트
//		List<Map<String, String>> memListNotInDept = service.selectMemberNotInDept(memCo);
		//전체 리스트
		List<Map<String, String>> memAllList = new ArrayList<Map<String, String>>();
		
		memAllList.addAll(memListInDept);
//		memAllList.addAll(memListNotInDept);
		
		//키값 확인
		for(Map<String, String> map : memAllList) {
			Iterator<String> keys = map.keySet().iterator();
            while (keys.hasNext()){
                String key = keys.next();
//                log.debug("KEY : " + key);
            }
		}
		
		//날짜 포매팅
		for(Map<String, String> map : memListInDept) {
			map.get("MEMWORKSTARTDAY");
			String date = newDtFormat.format(map.get("MEMWORKSTARTDAY"));
			map.put("MEMWORKSTARTDAY", date);
		}
		
		
		// 총 인원
		int totalNum = deptList.get(0).getCoUserSize();
		// 사용중 인원
		int presentNum = memAllList.size();
		// 추가 가능인원
		int availableNum = totalNum - presentNum; 
		
		Map<String, Integer> numMap = new HashMap<String, Integer>();
		
		numMap.put("totalNum", totalNum);
		numMap.put("presentNum", presentNum);
		numMap.put("availableNum", availableNum);
	
		model.addAttribute("menu", "admin");
		model.addAttribute("deptList", deptList);
		model.addAttribute("memAllList", memAllList);
		model.addAttribute("memListInDept", memListInDept);
		model.addAttribute("memStopList", memStopList);
		model.addAttribute("numMap", numMap);
//		model.addAttribute("memListNotInDept", memListNotInDept);
		
		return "workfit/realAdminpage/manageUser";
	}
	
	
	/*
	 * //안쓰는 메서드
	 * 
	 * @PostMapping(value = "plusMember")
	 * 
	 * @ResponseBody public int plusMember(@RequestBody List<MemberVO>
	 * memList, @SessionAttribute("memCo") String memCo) {
	 * 
	 * for(MemberVO vo : memList) { log.debug("plusMember 데이터 전송 확인:{}", vo );
	 * vo.setCoCode(memCo); } log.debug("memCO{}", memCo); //memList member 테이블
	 * insert int cnt = service.plusMember(memList); log.debug("인서트 성공여부{}", cnt);
	 * return cnt; }
	 */
	
	
	
	
	/** 유저 추가 페이지 이동
	 * @param memId
	 * @param memCo
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@GetMapping("/addUser")
	public String addUser(@SessionAttribute("memId") String memId, @SessionAttribute("memCo") String memCo, Model model) throws Exception {
		//회사 데이터 가져오기
		
		//회사내 사원 가져오기
		List<MemberVO> memList = service.selectMember(memCo);
		String check = service.selectCoInfo(memCo);
		log.debug("현재 사용중인 멤버십:{}", check);
		
		model.addAttribute("myService", check);
		model.addAttribute("menu", "admin");
		model.addAttribute("memList", memList);
		
		return "workfit/realAdminpage/addUser";
	}
	
	/** 관리자페이지 이동 메소드
	 * @param memId
	 * @param memCo
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@GetMapping("/membership")
	public String adminMain(@SessionAttribute("memId")String memId, @SessionAttribute("memCo") String memCo, Model model) throws Exception {
		
		UUID uuid = UUID.randomUUID();
		String payNum = uuid.toString() + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		String check = service.selectCoInfo(memCo);
		log.debug("현재 사용중인 멤버십:{}", check);
		
		model.addAttribute("myService", check);
		model.addAttribute("payNum", payNum);
		model.addAttribute("menu", "admin");
		return "workfit/realAdminpage/adminpage";
		
	}
	
	/** 관리자 멤버쉽 결제 작동 컨트롤러
	 * @param memId
	 * @param memCo
	 * @param map
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
//	@PostMapping(value = "/payment", produces = "text/plain;charset=utf-8")
	@PostMapping(value = "/payment")
	public int payment(@SessionAttribute("memId")String memId, @SessionAttribute("memCo") String memCo, @RequestBody Map<String, String> map) throws Exception {
		log.debug("payment 컨트롤러 실시 여부 확인");
		log.debug("결제 데이터 확인:{}",map);
		log.debug("회사코드 확인:{}",memCo);
		map.put("memCo", memCo);
		
		int cnt = service.updatePayment(map);
		if(cnt > 0 ) {
			cnt = service.insertPayment(map);
		}
		
		log.debug("결제 데이터 인서트 성공 여부: {}",cnt);
		return cnt;
	}
	
}
