package com.chen.service;

import java.util.List;
import java.util.Map;

import com.chen.pojo.AttendanceManagement;

public interface AttendanceManagementservice {
    int deleteByPrimaryKey(Long id);

    int insert(AttendanceManagement record);

    int insertSelective(AttendanceManagement record);

    AttendanceManagement selectByPrimaryKey(Long id);
    
    List<AttendanceManagement> selectAttendanceManagementAll(Map<String, Object> map);
    
    int updateByPrimaryKeySelective(AttendanceManagement record);

    int updateByPrimaryKey(AttendanceManagement record);
    
    AttendanceManagement selectAttendanceManagementfo(String record);
    
    List<AttendanceManagement> selectAttendanceManagement(String record);
    
    int selectAttendanceManagementcount();
}