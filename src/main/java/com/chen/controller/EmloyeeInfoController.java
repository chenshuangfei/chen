package com.chen.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chen.pojo.EmployeeInfo;
import com.chen.service.EmployeeInfoService;
import com.mysql.fabric.xmlrpc.base.Array;

import web.EncapsulationObject;
import web.ResultBean;



@Controller
public class EmloyeeInfoController {

	 @Autowired
	 private EmployeeInfoService employeeInfoService ;
	 @RequestMapping("/listemployeeInfo")
	 public ModelAndView listemployeeInfo(String msg ,HttpServletRequest request){
		//EmployeeInfo employeeInfo = (EmployeeInfo) request.getSession(true).getAttribute("employee");
//		if(employeeInfo!=null){
//			request.setAttribute("username", employeeInfo.getName());
	    	return new ModelAndView("employeeInfo/employeeInfolist"); 
//	    }else{
//	    	return new ModelAndView("login"); 
//	    }
	 }
	 @RequestMapping("/goaddemployeeInfo")
	 public ModelAndView goaddemployeeInfo(String msg ,HttpServletRequest request){
	     return new ModelAndView("employeeInfo/goaddemployeeInfo"); 
	 }
	 @RequestMapping("/goUpdateemployeeInfo")
	 public ModelAndView goUpdateemployeeInfo(String msg ,HttpServletRequest request){
		 EmployeeInfo employee = employeeInfoService.selectByPrimaryKey(Long.parseLong(request.getParameter("id")));
		 request.setAttribute("employee", employee);
	     return new ModelAndView("employeeInfo/goUpdateemployeeInfo"); 
	 }
	 
	 
	 
    @RequestMapping("/tableemployeeInfo")
    @ResponseBody
    public ResultBean<List<EmployeeInfo>> dologin(String msg ,HttpServletRequest request){
    	ResultBean<List<EmployeeInfo>> resultBean= new ResultBean<List<EmployeeInfo>>();
		Map<String, Object> condition = new  HashMap<String, Object>();
		int limit = Integer.valueOf(request.getParameter("tNumber"));
        int currentPageSize = Integer.valueOf(request.getParameter("startPage"));
        int startNum = (currentPageSize-1) * limit;
        condition.put("name", request.getParameter("name"));
        condition.put("post1", getpost(request.getParameter("post")));
        condition.put("startNum", startNum);
        condition.put("limit", limit);
        condition.put("startNum", startNum);
        condition.put("limit", limit);
		resultBean.setMsg("获取成功");
		List<EmployeeInfo> EmployeeInfolist  = new ArrayList<EmployeeInfo>();
			EmployeeInfolist = employeeInfoService.selectEmployeeInfoAll(condition);
			Integer count = employeeInfoService.selectEmployeeIncount();
			resultBean.setData(EmployeeInfolist);
			resultBean.setCount(count);
		
		return resultBean;
    }
    
    
    @RequestMapping("/doaddemployeeInfo")
    @ResponseBody
	public ResultBean<EmployeeInfo> doaddemployeeInfo(Model model,HttpServletRequest request){
    	String msg ="新增成功";
		ResultBean<EmployeeInfo> bean = new ResultBean<EmployeeInfo>();
		EmployeeInfo employeeInfo = new EmployeeInfo();
		EncapsulationObject.getObjectFromRequest(employeeInfo, request);
		EmployeeInfo employee = employeeInfoService.selectEmployeeInfolast();
		if(employee==null){
			employeeInfo.setStaffno("Epoint2017080001");
		}else{
			getStaffno(employee.getStaffno());
		}
		employeeInfo.setFloatingbonus(new BigDecimal("0.0"));
		employeeInfo.setStaffno(getStaffno(employee.getStaffno()));
		employeeInfoService.insertSelective(employeeInfo);
		bean.setCode(0);
		bean.setMsg(msg);
		return bean;
	 }
    
    public  String getStaffno(String staffno){
    	String staffno2 = "Epoint";
    	Date date  = new Date();
    	DateFormat df = new java.text.SimpleDateFormat("yyyyMM");
    	String d = df.format(date);
    	int data=0;
    	if(staffno==null){
    		data = 10001+0;
    	}else{
    		data = 10001+Integer.valueOf(staffno.substring(staffno.length()-4, staffno.length()));
    	}
    	String no = String.valueOf(data);
    	String staffno1 = no.substring(1, no.length());
    	String staffno3 = staffno2+d+staffno1;
    	return staffno3;
	 }
   
    
	 @RequestMapping("/doUpdateemployeeInfo")
	 @ResponseBody
	 public ResultBean<EmployeeInfo> doUpdateemployeeInfo(HttpServletRequest request){
		 String msg ="修改成功";
		 ResultBean<EmployeeInfo> bean = new ResultBean<EmployeeInfo>();
		 EmployeeInfo employeeInfo = new EmployeeInfo();
		 EncapsulationObject.getObjectFromRequest(employeeInfo, request);
		 employeeInfo.setId(Long.parseLong(request.getParameter("id")));
		 employeeInfoService.updateByPrimaryKeySelective(employeeInfo);
		 bean.setCode(0);
		 bean.setMsg(msg);
		 return bean;
	 }
	 @RequestMapping("/judgenameemployeeInfo")
	 @ResponseBody
	 public ResultBean<EmployeeInfo> judgenameemployeeInfo(HttpServletRequest request){
		 	String msg ="姓名重复请在姓名后加部门名称";
		 	ResultBean<EmployeeInfo> bean = new ResultBean<EmployeeInfo>();
		 	Map<String, Object> condition = new  HashMap<String, Object>();
	        condition.put("name", request.getParameter("name"));
	        List<EmployeeInfo> list = employeeInfoService.selectEmployeeInfoAll(condition);
	        if(list.size()>0){
	        	bean.setCode(0);
	        	bean.setMsg(msg);
	        }else{
	        	msg="姓名合格";
	        	bean.setMsg(msg);
	        }
			return bean;
	 }
	 @RequestMapping("/dodelemployeeInfo")
	 @ResponseBody
	 public ResultBean<EmployeeInfo> dodelemployeeInfo(HttpServletRequest request){
		 	String msg ="删除成功";
		 	ResultBean<EmployeeInfo> bean = new ResultBean<EmployeeInfo>();
			employeeInfoService.deleteByPrimaryKey(Long.parseLong(request.getParameter("id")));
		 	bean.setCode(0);
			bean.setMsg(msg);
			return bean;
	 }
	 public  String getpost(String p){
		 	String post="";
	    	if("研发岗位".equals(p)){
	    		post="1";
	    	}else if("测试岗位".equals(p)){
	    		post="2";
	    	}else if("人事岗位".equals(p)){
	    		post="3";
	    	}else if("行政岗位".equals(p)){
	    		post="4";
	    	}else if("财务岗位".equals(p)){
	    		post="5";
	    	}else if("其他岗位".equals(p)){
	    		post="6";
	    	}else if(!StringUtils.isNotBlank(p)){
	    	}else{
	    		post="7";
	    	}
	    	return post;
		 }
	 
	 public static void main(String[] args) {
		  
		   ArrayList<Integer> arr=new ArrayList<>();
		   arr.add(89);
		   arr.add(78);
		   arr.add(56);
		   arr.add(92);
		   arr.add(76);
		        
		   //升序排列；
		   Collections.sort(arr);
		   //逆序输出
		     // Collections.reverse(arr); 
		   
		      System.out.println(arr);
		 /* for(int i=0;i<arr.size();i++){
		     //这就是你要的效果 
		   System.out.println("0"+i+"  "+arr.get(i));
		    }*/
		    
		 }
	 
}