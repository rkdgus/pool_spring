package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.domain.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("===========postHandler================");
		HttpSession session = request.getSession();
		if(session.getAttribute("login") !=null){
			logger.info("===========login success================");
			Object dest = session.getAttribute("dest");
			String path = (dest !=null)? (String) dest : request.getContextPath();
			//프로젝트 이름을 반환 : request.getContextPath()
			session.removeAttribute("dest");
			response.sendRedirect(path);//homecontroller로 이동
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("=================preHandler================");
	
		HttpSession session = request.getSession();
		if(session.getAttribute("login")!=null){
			logger.info("이전 login 정보 삭제");
			session.removeAttribute("login");
		}
		
		return true;
	}
	
	
}
