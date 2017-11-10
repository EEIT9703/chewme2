<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member.css">
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header><%@ include file="/header.jsp"%></header>
	<div class="container">
		<div class="row">
			<div class="main">
				<h3>
					LoginMe,or <a
						href="<%=request.getContextPath()%>/member/register.jsp">RegisterMe</a>
				</h3>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a
							href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&redirect_uri=http://localhost:8081/CHEWME2/googlelogin.do&response_type=code&state=/profile&client_id=237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
							<img src="<%=request.getContextPath()%>/image/google_sign_in.png"
							style="width: 350px; height: 70px;" />
						</a>
					</div>
				</div>
				<div class="login-or">
					<hr class="hr-or">
					<span class="span-or">or</span>
				</div>

				<form role="form" action="login.do" method="post" name="loginForm">
					<div class="form-group">
						<label>帳號:</label> <input type="text" class="form-control"
							id="userId" name="userId" value="${sessionScope.user}"><small><Font
							color='red' size="-3">&nbsp;${ErrorMsgKey.AccountisEmpty}</Font></small>
					</div>
					<div class="form-group">
						<a class="pull-right" data-toggle="modal" data-target="#gridSystemModal">忘記密碼?</a>
						<label>密碼:</label> <input type="password" class="form-control"
							id="password" name="pswd" value="${sessionScope.password}"><small><Font
							color='red' size="-3">&nbsp;${ErrorMsgKey.PasswordisEmpty}</Font></small>
					</div>

					<div class="g-recaptcha"
						data-sitekey="6LfFkTYUAAAAAMK1w_K82sMGOy-BWkq-YBYMn5-J"></div>
					<small><Font color='red' size="-3">&nbsp;${ErrorMsgKey.RecaptchaisEmpty}</Font></small>
					<div class="checkbox pull-right">
						<label> <input type="checkbox" name="rememberMe"
							class="recaptcha"
							<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
							value="true"> 記住密碼
						</label>
					</div>

					<div align="center">
						<button type="submit" class="btn btn btn-primary">登入</button>
					</div>
					<div>
						<small><Font color='red' size="-3">&nbsp;${ErrorMsgKey.LoginError}</Font></small>
					</div>
				</form>





				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true" align="center">
					<div class="modal-dialog" align="center">
						<div class="modal-content">
							<form action="forgetPwd.do" method="post">
								<span style="color: red">${requestScope.sendMailMsg}</span> <br>&nbsp;您的帳號：<input
									type="text" name="userId" /><br> <br> &nbsp;您的信箱：<input
									type="text" name="userMail" /><br>
								<span style="color: red">${requestScope.errorMsg}</span><br />
								<div align="center">
									<input type="submit" value="提交" />
								</div>
							</form>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

				<div id="gridSystemModal" class="modal fade" tabindex="-1"
					role="dialog" aria-labelledby="gridModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="gridModalLabel">忘記密碼?</h4>
							</div>
							<form action="forgetPwd.do" method="post">
								<div class="modal-body">
									<div class="row">
									<div align="center">
									<span style="color: red">${requestScope.sendMailMsg}</span>
									</div>
										<div class="col-md-3 col-md-offset-3">
											 <br>&nbsp;您的帳號：<input
												type="text" name="userId" /><br> 
											<br> &nbsp;您的信箱：<input
												type="text" name="userMail" /><br> 
										</div>
										<span style="color: red">${requestScope.errorMsg}</span><br />
									</div>

								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="submit" class="btn btn-primary">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>