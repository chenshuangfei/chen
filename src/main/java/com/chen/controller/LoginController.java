package com.chen.controller;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chen.pojo.EmployeeInfo;
import com.chen.pojo.User;
import com.chen.service.EmployeeInfoService;
import com.chen.service.UserSerivce;

import web.ResultBean;



@Controller
public class LoginController {
	 @Autowired
	 private EmployeeInfoService employeeInfoService ;

	 @RequestMapping("/login")
	    public ModelAndView login(String msg ,HttpServletRequest request){
	    	request.getSession(true).setAttribute("employee", null);
	        return new ModelAndView("login"); 
	    }
    @RequestMapping("/userLogin")
    @ResponseBody
    public ResultBean<List<EmployeeInfo>> dologin(String msg ,HttpServletRequest request){
    	String userName = request.getParameter("userName");
    	String password = request.getParameter("password");
       	ResultBean<List<EmployeeInfo>> resultBean= new ResultBean<List<EmployeeInfo>>();
       	int count = 0;
    	EmployeeInfo employeeInfo = new EmployeeInfo();
    	employeeInfo.setPassword(password);
    	employeeInfo.setName(userName);
    	EmployeeInfo employee =  employeeInfoService.selectEmployeeInfo(employeeInfo);
    	request.getSession(true).setAttribute("employee", employee);
    	//(EmployeeInfo) request.getSession(true).getAttribute(SESSION_USER);
    	if(employee!=null){
//    		return new ModelAndView("index");
    		count = 1;
    		resultBean.setCount(count);//成功
    	}else{
    		Map<String, Object> condname = new  HashMap<String, Object>();
    		condname.put("name", userName);
    		List<EmployeeInfo> employeename = employeeInfoService.selectEmployeeInfoNameorPossword(condname);
    		Map<String, Object> condpasswprd = new  HashMap<String, Object>();
//    		condpasswprd.put("password", password);
//    		List<EmployeeInfo> employeepassword = employeeInfoService.selectEmployeeInfoNameorPossword(condpasswprd);
//    		return new ModelAndView("login"); 
    		if(employeename.size()==0){
    			count = 2;
    			resultBean.setMsg("用户名不存在");
    		}else{
    			resultBean.setMsg("用户名不存在或密码错误");
    			count = 3;
    		}
    		resultBean.setCount(count);//成功
    	}
    	return resultBean;
    }
    @RequestMapping("/index")
    public ModelAndView index(String msg ,HttpServletRequest request){
    	
    	return new ModelAndView("index"); 
    }
    public  final  static String MD5(String s) {  
    	  char  hexDigits[] = {  '0' ,  '1' ,  '2' ,  '3' ,  '4' ,  '5' ,  '6' ,  '7' ,  '8' ,  '9' ,  
    	    'a' ,  'b' ,  'c' ,  'd' ,  'e' ,  'f'  };  
    	  try  {  
    	   byte [] strTemp = s.getBytes();  
    	   MessageDigest mdTemp = MessageDigest.getInstance("MD5" );  
    	   mdTemp.update(strTemp);  
    	   byte [] md = mdTemp.digest();  
    	   int  j = md.length;  
    	   char  str[] =  new   char [j *  2 ];  
    	   int  k =  0 ;  
    	   for  ( int  i =  0 ; i < j; i++) {  
    	    byte  byte0 = md[i];  
    	    str[k++] = hexDigits[byte0 >>> 4  &  0xf ];  
    	    str[k++] = hexDigits[byte0 & 0xf ];  
    	   }  
    	   return   new  String(str);  
    	  } catch  (Exception e) {  
    	   return   null ;  
    	  }  
    	}  
}