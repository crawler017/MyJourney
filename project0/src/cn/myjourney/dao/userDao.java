package cn.myjourney.dao;

import cn.myjourney.domain.User;

import java.util.List;
import java.util.Map;

public interface userDao {

    User findUserByUsernameAndPassword(String username, String password);

    void add(User user);

    List<User> findAll();

    void remove(int id);

    User findUser(String id);

    void update(User user);

    int totalCount(Map<String, String[]> condition);

    /**
     * 分页查询每页记录
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<User> findByPage(int start, int rows, Map<String, String[]> condition);
}
