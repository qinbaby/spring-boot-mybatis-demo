package com.xcc.springbootmybatisdemo.mapper;

import com.xcc.springbootmybatisdemo.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //这个方式我自己加的
    List<User> selectAllUser();

    User loginByUserNameAndPwd(@Param("userName") String userName, @Param("password") String password);

}