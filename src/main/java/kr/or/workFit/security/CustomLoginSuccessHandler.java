package kr.or.workFit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import kr.or.workFit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
//public class CustomLoginSuccessHandler implements  AuthenticationSuccessHandler {
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	// 로그인 전에 접근 시도한 URL로 리다이렉트 하는 클래스
	
	private final RequestCache requestCache = new HttpSessionRequestCache();
	private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws ServletException, IOException {
		log.warn("onAuthenticationSuccess");
		
		HttpSession session = request.getSession();
		log.info("userId {}", auth.getName());
		CustomUser customUser = (CustomUser)auth.getPrincipal();
		log.info("커스텀유저 {}", customUser);
		String memId = customUser.getMemberVO().getMemId();
		String memName = customUser.getMemberVO().getMemName();
		String memCo = customUser.getMemberVO().getCoCode();
		String memDeptName = customUser.getMemberVO().getDeptName();
		String memDeptCode = customUser.getMemberVO().getDeptFk();
		String memJobGrade = customUser.getMemberVO().getMemJobGrade();
		String memEmail = customUser.getMemberVO().getMemEmail();
		MemberVO memberVO = customUser.getMemberVO();
		session.setAttribute("member", memberVO);			// 멤버 객체
		session.setAttribute("memId", memId);				// 회원 아이디
		session.setAttribute("memName", memName);			// 회원 이름
		session.setAttribute("memCo", memCo);				// 회원 회사 코드
		session.setAttribute("memDeptName", memDeptName);	// 회원 부서명
		session.setAttribute("memJobGrade", memJobGrade);	// 회원 직급
		session.setAttribute("memDeptCode", memDeptCode);	// 회원 부서코드
		session.setAttribute("memEmail", memEmail);	// 회원 부서코드
		
	    SavedRequest savedRequest = requestCache.getRequest(request, response);
		
	    if(savedRequest == null) {
	    	String uri = "/workfit/main";
//	    	redirectStrategy.sendRedirect(request, response, uri);
	    }
	    String uri = "/workfit/QRCheck";
	    redirectStrategy.sendRedirect(request, response, uri);
		// 로그인 성공(아이디, 비밀번호, 권한들) => auth에 있음
		// 이제부터 로그인 관련된 정보 / 액션들은 스프링 시큐리티에서 관리하게 됨 
//		super.onAuthenticationSuccess(request, response, auth);
	}
}
