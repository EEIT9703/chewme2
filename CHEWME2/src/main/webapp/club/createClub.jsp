<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/mybootstrap.css">
</head>
<body>


	<header><%@ include file="../header.jsp"%></header>

	<div class="container" style="width: 50%">

		<form name="createClub" action="createClub.do?action=create_club"
			method="POST">
			<div class="form-group">
				<label for="exampleInputEmail1">社團名稱</label> <input type="text"
					class="form-control" name="clubName" id="clubname" placeholder="名稱">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">城市</label> <input type="text"
					class="form-control" id="city"
					placeholder="location">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">住址</label> <input type="text"
					class="form-control" id="address"
					placeholder="address">
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">外部連結網址</label> <input type="url"
					class="form-control" id="url"
					placeholder="外部連結網址">
			</div>
			<div class="form-group">
				<textarea class="form-control" rows="5" id="brief"
				<label for="exampleInputPassword1">簡述</label>
					style="resize: none;" placeholder="本文會顯示在社團搜尋結果中"></textarea>

			</div>
			<div class="form-group">
				<label for="exampleInputFile">照片</label> <input accept="image/*" type="file"
					id="uploadImage" name="uploadImage">
				<p class="help-block">請輸入你的社團首頁圖片</p>
				<img id="img" src="" class="img-responsive" >
			</div>
			<div class="checkbox">
				<label> <input type="checkbox"> 請同意合約內容
				</label>
			</div>
			<button type="submit" class="btn btn-default">送出</button>
		</form>

	</div>


	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="js/upload.js"></script>
</body>
</html>