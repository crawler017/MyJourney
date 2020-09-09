package com.ocd.service.impl;

import com.ocd.mapper.UserMapper;
import com.ocd.pojo.User;
import com.ocd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public void saveUser(User user) {
        // TODO Auto-generated method stub
        userMapper.saveUser(user);
    }
    @Override
    public User findUser(String name, String pwd) {
        // TODO Auto-generated method stub
        return userMapper.findUser(name, pwd);
    }
}