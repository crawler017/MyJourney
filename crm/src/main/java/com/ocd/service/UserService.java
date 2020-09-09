package com.ocd.service;

import com.ocd.pojo.User;

public interface UserService {
    void saveUser(User user);
    User findUser(String name, String pwd);
}