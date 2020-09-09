package com.ocd.controller;


import com.ocd.pojo.User;
import com.ocd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

//    @RequestMapping("/golog")
//    public String golog() {
//        return "login";
//    }
//    注册模块停用
//    @RequestMapping("/goreg")
//    public String goreg() {
//        return "register";
//    }
//    @RequestMapping("/register")
//    public String register(User user) {
//        userService.saveUser(user);
//        return "redirect:/customer/list";
//    }
    @RequestMapping("/login")
    public String login(HttpSession session, String name, String pwd) {
//            if (StringUtils.isEmpty(name) && StringUtils.isEmpty(pwd)){
//            return "redirect:/";
//        }
        User user=userService.findUser(name, pwd);
        if(user!=null) {
            session.setAttribute("user",user);
            return "redirect:/customer/list";
        }else {

            return "redirect:/";
        }
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        try {
            session.removeAttribute("user");
        }catch (Exception e){
        }
        try {
            session.removeAttribute("warn");

        }catch (Exception e){
        }
        return "redirect:/";
    }

}