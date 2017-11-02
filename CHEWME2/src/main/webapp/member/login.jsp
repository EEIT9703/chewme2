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
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
	<header><%@ include file="/header.jsp"%></header>
<!-- 	<form action="google.do" id="google" method="post"> -->
<!-- 		<div class="g-signin2" data-onsuccess="onSignIn" id="myP"  -->
<!-- 			onclick="document.getElementById('google').submit();"></div> -->
<!-- 		<input type="hidden" name="gId" id="gId"> <input type="hidden" -->
<!-- 			name="gName" id="gName"> <input type="hidden" name="gMail" -->
<!-- 			id="gMail"> -->
<!-- 	</form> -->
 <div>
			<a href="https://accounts.google.com/o/oauth2/auth?
					scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&
					redirect_uri=http://localhost:8080/CHEWME2/googlelogin.do&
					response_type=code&
					state=/profile&
					client_id=237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
				<img src="<%=request.getContextPath()%>/image/google_sign_in.png" 
					style="width: 350px; height: 100px;padding-top: 50px;padding-left: 20px;"/>
			</a>
	<form action="login.do" method="post" name="loginForm">
		<div>
			<table>
				<tr>
					<td>帳號:</td>
					<td><input type="text" name="userId" id="userId"
						value="${sessionScope.user}">&nbsp;<small><font
							color='red'>${ErrorMsgKey.AccountisEmpty}</font></small></td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td><input type="password" name="pswd"
						value="${sessionScope.password}">&nbsp;<small><font
							color='red'>${ErrorMsgKey.PasswordisEmpty}</font></small></td>
				</tr>

			</table>
		</div>
		<small><font color='red'>${ErrorMsgKey.RecaptchaisEmpty}</font></small>
		<div class="g-recaptcha"
			data-sitekey="6LfFkTYUAAAAAMK1w_K82sMGOy-BWkq-YBYMn5-J"></div>
		<div>
			<table>
				<tr>
					<td width="180" align="right"><input type="checkbox"
						name="rememberMe"
						<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
						value="true"></td>
					<td width="180" colspan='2' align="left"><small>記住密碼</small></td>

				</tr>
				<tr height='10'>
					<td align="CENTER" colspan='2'>&nbsp;<Font color='red'
						size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登入">
					</td>
					<td colspan="2" align="center"><input type="button" value="註冊"
						onclick="location.href='register.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>