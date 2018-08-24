package com.tj.mmcine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mmcine.dao.AdminDao;
import com.tj.mmcine.model.Admin;

@Service
public class AdminrService implements IAdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public Admin adminLogin(Admin admin) {
		return adminDao.adminLogin(admin) ;
	}
}
