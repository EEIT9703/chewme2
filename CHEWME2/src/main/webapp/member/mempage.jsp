<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<form action="memEditor.do">
	<table>
	<tr>
	<td>會員編號:${LoginOK.memId }</td></tr>
			<tr>
				<td>會員帳號:${LoginOK.memberId }</td>
			</tr>
			<tr>
				<td>會員姓名:${LoginOK.memName }</td>
			</tr>
			<tr>
				<td>會員暱稱:${LoginOK.memNickN }</td>
			</tr>
			<tr>
				<td>會員密碼:${LoginOK.memPwd }</td>
			</tr>
			<tr>
				<td>會員生日:${LoginOK.memBirthday }</td>
			</tr>
			<tr>
				<td>會員信箱:${LoginOK.memMail }</td>
			</tr>
			<tr>
				<td>會員地址:${LoginOK.memAddr }</td>
			</tr>
			<tr>
				<td>會員電話:${LoginOK.memPhone }</td>
			</tr>
			<tr>
				<td>自我介紹:${LoginOK.memIntr }</td>
			</tr>
		</table>
	<input type="hidden" name="memId" value="${LoginOK.memId }">
	<input type="button" value="修改" onclick="location.href='<%=request.getContextPath()%>/member/memeditor.jsp'">
	</form>
</body>
</html>