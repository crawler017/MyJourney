package com.ocd.service;


import com.ocd.pojo.Customer;
import com.ocd.util.Page;

import java.util.List;


public interface CustomerService {

	// 查询客户列表
	public Page<Customer> findCustomerList(Integer page, Integer rows,
										   String custName, String custSource, String custIndustry, String custLevel);

	public Customer getCustomerById(Long id);

	public void updateCustomer(Customer customer);

	public void addCustomer(Customer customer);

	public void deleteCustomer(Long id);

	List<Customer> aaa();
}
