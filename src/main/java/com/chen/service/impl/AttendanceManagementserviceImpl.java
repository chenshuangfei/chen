package com.chen.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.dao.AttendanceManagementMapper;
import com.chen.pojo.AttendanceManagement;
import com.chen.service.AttendanceManagementservice;
@Service("attendanceManagementservice")
public class AttendanceManagementserviceImpl implements AttendanceManagementservice {
	@Resource
	private AttendanceManagementMapper attendanceManagementdao;

	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(AttendanceManagement record) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.insert(record);
	}

	@Override
	public int insertSelective(AttendanceManagement record) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.insertSelective(record);
	}

	@Override
	public AttendanceManagement selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(AttendanceManagement record) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(AttendanceManagement record) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.updateByPrimaryKey(record);
	}
	@Override
	public List<AttendanceManagement> selectAttendanceManagementAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.selectAttendanceManagementAll(map);
	}

	@Override
	public AttendanceManagement selectAttendanceManagementfo(String record) {
		return attendanceManagementdao.selectAttendanceManagementfo(record);
	}

	@Override
	public List<AttendanceManagement> selectAttendanceManagement(String record) {
		// TODO Auto-generated method stub
		return attendanceManagementdao.selectAttendanceManagement(record);
	}

	@Override
	public int selectAttendanceManagementcount() {
		// TODO Auto-generated method stub
		return attendanceManagementdao.selectAttendanceManagementcount();
	}

	
  
}