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
</head>
<body>
<header><%@ include file="../header.jsp"%></header>
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
				<tr>
					<TD width="180" align="right"><input type="checkbox"
						name="rememberMe"
						<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if> value="true"></TD>
					<TD width="180" colspan='2' align="left"><small>記住密碼</small></TD>

				</tr>
				<TR height='10'>
					<TD align="CENTER" colspan='2'>&nbsp;<Font color='red'
						size="-1">${ErrorMsgKey.LoginError}&nbsp;</Font></TD>
				</TR>
				<TR>
					<TD colspan="2" align="center"><input type="submit" value="登入">
					</TD>
					<TD colspan="2" align="center"><input type="button" value="註冊" onclick="location.href='register.jsp'">
					</TD>

				</TR>

			</table>
		</div>
	</form>

</body>
</html>