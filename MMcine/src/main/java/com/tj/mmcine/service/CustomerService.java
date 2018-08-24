package com.tj.mmcine.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.mmcine.dao.CustomerDao;
import com.tj.mmcine.model.Customer;
//이페이지는 서비스단다를 설정
@Service
public class CustomerService implements ICustomerService {
	//만들어놓은 Dao를 가져옴
	@Autowired
	private CustomerDao cusDao;
	//인터페이스에서 작업지시해놓은걸 오버라이드하여 작업실행 여기랑 컨트롤단이랑 직접적으로 연결됨
	@Override
	public Customer customerlogin(Customer customer) {
		return cusDao.customerlogin(customer);
	}
	
}
