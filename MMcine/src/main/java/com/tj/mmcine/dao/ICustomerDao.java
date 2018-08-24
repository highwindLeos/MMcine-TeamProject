package com.tj.mmcine.dao;

import com.tj.mmcine.model.Customer;

public interface ICustomerDao {
	//interface는 작업지시서
	public Customer customerlogin(Customer customer);
}
