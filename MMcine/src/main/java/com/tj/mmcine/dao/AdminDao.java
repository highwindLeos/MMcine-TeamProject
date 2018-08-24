package com.tj.mmcine.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mmcine.model.Admin;

@Repository
public class AdminDao implements IAdminDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public Admin adminLogin(Admin admin) {
		return sessionTemplate.selectOne("adminlogin", admin);
	}

}
