package com.chen.dao;

import java.util.List;
import java.util.Map;

import com.chen.pojo.AttendanceManagement;

public interface AttendanceManagementMapper {
    int deleteByPrimaryKey(Long id);

    AttendanceManagement selectAttendanceManagementfo(String record);
    
    List<AttendanceManagement> selectAttendanceManagement(String record);
    
    int insert(AttendanceManagement record);
   
    int insertSelective(AttendanceManagement record);

    AttendanceManagement selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(AttendanceManagement record);

    List<AttendanceManagement> selectAttendanceManagementAll(Map<String, Object> map);
    
    int updateByPrimaryKey(AttendanceManagement record);
    
    int selectAttendanceManagementcount();
}