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
</head>
<body>
	<header><%@ include file="/header.jsp"%></header>
	<div class="container">
		<div class="row">
			<div class="main">
				<h3>
					LoginMe,or <a href="<%=request.getContextPath()%>/member/register.jsp">RegisterMe</a>
				</h3>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a
							href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&redirect_uri=http://localhost:8080/CHEWME2/googlelogin.do&response_type=code&state=/profile&client_id=237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
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
						<a class="pull-right"
							href="<%=request.getContextPath()%>/member/forgotPwd.jsp">忘記密碼?</a>
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
					<div><small><Font color='red' size="-3">&nbsp;${ErrorMsgKey.LoginError}</Font></small></div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>