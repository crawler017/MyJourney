package com.ocd.mapper;


import com.ocd.pojo.CustomerTrack;

import java.util.List;

public interface CustomerTrackMapper {

    List<CustomerTrack> selectCustomerTrackList(CustomerTrack customerTrack);
    int selectCustomerTrackListCount();
    CustomerTrack getCustomerTrackById(Long id);
    void updateCustomerTrack(CustomerTrack customerTrack);
    void addCustomerTrack(CustomerTrack customerTrack);
    void deleteCustomerTrack(Long id);
    //	@Select("SELECT * from customer")
    List<CustomerTrack> aaa();

}