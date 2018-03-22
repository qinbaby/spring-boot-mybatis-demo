<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>krmsoft</title>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
    <%--<link rel="stylesheet" href="css/style.css">--%>

    <style>
        body {
            background:url(login_bg_0.jpg) #f8f6e9;
        }
        .mycenter{
            margin-top: 100px;
            margin-left: auto;
            margin-right: auto;
            height: 350px;
            width:500px;
            padding: 5%;
            padding-left: 5%;
            padding-right: 5%;
        }
        .mycenter mysign{
            width: 440px;
        }
        .mycenter input,checkbox,button{
            margin-top:2%;
            margin-left: 10%;
            margin-right: 10%;
        }
        .mycheckbox{
            margin-top:10px;
            margin-left: 40px;
            margin-bottom: 10px;
            height: 10px;
        }
    </style>
</head>
<body>
    <form id="login_frm" action="" method="post">
        <div class="mycenter">
            <div class="mysign">
                <div class="col-lg-11 text-center text-info">
                    <h2>请登录</h2>
                </div>

                <div id="loginTip"></div>
                <div class="col-lg-10">
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入账户名" required autofocus/>
                </div>
                <div class="col-lg-10"></div>

                <div class="col-lg-10">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码" required autofocus/>
                </div>
                <div class="col-lg-10"></div>
                <div class="col-lg-10 mycheckbox checkbox">
                    <input type="checkbox" class="col-lg-1">记住密码</input>
                </div>
                <div class="col-lg-10"></div>
                <div class="col-lg-10">
                    <button type="button" id="loginButton" class="btn btn-success col-lg-12">登录</button>
                </div>
            </div>
        </div>
    </form>
    <div class="footer" id="show_footer">版权所有 隐私权政策</div>
    <script>

        // 按回车键触发登录事件
        $(document)
            .keydown(
                function(event) {
                    var key = window.event ? event.keyCode
                        : event.which;
                    if (key == 13) {
                        $
                            .ajax({
                                dataType : "json",
                                url : "${contextPath}/doLogin",
                                type : "POST",
                                data : {
                                    "userName" : $("#userName")
                                        .val(),
                                    "password" : $(
                                        "#password")
                                        .val()
                                },
                                success : function(result) {
                                    if (result) {
                                        if (!result.status) {
                                            $("#loginTip").html(
                                                result.error);
                                            $("#loginTip").css(
                                                'color', 'red');
                                            return;
                                        }
                                        if (result.data) {
                                            window.location.href = "${contextPath}/user/index";
                                            return;
                                        } else {
                                            $("#loginTip").html(
                                                result.error);
                                            $("#loginTip").css(
                                                'color', 'red');
                                            return;
                                        }
                                    }
                                }
                            });
                    }
                });

        window.onbeforeunload = function() {
            //关闭窗口时自动退出
            if (event.clientX > 360 && event.clientY < 0 || event.altKey) {
                alert(parent.document.location);
            }
        };

        $(function() {
            $("#loginButton")
                .click(
                    function() {
                        $
                            .ajax({
                                dataType : "json",
                                url : "${contextPath}/doLogin",
                                type : "POST",
                                data : {
                                    "userName" : $("#userName")
                                        .val(),
                                    "password" : $(
                                        "#password")
                                        .val()
                                },
                                success : function(result) {
                                    if (result) {
                                        if (!result.status) {
                                            $("#loginTip").html(
                                                result.info);
                                            $("#loginTip").css(
                                                'color', 'red');
                                            return;
                                        }
                                        if (result.data) {
                                            window.location.href = "${contextPath}/user/index";
                                            return;
                                        } else {
                                            $("#loginTip").html(
                                                result.info);
                                            $("#loginTip").css(
                                                'color', 'red');
                                            return;
                                        }
                                    }
                                }
                            });
                    });
        });

        $().ready(function() {
            $("#login_frm").validate({
                rules : {
                    userName : {
                        required : true,
                        email : true
                    },
                    password : {
                        required : true,
                        minlength : 2,
                        maxlength : 14
                    }
                },
                messages : {
                    userName : {
                        required : "请填写邮箱",
                        email : "请填写正确的邮箱"
                    },
                    password : {
                        required : "请输入密码",
                        minlength : "密码长度至少为6个字符",
                        maxlength : "密码长度至多为14个字符"
                    }
                }
            });
        });
    </script>

</body>
</html>
