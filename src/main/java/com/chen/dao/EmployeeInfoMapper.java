package com.chen.dao;

import java.util.List;
import java.util.Map;

import com.chen.pojo.EmployeeInfo;
import com.chen.pojo.User;

public interface EmployeeInfoMapper {
    int deleteByPrimaryKey(Long id);

    int insert(EmployeeInfo record);

    List<EmployeeInfo> selectEmployeeInfoAll(Map<String ,Object> map);
    
    int selectEmployeeIncount();
    
    List<EmployeeInfo> selectEmployeeInfoNameorPossword(Map<String, Object> map);
    
    EmployeeInfo selectEmployeeInfolast();
    
    EmployeeInfo selectEmployeeInfo(EmployeeInfo employeeInfo);
    
    int insertSelective(EmployeeInfo record);

    EmployeeInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(EmployeeInfo record);

    int updateByPrimaryKey(EmployeeInfo record);
}