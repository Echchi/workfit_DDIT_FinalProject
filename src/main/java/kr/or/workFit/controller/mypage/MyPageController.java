package kr.or.workFit.controller.mypage;


import java.io.File;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.or.workFit.controller.commons.FilePath;
import kr.or.workFit.service.mypage.MyPageService;
import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/workfit/mypage")
public class MyPageController {
	
	@Inject
	MyPageService service;
	
	
	@GetMapping("/main")
	public String main(@SessionAttribute("memId")String id, Model model) {
		log.info("마이페이지 메인");
		MemberVO member = service.selectMem(id);
		log.info("회원, {}", member);
		log.debug("회원2, {}", member);
		model.addAttribute("member", member);
		model.addAttribute("memId", id);
		model.addAttribute("menu", "mypage");
		
		return "workfit/mypage/main";
	}
	
	// 회원정보 수정
	@PostMapping(value = "/modify", produces = "application/json;charset=UTF-8")	// 사용자의 upload 요청을 받는 요청URL
	@ResponseBody				// ajax 요청으로 받겠다는 의미
	public MemberVO memberModfiy(MemberVO memberVO, HttpServletRequest req, MultipartFile profileImg) throws Exception {
		log.debug("회원 정보 : {}", memberVO);
		log.debug("사진 정보 : {}", profileImg.getOriginalFilename());
		
		// 사진(.metadata) 경로
		ServletContext sc = req.getSession().getServletContext();	// ContextPath
		String realPath = sc.getRealPath("/resources/uploads/profileImages");
		// realPath => .metadata/.plugins/.server.core/resources/uploads/profileImages
		
		
		// DB 저장할 경로 /resources/uploads/profileImages/종은.jpg
		String dbSavePath = sc.getContextPath() + "/resources/uploads/profileImages/" + profileImg.getOriginalFilename();
		memberVO.setMemProfileUrl(dbSavePath);
		log.debug("리얼 패스 : {}", realPath);
		log.debug("파일 패스 : {}", dbSavePath);
		log.debug("회원 프로필 사진 경로 정보 : {}", memberVO.getMemProfileUrl());
		
		// 근데 나는 찐 프로젝트 webapp/resources/uploads/~~/종은.jpg를 넣고 싶음
		// 그래서 만든게 정종은이 만든 FilePath 클래스를 일단 한 번 선언 하고
		// 클래스 변수명.getRealPath()를 사용하면 된다.
		// 이때 파라미터는 .metaData/어쩌구 저쩌구 넣어야함 !!
		// 그러면 저 메소드는 진짜 찐찐찐 들어갈 경로로 파일을 복사해놓음 !
		// 사진 실제 파일 복사할 경로
		FilePath pathMaker = new FilePath();
		String savePath = pathMaker.getRealPath(realPath);  // webapp/resources/uploads/ 등등
		
		// transferTo => 해당 경로로 파일을 복사해놓는다~!~!
		profileImg.transferTo(new File(savePath + "/" +  profileImg.getOriginalFilename()));
		log.debug("리얼로 들어갈 경로 : {}", savePath);
		
		// 회원 정보 수정
		log.debug("!!!!!!! 마지막으로 최종 들어갈 데이터 : . {}", memberVO );
		service.memberModify(memberVO);
		return memberVO;	// 클라이언트 쪽에서 사용하기 위해서 Path 리턴
	}
	

	
	
	
}
