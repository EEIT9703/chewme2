<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊會員</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<c:if test="${not empty errorMsgs }">
		<font>請修正以下錯誤:
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li>${message}</li>
				</c:forEach>
			</ul>
		</font>
	</c:if>
	<form method="post" action="register.do" name="memform" enctype="multipart/form-data" >
		<table>
			<tr>
				<td>帳號:</td>
				<td><input type="text" name="memberId"
					value="${param.memberId}"></td>
			</tr>
			<tr>
				<td>真實姓名:</td>
				<td><input type="text" name="memName"
					value="${param.memName}""></td>
			</tr>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" name="memNickN"
					value="${param.memNickN}"></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="password" name="memPwd"
					value="${param.memPwd}"></td>
			</tr>

			<tr>
				<td>輸入生日:</td>
				<td><input type="date" name="memBirthday"
					value="${param.memBirthday}"></td>
			</tr>
			
			<tr>
			<td>輸入信箱:</td>
			<td><input type="text" name="memMail"value="${param.memMail}"></td>
			</tr>
			
			<tr>
			<td>輸入地址:</td>
			<td><input type="text" name="memAddr"
				value="${param.memAddr}"></td>
			</tr>

			<tr>
			<td>輸入電話:</td>
			<td><input type="text" name="memPhone"
				value="${param.memPhone}"></td>
			</tr>
			<tr>
			<td>大頭貼:</td>
			<td><input type="file" name="memPhoto"
				value="${param.memPhoto}"></td>
			</tr>
			<tr>
			<td>輸入自我介紹:</td>
			<td><textarea name="memIntr"
					value="${param.memIntr}" cols="40" rows="5"></textarea></td>
			</tr>
			<tr>
				<td><input type="hidden" name="action" value="insert">
					<input type="submit" value="送出"></td>
				<td><input type="reset" value="清除"></td>
			</tr>

		</table>
	</form>

	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>



</body>
</html>