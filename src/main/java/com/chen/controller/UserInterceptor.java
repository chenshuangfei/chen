package com.chen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class UserInterceptor implements HandlerInterceptor{  
	  
    @Override  
    public void afterCompletion(HttpServletRequest request,  
            HttpServletResponse response, Object obj, Exception err)  
            throws Exception {  
    }  
  
    @Override  
    public void postHandle(HttpServletRequest request, HttpServletResponse response,  
            Object obj, ModelAndView mav) throws Exception {  
        response.sendRedirect("/login.jsp");  
    }  
  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object obj) throws Exception {  
        String str = (String) request.getSession().getAttribute("isLogin");  
        System.out.println("str=========>"+str);  
        if(str!=null){  
            return true;  
        }  
        return false;  
    }  
}  