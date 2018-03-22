package com.xcc.springbootmybatisdemo.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.xcc.springbootmybatisdemo.model.User;
import com.xcc.springbootmybatisdemo.service.UserService;
import netscape.javascript.JSObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/add", produces = {"application/json;charset=UTF-8"})
    public int addUser(User user){
        return userService.addUser(user);
    }

    @ResponseBody
    @RequestMapping(value = "/all/{pageNum}/{pageSize}", produces = {"application/json;charset=UTF-8"})
    public String findAllUser(@PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize){
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("rows", userService.findAllUser(pageNum,pageSize));
        jsonObject.put("total", 3);
        return jsonObject.toJSONString();

        //return userService.findAllUser(pageNum,pageSize);
    }

    @GetMapping("/getOne/{id}")
    @ResponseBody
    public User findOne(@PathVariable("id") int id){
        return userService.selectByPrimaryKey(id);
    }

    @GetMapping(value = "index")
    public String index(){
        return "user/index";
    }

}
