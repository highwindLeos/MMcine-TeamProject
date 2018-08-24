package com.tj.mmcine.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.mmcine.model.Customer;
//Dao로 설정
@Repository
public class CustomerDao implements ICustomerDao {
	//xml에서 설정한 템플릿과 연결 
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	//interface작업지시서에서 지정한것을 오버라이드
	@Override
	public Customer customerlogin(Customer customer) {
		return sessionTemplate.selectOne("customerlogin", customer); //selectOne속 customerlogin는 xml에서 설정한 id랑같아야한다
	}

}
