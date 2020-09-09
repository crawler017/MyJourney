//package com.myjourney.conf;
//
//import com.mchange.v2.c3p0.ComboPooledDataSource;
//import org.apache.commons.dbutils.QueryRunner;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Scope;
//
//import javax.sql.DataSource;
//import java.beans.PropertyVetoException;
//
//public class JdbcConfiguration {
//
//    @Value("${jdbc.driver}")
//    private String driver;
//    @Value("${jdbc.url}")
//    private String url;
//    @Value("${jdbc.user}")
//    private String user;
//    @Value("${jdbc.password}")
//    private String password;
//
//    @Bean(name="runner")
//    @Scope("prototype")
//    public QueryRunner createQueryRunner(DataSource datasource) {
//        return new QueryRunner(datasource);
//    }
//
//    @Bean(name = "datasource")
//    public DataSource createDatasource() {
//        ComboPooledDataSource ds = new ComboPooledDataSource();
//        try {
//            ds.setDriverClass(driver);
//            ds.setJdbcUrl(url);
//            ds.setUser(user);
//            ds.setPassword(password);
//
//            return ds;
//        } catch (PropertyVetoException e) {
//            throw new RuntimeException(e);
//        }
//    }
//}
