package com.ocd.controller;


import com.alibaba.fastjson.JSONObject;
import com.ocd.pojo.CustomerTrack;
import com.ocd.service.CustomerTrackService;
import com.ocd.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 拜访客户管理
 * <p>Title: CustomerTrackController</p>
 * <p>Description: </p>
 *
 * @version 1.0
 */

@Controller
//@RequestMapping("/customer")
public class CustomerTrackController {

    // 依赖注入
    @Autowired
    private CustomerTrackService customerTrackService;

    // 拜访客户列表
    @RequestMapping(value = "/customerTrack/Tracklist")
    public String trackList(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                       String customer_name, String customer_type, Model model) {

        Page<CustomerTrack> pageList= customerTrackService.findCustomerTrackList(page,rows,customer_name,customer_type);
        model.addAttribute("pageList", pageList);

        model.addAttribute("page",pageList);
        return "customerTrack";
    }

    @RequestMapping(value = "/customerTrack/edit",produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String getCustomerTrackById(Long id,Model model) {
        CustomerTrack customerTrack = customerTrackService.getCustomerTrackById(id);
        String jsonString = JSONObject.toJSONString(customerTrack);
        System.out.println("+++++++++++++"+jsonString);
        return jsonString;
    }

    @RequestMapping("/customerTrack/update")
    @ResponseBody
    public String customerTrackUpdate(CustomerTrack customerTrack) {
        customerTrackService.updateCustomerTrack(customerTrack);
        return "OK";
    }

    @RequestMapping("/customerTrack/insert")
    @ResponseBody
    public String addCustomerTrack(CustomerTrack customerTrack) {
        customerTrackService.addCustomerTrack(customerTrack);
        return "OK";
    }

    @RequestMapping("/customerTrack/delete")
    @ResponseBody
    public String customerTrackDelete(Long id) {
        customerTrackService.deleteCustomerTrack(id);
        return "OK";
    }

    @RequestMapping("/customerTrack/customerTrack")
    public String customerTrack(){
        return "customerTrack";
    }

}
