package com.chen.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chen.pojo.AttendanceManagement;
import com.chen.pojo.EmployeeInfo;
import com.chen.service.AttendanceManagementservice;
import com.chen.service.EmployeeInfoService;

import web.DateUtils;
import web.EncapsulationObject;
import web.ResultBean;



@Controller
public class AttendanceManagementController {

	 @Autowired
	 private EmployeeInfoService employeeInfoService ;

	 @Autowired
	 private AttendanceManagementservice attendanceManagementservice ;
	 @RequestMapping("/listattendanceManagement")
	 public ModelAndView listemployeeInfo(String msg ,HttpServletRequest request){
		 EmployeeInfo employeeInfo = (EmployeeInfo) request.getSession(true).getAttribute("employee");
		 if(employeeInfo!=null){
			 request.setAttribute("username", employeeInfo.getName());
			 return new ModelAndView("attendanceManagement/attendanceManagementlist"); 
		 }else{
		    return new ModelAndView("login"); 
		 }
	 }
    @RequestMapping("/tableattendanceManagement")
    @ResponseBody
    public ResultBean<List<AttendanceManagement>> dologin(String msg ,HttpServletRequest request){
    	ResultBean<List<AttendanceManagement>> resultBean= new ResultBean<List<AttendanceManagement>>();
		Map<String, Object> condition = new  HashMap<String, Object>();
		int limit = Integer.valueOf(request.getParameter("tNumber"));
        int currentPageSize = Integer.valueOf(request.getParameter("startPage"));
        int startNum = (currentPageSize-1) * limit;
        condition.put("name", request.getParameter("name"));
        condition.put("post", request.getParameter("post"));
        condition.put("startNum", startNum);
        condition.put("limit", limit);
        condition.put("startNum", startNum);
        condition.put("limit", limit);
		resultBean.setMsg("获取成功");
		List<AttendanceManagement> AttendanceManagementlist  = new ArrayList<AttendanceManagement>();
		AttendanceManagementlist = attendanceManagementservice.selectAttendanceManagementAll(condition);
		Integer count = attendanceManagementservice.selectAttendanceManagementcount();
			resultBean.setData(AttendanceManagementlist);
			resultBean.setCount(count);
		
		return resultBean;
    }
    
    
    @RequestMapping("/doaddattendanceManagement")
    @ResponseBody
	public ResultBean<AttendanceManagement> doaddemployeeInfo(Model model,HttpServletRequest request){
    	String msg ="打卡成功";
    	EmployeeInfo employeeInfo = (EmployeeInfo) request.getSession(true).getAttribute("employee");
		ResultBean<AttendanceManagement> bean = new ResultBean<AttendanceManagement>();
		AttendanceManagement attendanceManagement = new AttendanceManagement();
		attendanceManagement.setAttendanceno(getUUID());
		Date date = new Date();
		boolean b = gettime();
		if(b){
			if(employeeInfo.getFloatingbonus()==null){
				employeeInfo.setFloatingbonus(new BigDecimal("0.0"));
			}
			employeeInfo.setFloatingbonus(employeeInfo.getFloatingbonus().add(new BigDecimal("-100")));
			employeeInfoService.updateByPrimaryKeySelective(employeeInfo);
			AttendanceManagement attendanceManagements = attendanceManagementservice.selectAttendanceManagementfo(employeeInfo.getStaffno());
			if(attendanceManagements==null){
				attendanceManagement.setLatenessnumber(1);
			}else{
				attendanceManagement.setLatenessnumber(attendanceManagements.getLatenessnumber()+1);
			}
		}else{
			AttendanceManagement attendanceManagements = attendanceManagementservice.selectAttendanceManagementfo(employeeInfo.getStaffno());
			if(attendanceManagements==null){
				attendanceManagement.setLatenessnumber(0);
			}else{
				attendanceManagement.setLatenessnumber(attendanceManagements.getLatenessnumber());
			}
		}
		attendanceManagement.setStaffno(employeeInfo.getStaffno());
		attendanceManagement.setCreater(employeeInfo.getName());
		attendanceManagement.setAttendancetime(date);
		List<AttendanceManagement> list = attendanceManagementservice.selectAttendanceManagement(employeeInfo.getStaffno());
		if(list.size()>0){
			msg="不好意思今天已经打卡了！";
			bean.setCode(1);
			bean.setMsg(msg);
		}else{
			attendanceManagementservice.insertSelective(attendanceManagement);
			bean.setCode(0);
			bean.setMsg(msg);
		}
		return bean;
	 }
    public boolean gettime(){
    	Date d = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String time = df.format(d)+" "+"09:00:00";
		boolean b = DateUtils.compareCurrentDate(time);
		return b;
    }
    public String getUUID(){
        UUID uuid=UUID.randomUUID();
        String str = uuid.toString(); 
        return str;
      }
 
    
	 @RequestMapping("/doUpdateattendanceManagement")
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
	
	 @RequestMapping("/dodelattendanceManagement")
	 @ResponseBody
	 public ResultBean<EmployeeInfo> dodelemployeeInfo(HttpServletRequest request){
		 	String msg ="删除成功";
		 	ResultBean<EmployeeInfo> bean = new ResultBean<EmployeeInfo>();
			employeeInfoService.deleteByPrimaryKey(Long.parseLong(request.getParameter("id")));
		 	bean.setCode(0);
			bean.setMsg(msg);
			return bean;
	 }
	 
}