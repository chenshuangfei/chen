package com.chen.service;

import java.util.List;
import java.util.Map;

import com.chen.pojo.EmployeeInfo;

public interface EmployeeInfoService {
    int deleteByPrimaryKey(Long id);

    int insert(EmployeeInfo record);
    
    List<EmployeeInfo> selectEmployeeInfoAll(Map<String ,Object> map);
    
    int selectEmployeeIncount();
    
    EmployeeInfo selectEmployeeInfo(EmployeeInfo employeeInfo);
    
    int insertSelective(EmployeeInfo record);

    EmployeeInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EmployeeInfo record);
    
    List<EmployeeInfo> selectEmployeeInfoNameorPossword(Map<String, Object> map);
    
    EmployeeInfo selectEmployeeInfolast();
    
    int updateByPrimaryKey(EmployeeInfo record);
}