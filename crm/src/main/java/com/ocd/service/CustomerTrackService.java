package com.ocd.service;


import com.ocd.pojo.CustomerTrack;
import com.ocd.util.Page;

import java.util.List;


public interface CustomerTrackService {

    // 查询客户列表
    public Page<CustomerTrack> findCustomerTrackList(Integer page, Integer rows,
                                           String customer_name, String customer_type);

    public CustomerTrack getCustomerTrackById(Long id);

    public void updateCustomerTrack(CustomerTrack customerTrack);

    public void addCustomerTrack(CustomerTrack customerTrack);

    public void deleteCustomerTrack(Long id);

    List<CustomerTrack> aaa();
}
