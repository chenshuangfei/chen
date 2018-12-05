package com.chen.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.chen.dao.UserMapper;
import com.chen.pojo.User;
import com.chen.service.UserSerivce;

@Service("userSerice")
public class UserServiceImpl implements  UserSerivce{
	@Resource
	private UserMapper Userdao;

	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return Userdao.deleteByPrimaryKey(id);
	}


	public int insert(User record) {
		// TODO Auto-generated method stub
		return Userdao.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return Userdao.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return Userdao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User selectUser(User user) {
		// TODO Auto-generated method stub
		return Userdao.selectUser(user);
	}
	
	
    
}