<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
</head>
<body>
<header> 
	<%@ include file="../header.jsp" %>
	<!-- <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand " href="#"><img src="image/letter-c.png" width="30" height="30" alt=""></a>	
		</div>
		<div class="navbar-header">
		<a class="navbar-brand " href="#">CHEWME</a>
		</div>
			
		<ul  class="nav navbar-nav" style="margin-left:50px"  >
			<li><a href="#">Home</a></li>
			<li><a href="#">揪人玩</a></li>
			<li><a href="#">創行程</a></li>
			<li><a href="#">創社團</a></li>

		</ul>

		<ul class="nav navbar-nav navbar-right">
			
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-log-in"></span> 登入</a></li>
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-registration-mark"></span> 註冊</a></li>
		</ul>
	</div>
	</nav> <nav class="navbar navbar-expand-lg">
	<div class="container-fluid"></div>

	</nav> --> </header>
	<form action="<c:url value='login.do'/>" method="post" name="loginForm">
	<div>
	<table>
	<tr>
	<td>帳號:</td>
	<td><input type="text" name="userId" value="${sessionScope.user}">&nbsp;<small><font color='red'>${ErrorMsgKey.AccountisEmpty}</font></small></td>
	</tr>
	<tr>
	<td>密碼:</td>
	<td><input type="password" name="pswd" value="${sessionScope.password}">&nbsp;<small><font color='red'>${ErrorMsgKey.PasswordisEmpty}</font></small></td>
	</tr>
	<tr>
	<td><input type="submit" value="登入"></td>
	<td><input type="submit" value="註冊"></td>
	</tr>
	
	</table>
	</div>
	</form>

</body>
</html>