package kr.or.workFit.controller.commons;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Listener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("webPath", sc.getContextPath());
		sc.setAttribute("imgPath", "/resources/uploads");
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
