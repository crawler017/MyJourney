package com.myjourney.utils;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * 连接工具类，从数据源获取一个连接，并且实现和线程绑定
 */

public class ConnectionUtils {

    private ThreadLocal<Connection> t1 = new ThreadLocal<Connection>();
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public Connection getThreadConnection() {
        try {
            Connection conn = t1.get();
            if (conn == null) {
                conn = dataSource.getConnection();
                t1.set(conn);
            }
            return conn;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    void removeConnection() {
        t1.remove();
    }
}
