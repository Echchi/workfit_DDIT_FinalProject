package kr.or.workFit.scheduler;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.workFit.service.mypage.MyWorkService;
import kr.or.workFit.vo.WorkVO;

@Component
public class Scheduler {
	
	@Inject
	MyWorkService workservice;
	
	@Scheduled(cron = "0 00  18 * * *")
	public void autoUpdate() {
//		System.out.println("스케줄러를 통한 업데이트");
		
		// 아래는 퇴근 처리를 위한 로직
		System.out.println("퇴근 처리 로직 실행!");
		List<WorkVO> list = workservice.findMemberForCommuteEndProcess();
		
		for(WorkVO vo : list) {
			workservice.endCommute(vo.getMemId());
		}
		
		
	}
	
	
//	public void commuteEnd(@SessionAttribute("memId")String memId) {
//		System.out.println("commuteEnd 들어왔나요??");
//		workservice.endCommute(memId);
//		
//		
//		
//
//		
//	}
	
	
	
}
