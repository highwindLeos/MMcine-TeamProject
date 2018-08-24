package com.tj.mmcine.service;

import com.tj.mmcine.model.Customer;

public interface ICustomerService {
	//서비스 작업지시서, Dao와 직접적인연결은 서비스단가서한다 인터페이스들은 그냥 내용물이뭔지 알려주는 포장지역할
	public Customer customerlogin(Customer customer);
}
