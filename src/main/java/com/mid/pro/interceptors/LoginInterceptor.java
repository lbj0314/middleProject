package com.mid.pro.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean result = false;
		Object obj = request.getSession().getAttribute("member");
		
		if(obj !=null) {
			result = true;
		}else {
			response.sendRedirect("../member/memberLogin");
		}
		
		return result;
	}
	
}
