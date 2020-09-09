package com.ocd.controller;


import com.alibaba.fastjson.JSONObject;
import com.ocd.constant.CustomerConstant;
import com.ocd.pojo.BaseDict;
import com.ocd.pojo.Customer;
import com.ocd.service.CustomerService;
import com.ocd.service.SystemService;
import com.ocd.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


/**
 * 客户管理
 * <p>Title: CustomerController</p>
 * <p>Description: </p>
 *
 * @version 1.0
 */
@Controller
public class CustomerController {

    // 依赖注入
    @Autowired
    private CustomerService customerService;
    @Autowired
    private SystemService systemService;

    // 客户列表
    @RequestMapping(value = "/customer/list")
    public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
                       String custName, String custSource, String custIndustry, String custLevel, Model model) {

        Page<Customer> customers = customerService.findCustomerList(page, rows, custName, custSource, custIndustry,
                custLevel);
        model.addAttribute("page", customers);
        //客户来源
        List<BaseDict> fromType = systemService.findBaseDictListByType(CustomerConstant.FROM_TYPE.getValue());
        //客户所属行业
        List<BaseDict> industryType = systemService.findBaseDictListByType(CustomerConstant.INDUSTRY_TYPE.getValue());
        //客户级别
        List<BaseDict> levelType = systemService.findBaseDictListByType(CustomerConstant.LEVEL_TYPE.getValue());
        model.addAttribute("fromType", fromType);
        model.addAttribute("industryType", industryType);
        model.addAttribute("levelType", levelType);
        //参数回显
        model.addAttribute("custName", custName);
        model.addAttribute("custSource", custSource);
        model.addAttribute("custIndustry", custIndustry);
        model.addAttribute("custLevel", custLevel);
        return "customer";
    }

    @RequestMapping(value = "/customer/edit",produces="text/plain;charset=UTF-8")
    @ResponseBody
    public String getCustomerById(Long id,Model model) {
        Customer customer = customerService.getCustomerById(id);
        String jsonString = JSONObject.toJSONString(customer);
        System.out.println("+++++++++++++"+jsonString);
        return jsonString;
    }

    @RequestMapping("/customer/update")
    @ResponseBody
    public String customerUpdate(Customer customer) {
        customerService.updateCustomer(customer);
        return "OK";
    }

    @RequestMapping("/customer/insert")
    @ResponseBody
    public String addCustomer(Customer customer) {
        customerService.addCustomer(customer);
        return "OK";
    }

    @RequestMapping("/customer/delete")
    @ResponseBody
    public String customerDelete(Long id) {
        customerService.deleteCustomer(id);
        return "OK";
    }

    @RequestMapping("/customer/customerTrack")
    public String customerTrack(){
        return "customerTrack";
    }

}
