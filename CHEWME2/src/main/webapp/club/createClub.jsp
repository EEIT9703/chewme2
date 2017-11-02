﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/igs/imgareaselect-default.css" />
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.min.js"></script> --%>

</head>
<body>
	<header><%@ include file="../header.jsp"%></header>



	<div class="container" style="width: 50%">

		<form name="createClub" action="createClub.do?action=create_club"
			method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleInputEmail1">社團名稱</label> <input type="text"
					class="form-control" name="clubName" id="clubname" placeholder="名稱">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">城市</label> <input type="text"
					class="form-control" id="city" name="city"
					placeholder="location">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">住址</label> <input type="text"
					class="form-control" id="address" name="address"
					placeholder="address">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">外部連結網址</label> <input type="url"
					class="form-control" id="url" name="url"
					placeholder="ref-url">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">聯絡信箱</label> <input type="email"
					class="form-control" id="email" name="email"
					placeholder="email-address">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">簡述</label>
				<textarea class="form-control" rows="5" id="brief" name="brief"
					style="resize: none;" placeholder="本文會顯示在社團搜尋結果中"></textarea>

			</div>
			<div class="form-group">
				<label for="exampleInputFile">照片</label> <input accept="image/*" type="file"
					id="uploadImage" name="uploadImage">
				<p class="help-block">請輸入你的社團首頁圖片</p>
<!-- 				<img id="img" src="" class="img-responsive" > -->
				<img id="img" src="">
			</div>
			<canvas id="myCanvas" style="border:1px solid #000000;"></canvas>

			
			<div class="checkbox">
				<label> <input type="checkbox" name="checkbox"> 請同意合約內容
				</label>
			</div>
			<button type="submit" class="btn btn-default">送出</button>
		</form>

	</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.imgareaselect.pack.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/club/js/createClub.js"></script>

</body>
</html>