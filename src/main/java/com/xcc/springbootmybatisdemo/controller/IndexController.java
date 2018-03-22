package com.xcc.springbootmybatisdemo.controller;

import com.xcc.springbootmybatisdemo.model.ApiResult;
import com.xcc.springbootmybatisdemo.model.LoginResultCode;
import com.xcc.springbootmybatisdemo.model.ResultCode;
import com.xcc.springbootmybatisdemo.model.User;
import com.xcc.springbootmybatisdemo.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/index")
    public String goIndex(){
        return "index";
    }

    @PostMapping(value = "doLogin",produces = {"application/json;charset=UTF-8"})
    @ResponseBody
    public ApiResult<User> doLogin(HttpServletRequest request,@RequestParam(value = "userName", required = true) String userName, @RequestParam(value = "password", required = true) String password){

            User u = userService.loginByUserNameAndPwd(userName,password);
            if(u!=null){
                //登入成功
                request.getSession().setAttribute("loginUser", u);
                System.out.println(u.getUserName());
                return new ApiResult<>(LoginResultCode.SUCCESS,"登入成功",u);

            }else{
                //登入失败
                return new ApiResult<>(LoginResultCode.LOGIN_ERROR,"登入失败",null);
            }

    }
}
