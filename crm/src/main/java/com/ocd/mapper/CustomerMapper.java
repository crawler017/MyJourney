package com.ocd.mapper;


import com.ocd.pojo.Customer;

import java.util.List;

public interface CustomerMapper {

	List<Customer> selectCustomerList(Customer customer);
	int selectCustomerListCount();
	Customer getCustomerById(Long id);
	void updateCustomer(Customer customer);
	void addCustomer(Customer customer);
	void deleteCustomer(Long id);
//	@Select("SELECT * from customer")
	List<Customer> aaa();

}