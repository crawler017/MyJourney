package cn.myjourney.service.impl;

import cn.myjourney.dao.impl.UserDaoImpl;
import cn.myjourney.dao.userDao;
import cn.myjourney.domain.PageBean;
import cn.myjourney.domain.User;
import cn.myjourney.service.userService;

import java.util.List;
import java.util.Map;

public class userServiceImpl implements userService {
    private userDao dao = new UserDaoImpl();

    @Override
    public User login(User user) {
        return dao.findUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public void add(User user) {
        dao.add(user);
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public void remove(int id) {
        dao.remove(id);
    }

    @Override
    public User findUser(String id) {
        return dao.findUser(id);
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }

    @Override
    public void multiDel(String[] uid) {
        for (String id : uid) {
            dao.remove(Integer.parseInt(id));
        }
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        int totalCount = dao.totalCount(condition);
        int totalPage = totalCount % rows == 0 ? totalCount / rows : totalCount / rows + 1;

        PageBean<User> pb = new PageBean<User>();
        pb.setTotalPage(totalPage);

        if (currentPage <= 0)
            currentPage = 1;
        else if (currentPage >= totalPage)
            currentPage = totalPage;


        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        pb.setTotalCount(totalCount);

        // 计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<User> list = dao.findByPage(start, rows, condition);
        pb.setList(list);

        return pb;
    }
}
