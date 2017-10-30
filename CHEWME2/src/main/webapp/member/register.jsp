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

	<form method="post" action="register.do" name="memform"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>帳號:</td>
				<td><input type="text" name="memberId"
					value="${param.memberId}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.IDEmpty}${MsgMap.errorIDDup}</font></td>
			</tr>
			<tr>
				<td>真實姓名:</td>
				<td><input type="text" name="memName" value="${param.memName}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.NameEmpty}${MsgMap.NameFormatError}</font></td>
			</tr>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" name="memNickN"
					value="${param.memNickN}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.NickNEmpty}</font></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="password" name="memPwd"
					value="${param.memPwd}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PswdEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入生日:</td>
				<td><input type="date" name="memBirthday"
					value="${param.memBirthday}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.BirthdayEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入信箱:</td>
				<td><input type="text" name="memMail" value="${param.memMail}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.MailEmpty}${MsgMap.MailFormatError}</font></td>
			</tr>

			<tr>
				<td>輸入地址:</td>
				<td><input type="text" name="memAddr" value="${param.memAddr}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.AddrEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入電話:</td>
				<td><input type="text" name="memPhone"
					value="${param.memPhone}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PhoneEmpty}</font></td>
			</tr>
			<tr>
				<td>大頭貼:</td>
				<td><input type="file" name="memPhoto"
					value="${param.memPhoto}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PicEmpty}</font></td>
			</tr>
			<tr>
				<td>輸入自我介紹:</td>
				<td><textarea name="memIntr" cols="40" rows="5"></textarea></td>
				<td><font size="-1" color="#FF0000">${MsgMap.IntrEmpty}</font></td>
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