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
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
</head>
<body>
	<header><%@ include file="/header.jsp"%></header>

	<form action="login.do" method="post" name="loginForm">
		<div>
			<table>
				<tr>
					<td>帳號:</td>
					<td><input type="text" name="userId"
						value="${sessionScope.user}">&nbsp;<small><font
							color='red'>${ErrorMsgKey.AccountisEmpty}</font></small></td>
				</tr>
				<tr>
					<td>密碼:</td>
					<td><input type="password" name="pswd"
						value="${sessionScope.password}">&nbsp;<small><font
							color='red'>${ErrorMsgKey.PasswordisEmpty}</font></small></td>
				</tr>

				<tr height='10'>
					<td align="CENTER" colspan='2'>&nbsp;<Font color='red'
						size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></td>
				</tr>

			</table>
		</div>
		<div class="g-recaptcha"
			data-sitekey="6LfFkTYUAAAAAMK1w_K82sMGOy-BWkq-YBYMn5-J"></div>${ErrorMsgKey.RecaptchaisEmpty}
		<br>
		<div>
			<table>
				<tr>
					<td width="180"><input type="checkbox" name="rememberMe"
						<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
						value="true"><small>記住密碼</small></td>

				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="登入">
					</td>
					<td colspan="2" align="center"><input type="button" value="註冊"
						onclick="location.href='register.jsp'"></td>
				</tr>
			</table>
		</div>
		<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark">
		<input type="hidden" name="googleId" value="" id="googleId">
		
		<input type="hidden" name="memName" value="" id="memName">
		</div>
	</form>
	<script src='https://www.google.com/recaptcha/api.js'></script>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script>
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
// 			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
// 			console.log('Full Name: ' + profile.getName());
// 			console.log('Given Name: ' + profile.getGivenName());
// 			console.log('Family Name: ' + profile.getFamilyName());
// 			console.log("Image URL: " + profile.getImageUrl());
// 			console.log("Email: " + profile.getEmail());
$.post("LoginServlet.java", { googleId: profile.getId()} );
			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
// 			console.log("ID Token: " + id_token);
		};
	</script>
	<button onclick="myFunction()"></button>
	<script>
		function myFunction() {
			gapi.auth2.getAuthInstance().disconnect();
			location.reload();
		}
	</script>
		<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</body>
</html>