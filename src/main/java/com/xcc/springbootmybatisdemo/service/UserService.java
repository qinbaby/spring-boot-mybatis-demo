package com.xcc.springbootmybatisdemo.service;

import com.xcc.springbootmybatisdemo.model.User;

import java.util.List;

public interface UserService {

    int addUser(User user);

    List<User> findAllUser(int pageNum, int pageSize);

    User selectByPrimaryKey(int id);

    User loginByUserNameAndPwd(String userName,String password);
}