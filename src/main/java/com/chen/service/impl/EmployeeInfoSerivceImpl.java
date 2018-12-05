package com.chen.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.dao.EmployeeInfoMapper;
import com.chen.pojo.EmployeeInfo;
import com.chen.pojo.User;
import com.chen.service.EmployeeInfoService;
@Service("employeeInfoService")
public class EmployeeInfoSerivceImpl implements EmployeeInfoService{
    @Resource
	private EmployeeInfoMapper employeeInfodao;
	@Override
	public int deleteByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return employeeInfodao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(EmployeeInfo record) {
		// TODO Auto-generated method stub
		return employeeInfodao.insert(record);
	}

	@Override
	public int insertSelective(EmployeeInfo record) {
		// TODO Auto-generated method stub
		return employeeInfodao.insertSelective(record);
	}

	@Override
	public EmployeeInfo selectByPrimaryKey(Long id) {
		// TODO Auto-generated method stub
		return employeeInfodao.selectByPrimaryKey(id);
	}
	public EmployeeInfo selectEmployeeInfolast(){
		return employeeInfodao.selectEmployeeInfolast();
	}
	@Override
	public int updateByPrimaryKeySelective(EmployeeInfo record) {
		// TODO Auto-generated method stub
		return employeeInfodao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(EmployeeInfo record) {
		// TODO Auto-generated method stub
		return employeeInfodao.updateByPrimaryKey(record);
	}

	@Override
	public List<EmployeeInfo> selectEmployeeInfoAll(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return employeeInfodao.selectEmployeeInfoAll(map);
	}

	@Override
	public int selectEmployeeIncount() {
		// TODO Auto-generated method stub
		return employeeInfodao.selectEmployeeIncount();
	}

	@Override
	public EmployeeInfo selectEmployeeInfo(EmployeeInfo employeeInfo) {
		return employeeInfodao.selectEmployeeInfo(employeeInfo);
	}

	@Override
	public  List<EmployeeInfo> selectEmployeeInfoNameorPossword(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return employeeInfodao.selectEmployeeInfoNameorPossword(map);
	}
   
}