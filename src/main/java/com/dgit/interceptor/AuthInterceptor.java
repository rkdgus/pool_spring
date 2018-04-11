package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		logger.info("postHandle ===========================");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("preHandle ===========================");
		//login이 된 상태인지 먼저 확인한 후 화면을 전환
		HttpSession session  =request.getSession();
		if(session.getAttribute("login")==null){
			logger.info("go login");
			saveDest(request);
			response.sendRedirect(request.getContextPath()+"/login/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest req){
		
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")){
			query = "";
		}else{
			query="?"+query;
		}
		
		if(req.getMethod().equals("GET")){
			//dest:/ex01/sboard/readPage?page=1&perPageNum=10&searchType&keyword&bno=3069
			logger.info("dest:"+(uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
		
	}
	
	
}
