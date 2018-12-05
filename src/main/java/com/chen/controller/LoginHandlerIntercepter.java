package com.chen.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.chen.pojo.EmployeeInfo;

public class LoginHandlerIntercepter  implements HandlerInterceptor{

	 //�����ص�ҳ��
	    private static final String[] IGNORE_URI={"/login"};   //��дXX.do
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
	      
	        //������·�������ж�
	        String servletPath=request.getServletPath(); 
	        boolean flag=false;   //���ڴ洢�жϵ�¼�Ľ��
	        //�ж������Ƿ���Ҫ����
	        for(String s:IGNORE_URI){
	            if(servletPath.contains(s)){
	                flag=true;    //����ǲ����ص���վ��flagΪtrue,����ѭ����ת���¸�����
	                break;
	            }
	        }
	        //��������
	        if(!flag){   //����Ƿǹ�����ҳ���
	        	EmployeeInfo admin = (EmployeeInfo) request.getSession(true).getAttribute("employee");
	            if(admin==null){
	                //System.out.println("AuthorizationInterceptor��������");
	                //request.setAttribute("message", "���ȵ�¼����Ա���ٷ�����վ");
	                request.getRequestDispatcher("src/main/webapp/WEB-INF/view/login.jsp").forward(request, response);
	            }else{
	                //�û���½������֤ͨ��������
	                //System.out.println("AuthorizationInterceptor��������");
	                flag=true;
	            }
	        }
	        return flag;
	    }  
}
