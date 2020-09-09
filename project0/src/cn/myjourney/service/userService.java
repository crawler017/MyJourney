package cn.myjourney.service;

import cn.myjourney.domain.PageBean;
import cn.myjourney.domain.User;

import java.util.List;
import java.util.Map;

/**
 * 用户管理业务接口
 */
public interface userService {

    User login(User user);

    void add(User user);

    List<User> findAll();

    User findUser(String id);

    void remove (int id);

    void update(User user);

    void multiDel(String[] uid);

    PageBean<User> findUserByPage(String currentPage, String rows, Map<String, String[]> condition);
}
