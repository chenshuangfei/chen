package com.chen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.chen.pojo.EmployeeInfo;

public class LoginHandlerIntercepter  implements HandlerInterceptor{

	 //不拦截的页面
	    private static final String[] IGNORE_URI={"/login"};   //填写XX.do
	    @Override  
	    public void afterCompletion(HttpServletRequest request,  
	            HttpServletResponse response, Object arg2, Exception arg3)  
	            throws Exception {  
	    }  
	    @Override  
	    public void postHandle(HttpServletRequest arg0, HttpServletResponse response,  
	            Object arg2, ModelAndView arg3) throws Exception {  
	          //  response.sendRedirect("/login.jsp");  
	    }  
	    @Override  
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
	            Object arg2) throws Exception {  
	      
	        //对请求路径进行判断
	        String servletPath=request.getServletPath(); 
	        boolean flag=false;   //用于存储判断登录的结果
	        //判断请求是否需要拦截
	        for(String s:IGNORE_URI){
	            if(servletPath.contains(s)){
	                flag=true;    //如果是不拦截的网站，flag为true,跳出循环，转向下个方法
	                break;
	            }
	        }
	        //拦截请求
	        if(!flag){   //如果是非公开的页面↓
	        	EmployeeInfo admin = (EmployeeInfo) request.getSession(true).getAttribute("employee");
	            if(admin==null){
	                //System.out.println("AuthorizationInterceptor拦截请求");
	                //request.setAttribute("message", "请先登录管理员后再访问网站");
	                request.getRequestDispatcher("src/main/webapp/WEB-INF/view/login.jsp").forward(request, response);
	            }else{
	                //用户登陆过，验证通过，放行
	                //System.out.println("AuthorizationInterceptor放行请求");
	                flag=true;
	            }
	        }
	        return flag;
	    }  
}
