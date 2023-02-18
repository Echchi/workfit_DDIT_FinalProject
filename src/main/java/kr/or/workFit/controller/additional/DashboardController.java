package kr.or.workFit.controller.additional;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.hc.client5.http.fluent.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.additional.DashboardService;
import kr.or.workFit.vo.DashBoardListVO;
import kr.or.workFit.vo.DashBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DashboardController {
	
	@Inject
	DashboardService service;
	
	/**
	 * 현재 내 아이디로 대시보드 리스트 컨텐트 가져오는 메소드 
	 * @return
	 * @throws Exception 
	 */
	@GetMapping(value="/getMyDashboardList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<DashBoardVO> getMyDashboardList(@SessionAttribute("memId") String memId) throws Exception {
		List<DashBoardVO> myDashboardList = service.getMyDashboardList(memId);
		log.info("내 대시보드 ! : {}", myDashboardList);
		return myDashboardList;
	}
	
	/**
	 * 대시보드에 없는 리스트 이미지 가져오는 메소드 
	 * @param memId
	 * @return
	 */
	@GetMapping(value="/getDashboardItemImage", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<DashBoardListVO> getDashboardItemImage(@SessionAttribute("memId") String memId) {
		List<DashBoardListVO> DashboardItemInfo = service.getDashboardItemImage(memId);
		log.info("getDashboardItem, {}", DashboardItemInfo);
		return DashboardItemInfo;
	}
	
	/**
	 * 대시보드 정보 db에 넣는 메소드 
	 * @param newDashList
	 * @param memId
	 * @return
	 */
	@PostMapping(value = "/insertDashboardMain2DB", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertDashboardMain2DB(@RequestBody List<DashBoardVO> newDashList, @SessionAttribute("memId") String memId) {
		log.debug("잘 들어왔니 ?? , {}", newDashList);
		
		// 1. 일단 없앨거 delete하기 !! 
		// delete 용 맵 만들기 
		Map<String, Object> deleteMap = new HashMap<String, Object>();
		List<String> myWidgetList = new ArrayList<String>();
		for (DashBoardVO dashBoardVO : newDashList) {
			dashBoardVO.setMemId(memId);
			myWidgetList.add(dashBoardVO.getDashListCode());
		}
		
		deleteMap.put("memId", memId);
		deleteMap.put("widgetList", myWidgetList);
		log.debug("delete 할 map 확인하기 : {}", deleteMap);
		int deleteRes = service.deleteDashboardMain2DB(deleteMap);
		log.debug("디비 잘 사라졌니 ...? 몇개야 ?? , {}", deleteRes);
		
		log.debug("update할 list 내용 확인하기 : {}", newDashList);
		int insertRes = service.insertDashboardMain2DB(newDashList);
		log.debug(" update 잘 되었니 ? {}", insertRes);
		return "OK";
	}
	
	/**
	 * 뉴스 크롤링 하는 메소드 
	 * @return
	 * @throws IOException
	 */
	@GetMapping(value = "/getNews", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String getNews() throws IOException {
		log.debug("뉴스 컨트롤러 타니 ?? ");
		// requestParam 은 변수명을 바꾸고 싶을때 쓰고
		// 그냥 바로 받아도 된다 !!
//	     String bbb = URLEncoder.encode("ㅇㅇ","utf-8");
	     /*
	     	# 정치 섹션을 눌렀을때, url 주소
			https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=100
			# 경제 섹션을 눌렀을때, url 주소
			https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=101
			# 사회 섹션을 눌렀을때, url 주소
			https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=102 
	      
	      * */
	     String uri = "https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=100";
//	     return Request.get("https://news.google.com/rss/search?q="+ bbb+ "&hl=ko&gl=KR&ceid=KR:ko")
		 String result =  Request.get(uri)
	    		 	   			 .execute()		// 요청을 실행하고
	    		 	   			 .returnContent()	// 결과를 받고
	    		 	   			 .asString();		// 문자로 바꾸어서 리턴~
//		 log.debug("결과는 ? ,{}", result);
		 String uls = result.substring(result.indexOf("<ul class=\"type06_headline\">"), result.indexOf("<ul class=\"type06\">"));
		 return uls;
	}
	
	/**
	 * 팀별 출퇴근 현황 조회하는 메소드 
	 * @return
	 * @throws ParseException 
	 */
	@GetMapping("/getMemStatus")
	@ResponseBody
	public List<Map<String, Object>> getMemStatus(@SessionAttribute("memDeptCode") String deptCode) throws ParseException{
		List<Map<String, Object>> memStatusList = service.getMemStatus(deptCode);
		/*
		 [{MEM_ID=a001, MEM_NAME=조현수, MEM_JOB_GRADE=사원,  work_date,  work_start , work_end}, 
		  {MEM_ID=a04, MEM_NAME=정종은4, MEM_JOB_GRADE=대리}, 
		  {MEM_ID=a01, MEM_NAME=정종은1, MEM_JOB_GRADE=과장}, 
		  {MEM_ID=a02, MEM_NAME=정종은2, MEM_JOB_GRADE=과장}, 
		  {MEM_ID=a000, MEM_NAME=정종은, MEM_JOB_GRADE=사원}, 
		  {MEM_ID=a03, MEM_NAME=정종은3, MEM_JOB_GRADE=대리}]
		  필요한 정보 (이름 / 직급 / 부재 여부 )
		  
		   생각해야 할 것 / 오늘 날짜(work_date) 가 있는지 확인
		     			- 있으면 
		     			    -> work_end 가 있으면서 지금 시간보다 이전인경우 - 부재 
		     			    -> work_end 가 없는 경우  -> 있음 
		     			- 없으면 부재
		          
		*/
		
		List<Map<String, Object>> statusList = new ArrayList<Map<String,Object>>();
		for (Map<String, Object> map : memStatusList) {
//			log.debug("한명한명 !!!!, {}", map);
            // map - db 에서 하나하나씩 끄내는 맵 
			Map<String, Object> status = new HashMap<String, Object>();     // => status (리턴할 리스트에 넣을 맵 )
			status.put("memName", map.get("MEM_NAME"));
			status.put("memJobGrade", map.get("MEM_JOB_GRADE"));
			status.put("memImg", map.get("MEM_PROFILE_URL"));
			
            Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/DD HH:mm");
            String today = sdf.format(date);        // 오늘날짜 : 2023/01/28 21:56

            String endTime = "";            // 종료시간 
            
            // 근무일 존재하면 
			if(map.containsKey("WORK_DATE")) {
                // 종료시간이 없으면 
//				log.debug("종료시간 : {}", map.get("WORK_END"));
				
			    if(map.get("WORK_END").equals("-")) {		// - 인 경우
                    endTime = today;
                }else{									// 종료시간 있는 경우 
                    String workEnd = (String) map.get("WORK_END");
                    endTime = today.substring(0,11) + workEnd;
                }
//			    log.debug("한번 확인 해보자 !!! {}" , endTime);
                Date now = sdf.parse(today);
                Date compare = sdf.parse(endTime);
                boolean commuteStatus = now.after(compare) || now.equals(compare);
//                log.debug("출근중 ?? :  {}", commuteStatus);
                if(commuteStatus){
                	status.put("status", "YES");
                }else{
                    status.put("status", "NO");
                }
            //근무일 존재하지 않으면 => 부재중
			}else {
//				log.debug("출근중 ?? :  NO");
				status.put("status", "NO");
				
			}
            statusList.add(status);
		}
		log.debug("리턴할 결과값 : {}",statusList);
		return statusList;
	}
	

	
	
}
