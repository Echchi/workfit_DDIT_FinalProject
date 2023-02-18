package kr.or.workFit.controller.mypage;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.workFit.service.mypage.BusinessTripService;
import kr.or.workFit.vo.BusinessTripVO;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/mypage")
public class BusinessTripController {
	
	@Resource(name="BusinessTripService")
	private BusinessTripService service;

	/**
	 * 출장 신청 페이지를 리턴하는 메소드
	 * @param model
	 * @param memDeptCode
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/businessTrip")
	public String businessTripMain(Model model, @SessionAttribute("memDeptCode") String memDeptCode) throws Exception {
		model.addAttribute("menu", "commuteManage");
		log.debug("부서코드 !! : {}",memDeptCode);
		List<MemberVO> myDeptList = service.getMydeptList(memDeptCode);
		model.addAttribute("myDeptList", myDeptList );
		return "workfit/mypage/businessTrip";
	}
	
	
	/**
	 * 출장 신청하는 메소드
	 * @param buVo
	 * @return
	 * @throws Exception
	 */
	@PostMapping("insertBusinessTrip")
	@ResponseBody
	public String insertBusinessTrip( BusinessTripVO buVo) throws Exception {
		log.debug("온 데이터 : {}", buVo);
		int result = service.insertBusinessTrip(buVo);
		if(result > 0) {
			return "OK";
		}
		return "FAILED";
	}
	
	/**
	 * 출장 신청 삭제하는 메소드
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/deleteBusinessTrip")
	@ResponseBody
	public String deleteBusinessTrip(@RequestBody String code) throws Exception {
		log.debug("삭제할 출장 코드 : {}", code);
		int result = service.deleteBusinessTrip(code);
		if(result > 0) {
			return "OK";
		}
		return "FAILED";
	}
	
	/**
	 * 내 출장 신청 목록 불러오는 메소드
	 * @param memId
	 * @return
	 */
	@GetMapping("/myBusinessTrip")
	@ResponseBody
	public List<BusinessTripVO> myBusinessTrip(String memId, String time) {
		log.debug("쿼리스트링 받기 : {}", memId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("time", time);
		map.put("memId", memId);
		List<BusinessTripVO> myBusinessList = service.myBusinessList(map);
		return myBusinessList;
	}
	//-------------------------------------  출장 승인 -----------------------------
	/**
	 *  출장 승인 페이지를 리턴하는 메소드
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/btApprove")
	public String btApprove(Model model) throws Exception {
		// 승인자가 내 것인 것만 불러오기
		model.addAttribute("menu", "commuteManage");
		return "workfit/mypage/businessTripApprove";
	}
	
	/**
	 * 출장 승인 리스트 가져오는 메소드
	 * @param businessTripConfirmid
	 * @return
	 */
	@GetMapping("/myBusinessTripApprove")
	@ResponseBody
	public List<BusinessTripVO> myBusinessTripApprove(String time,@SessionAttribute("memId") String businessTripConfirmid){
		log.debug("시간, {}", time);
		log.debug("승인자 아이디 ? , {}", businessTripConfirmid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("time", time);
		map.put("businessTripConfirmid", businessTripConfirmid);
		List<BusinessTripVO> approveList = service.myBusinessTripApprove(map);
		log.debug("출장 승인 리스트 : {}", approveList);
		return approveList;
	}
	
	@PostMapping("/businessTripManage")
	@ResponseBody
	public String businessTripManage(@RequestBody Map<String, Object> map) {
		/*
		 *  status = > Y(승인) / D(반려)
		 *  btList => 리스트
		 	{  "status": "Y", "btList": [  "4",  "3"   ] }
		 * */
		log.debug("출장 승일할거 받은 해당 정보 : {}", map);
		int result = service.businessTripManage(map);
		return "OK";
	}
	
	/**
	 * 코드로 단건 출장 데이터 가져오는 메소드
	 * @param businessTripCode
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/getOneBusiness/{btId}", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getOneBusiness(@PathVariable("btId")String businessTripCode) throws Exception {
		BusinessTripVO oneBusiness = service.getOneBusiness(businessTripCode);
		MemberVO mem = service.getApproveMemInfo(businessTripCode);
		
		Gson gson = new Gson();
		String btGson = gson.toJson(oneBusiness);
		JsonObject jsonObject = new JsonParser().parse(btGson).getAsJsonObject();
        jsonObject.addProperty("confirmName", mem.getMemName());
        jsonObject.addProperty("confirmJobGrade", mem.getMemJobGrade());
        
        log.debug("gson 문자열!!!!!, {}" , jsonObject.toString());
		return jsonObject.toString();
	}	
}
