package com.ocd.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.ocd.pojo.User;

@Repository
@Mapper
public interface UserMapper {
    void saveUser(User user);

    User findUser(@Param("name")String name,@Param("pwd")String pwd);
}