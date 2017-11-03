<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員編輯</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../css/igs/imgareaselect-default.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body>
	<header>
		<%@ include file="/header.jsp"%>
	</header>

	<form method="post" action="memEditor.do" name="memform"
		enctype="multipart/form-data">
		<input type="hidden" name="memId" value="${LoginOK.memId}"> <input
			type="hidden" name="memberId" value="${LoginOK.memberId}">
		<table>
			<tr>
				<td>帳號:</td>
				<td><input type="text" name="memName"
					value="${LoginOK.memberId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>真實姓名:</td>
				<td><input type="text" name="memName"
					value="${LoginOK.memName}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.NameEmpty}${MsgMap.NameFormatError}</font></td>
			</tr>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" name="memNickN"
					value="${LoginOK.memNickN}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.NickNEmpty}</font></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="password" name="memPwd"
					value="${LoginOK.memPwd}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PswdEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入生日:</td>
				<td><input type="date" name="memBirthday"
					value="${LoginOK.memBirthday}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.BirthdayEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入信箱:</td>
				<td><input type="text" name="memMail"
					value="${LoginOK.memMail}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.MailEmpty}${MsgMap.MailFormatError}</font></td>
			</tr>

			<tr>
				<td>輸入地址:</td>
				<td><input type="text" name="memAddr"
					value="${LoginOK.memAddr}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.AddrEmpty}</font></td>
			</tr>

			<tr>
				<td>輸入電話:</td>
				<td><input type="text" name="memPhone"
					value="${LoginOK.memPhone}"></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PhonerEmpty}</font></td>
			</tr>
			<tr>
				<td>大頭貼:</td>
				<td><input type="file" name="memPhoto"
					value="${LoginOK.memPhoto}"></td>
				<td><img src="data:image/png;base64,'${loginOK.memPhoto}+'"
					width=100px height=100px></td>
				<td><font size="-1" color="#FF0000">${MsgMap.PicEmpty}</font></td>
			</tr>
			<tr>
				<td>輸入自我介紹:</td>
				<td><textarea name="memIntr" cols="40" rows="5">${LoginOK.memIntr}</textarea></td>
				<td><font size="-1" color="#FF0000">${MsgMap.IntrEmpty}</font></td>
			</tr>
			<tr>
				<td><input type="hidden" name="action" value="update">
					<input type="submit" value="送出"></td>
				<td><input type="reset" value="清除"></td>
			</tr>

		</table>
		<div class="form-group">
			<label for="exampleInputFile">照片</label> <input accept="image/*"
				type="file" id="uploadImage" name="uploadImage">
			<p class="help-block">請輸入你的社團首頁圖片</p>
			<!-- 				<img id="img" src="" class="img-responsive" > -->
			<img id="img" src="">
		</div>
		<canvas id="myCanvas" style="border: 1px solid #000000;"></canvas>
	</form>

	<%-- 	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script> --%>
	<%-- 	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script> --%>
	<%-- 	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> --%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.imgareaselect.pack.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/club/js/createClub.js"></script>




</body>
</html>