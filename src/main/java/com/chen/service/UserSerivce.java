package com.chen.service;

import com.chen.pojo.User;

public interface UserSerivce {
    int deleteByPrimaryKey(Integer id);
    int insert(User record);
    User selectUser(User user);
    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}