package com.ocd.service.impl;


import com.ocd.mapper.CustomerTrackMapper;
import com.ocd.pojo.CustomerTrack;
import com.ocd.service.CustomerTrackService;
import com.ocd.util.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 拜访客户管理
 * @author lx
 *
 */

@Service("customerTrackService")
@Transactional
public class CustomerTrackServiceImpl implements CustomerTrackService {

    // 定义dao属性
    @Autowired
    private CustomerTrackMapper customerTrackMapper;


    @Override
    public Page<CustomerTrack> findCustomerTrackList(Integer page, Integer rows,
                                           String customer_name, String customer_type) {
        CustomerTrack customerTrack = new CustomerTrack();
        //判断客户名称
        if(StringUtils.isNotBlank(customer_name)){
            customerTrack.setCustomer_name(customer_name);
        }
        //判断客户属性
        if(StringUtils.isNotBlank(customer_type)){
            customerTrack.setCustomer_type(customer_type);
        }
        //当前页
        customerTrack.setStart((page-1) * rows) ;
        //每页数
        customerTrack.setRows(rows);
        //查询客户列表
        List<CustomerTrack> customerTracks = customerTrackMapper.selectCustomerTrackList(customerTrack);
        //查询客户列表总记录数
        int count = customerTrackMapper.selectCustomerTrackListCount();
        //创建Page返回对象
        Page<CustomerTrack> result = new Page<>();
        result.setPage(page);
        result.setRows(customerTracks);
        result.setSize(rows);
        result.setTotal(count);
        return result;

    }


    @Override
    public CustomerTrack getCustomerTrackById(Long id) {

        CustomerTrack customerTrack = customerTrackMapper.getCustomerTrackById(id);
        return customerTrack;

    }


    @Override
    public void updateCustomerTrack(CustomerTrack customerTrack) {
        customerTrackMapper.updateCustomerTrack(customerTrack);

    }

    @Override
    public void addCustomerTrack(CustomerTrack customerTrack) {
        customerTrackMapper.addCustomerTrack(customerTrack);
    }

    @Override
    public void deleteCustomerTrack(Long id) {
        customerTrackMapper.deleteCustomerTrack(id);

    }

    @Override
    public List<CustomerTrack> aaa() {
        return customerTrackMapper.aaa();
    }


}
