package kr.or.workFit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	// 사용자 정의 접근 거부 핸들러 클래스
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("메롱:" + accessDeniedException.getMessage()); // 요게 있어야 이유를 알지용, 그렇지용?
		HttpSession session = request.getSession();
		session.setAttribute("error", accessDeniedException.getStackTrace());
		accessDeniedException.getStackTrace();
		log.info("***Security*** AcessDeniedHandler ERROR");
		response.sendRedirect("/login");
	//	response.sendRedirect("/workfit/main");
//		request.setAttribute("Error", accessDeniedException.getMessage());
//		request.getRequestDispatcher("/workfit/main").forward(request, response);
	}

}
