<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <title>卡尔迅学驾服务平台</title> -->
<title>学车宝管理平台</title>
<%-- <link rel="icon" href="${contextPath}/static/asstes/images/aa.ico" type="img/x-ico" /> --%>
<link rel="icon" href="${contextPath}/static/asstes/images/avatar.jpg" type="img/x-ico" />

<link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<link href="${contextPath}/static/asstes/css/login.css" rel="stylesheet">

<script src="//cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="${contextPath}/static/asstes/js/my_jquery.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="https://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<style>
.nav_logo {
	max-width: 480px;
	margin-left:0px;
}

</style>
</head>
<body class="login">
<!-- 	<div class="container" id="login-container"> -->
		<!-- <div class="row login_content" id="login_content"> -->
			<%-- <div class="col-lg-8 col-xs-12 text-left">
				<div class="row text-left back">
					<img class="img-responsive nav_logo center-block" src="${contextPath}/static/asstes/images/login.png">
				</div>
			</div> --%>
			<!-- <div class="col-lg-3"></div>
			<div class="col-md-5 col-xs-6 text-right">
				<div class="row">
					4444
				</div> -->
				<div class="mayun_logo"></div>
				<div  class="login_content" >
					<div class="logo_title">
						<span class="mayun" >学驾服务智能管理平台</span>
				</div>
				<div class="mayun_login">
				<form id="login_frm" action="${contextPath}/user/index" method="post" >
				<div class="row">
					<div class="form-group">
						<div id="loginTip"></div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-12 col-lg-offset-0 col-xs-8 col-xs-offset-2">
								<input type="text" class="form-control input-sm frm_group" id="exampleEmail" name="count" placeholder="邮箱">
							</div>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-12 col-lg-offset-0 col-xs-8 col-xs-offset-2">
								<input type="password" class="form-control input-sm frm_group" id="examplePassword" name="password"
									placeholder="密码">
							</div>
						</div>

					</div>
					</div>
					<div class="row">
					<div class="form-group level">
						<div class="row">

							<div class="col-lg-6 col-lg-offset-0 col-xs-4 col-xs-offset-2">
								<input type="code" class="form-control input-sm frm_code" id="exampleInputName3" name="validateCode"
									placeholder="输入验证码">
							</div>
							<div class="col-lg-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">
								<img src="captchaController/kaptcha" id="kaptchaImage" class="checked_img"
									style="margin-bottom: -3px; height: 30px;">
							</div>
							<div class="col-lg-4 col-xs-3">
								<a class="a-style" href="javascript:void(0)" onclick="changeCode()">换一个</a>
							</div>

						</div>
					</div>
					</div>
					<div class="row" style="margin-bottom:10px;">
						<div class="col-lg-6 col-lg-offset-0 col-xs-4 col-xs-offset-2 forget">
							<a class="a-style" id="forget_pwd">忘记密码?</a>
						</div>
						<div class="col-lg-6 col-xs-4 submit">
							<button type="button" class="btn btn-style" id="loginButton">登录</button>
						</div>
					</div>

				</form>
				<form id="foget_frm">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-12 col-lg-offset-0 col-xs-8 col-xs-offset-2">
								<label class="label-style">请输入您的电子邮箱</label>
							</div>
						</div>

					</div>
					<div class="form-group level">
						<div class="row">
							<div class="col-lg-12 col-lg-offset-0 col-xs-8 col-xs-offset-2">
								<input type="email" class="form-control input-sm frm_group" placeholder="邮箱">
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col-lg-6 col-lg-offset-0 col-xs-4 col-xs-offset-2 forget">
							<a type="button" class="a-style" id="back_login">登录</a>
						</div>
						<div class="col-lg-6 col-xs-4 submit">
							<button type="submit" class="btn btn-style">发送</button>
						</div>
					</div>

				</form>
				</div>
			</div>
		<!-- </div>


	</div> -->
	<!-- <div class="footer" id="show_footer">卡尔迅互联网科技  版权所有 隐私权政策</div> -->
	<div class="footer" id="show_footer">版权所有 隐私权政策</div>


	<script>
		$(function() {
			$('#kaptchaImage').click(
					function() {//生成验证码  
						$(this).hide().attr(
								'src',
								'captchaController/kaptcha?'
										+ Math.floor(Math.random() * 100))
								.fadeIn();
						event.cancelBubble = true;
					});
		});

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
											url : "${contextPath}/user/loginCheck",
											type : "POST",
											data : {
												"count" : $("#exampleEmail")
														.val(),
												"password" : $(
														"#examplePassword")
														.val(),
												"validateCode" : $(
														"#exampleInputName3")
														.val()
											},
											success : function(result) {
												if (result) {
													if (!result.success) {
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

		function changeCode() {
			$('#kaptchaImage').hide().attr(
					'src',
					'captchaController/kaptcha?'
							+ Math.floor(Math.random() * 100)).fadeIn();
			event.cancelBubble = true;
		}

		$(function() {
			$("#loginButton")
					.click(
							function() {
								$
										.ajax({
											dataType : "json",
											url : "${contextPath}/user/loginCheck",
											type : "POST",
											data : {
												"count" : $("#exampleEmail")
														.val(),
												"password" : $(
														"#examplePassword")
														.val(),
												"validateCode" : $(
														"#exampleInputName3")
														.val()
											},
											success : function(result) {
												if (result) {
													if (!result.success) {
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
							});
		});

		$().ready(function() {
			$("#login_frm").validate({
				rules : {
					count : {
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
					email : {
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

		// 验证登录表单
		/*  $("#loginButton").bind("click", function() {
			$('#login_frm').submit();
		});  */
		/* $('#login_frm').validate({
			errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : false,
			ignore : "",
			rules : {
				email : {
					required : true,
					email : true
				},
				password : {
					required : true,
					minlength : 6,
					maxlength : 14
				}
			},
			messages : {
				email : {
					required : "请填写邮箱",
					email : "请填写正确的邮箱"
				},
				password : {
					required : "请输入密码",
					minlength : "密码长度至少为6个字符",
					maxlength : "密码长度至多为14个字符"
				}
			},
			highlight : function(e) {
				$(e).closest('label').removeClass('has-info').addClass('has-error');
			},
			success : function(e) {			
				$(e).closest('label').removeClass('has-error');// .addClass('has-info');
				$(e).remove();
			},
			errorPlacement : function(error, element) {
				error.insertAfter(element.parent());
				//error.appendTo('#invalid');
			} *//* , 
											submitHandler : function(form) {
												console.log($('#loginPassword').val());
												$.ajax({
													dataType : "json",
													url : "${contextPath}/sys/user/login",
													type : "post",
													data : {
														email : $('#loginEmail').val(),
														password : $('#loginPassword').val(),
														rememberMe : $("input[name='rememberMe']:checked").val(),
														yzm: $("#use_yzm").val()
													},
													complete : function(xmlRequest) {
														var returninfo = eval("(" + xmlRequest.responseText + ")");
														if (returninfo.result == 1) {
															localStorage["base_id"]=returninfo.base_id;
															document.location.href = "${contextPath}/sys/user/home_new";
														} else if (returninfo.result == -1) {
															$("#loginTip").html("用户名有误或已被禁用");
															$("#loginTip").css('color','red');
														} else if (returninfo.result == -2) {
															$("#loginTip").html("密码错误");
															$("#loginTip").css('color','red');
														}else if(returninfo.result == -3){
															$("#loginTip").html("验证码错误");
															$("#loginTip").css('color','red');
															$('[name=use_yzm]').css('borderColor','red');
														} else {
															$("#loginTip").html("服务器错误");
														}
														changeR();
													}
												});
											} *//* , */
		/* 	invalidHandler : function(form) {
			} 
		});  */
	</script>
</body>
</html>