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
		<form name="createClub" action="createClub.do?action=create_club" method="POST">
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span> <input
					type="text" class="form-control" placeholder="社團名稱"
					aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span> <input
					type="text" class="form-control" placeholder="地點"
					aria-describedby="basic-addon1">
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span> <input
					type="text" class="form-control" placeholder="地址"
					aria-describedby="basic-addon1">
			</div>

			<div class="form-group">
				<label for="comment">簡述</label>
				<textarea class="form-control" rows="5" id="brief"
					style="resize: none;"></textarea>
			</div>
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">@</span> <input
					accept="image/*" class="form-control" placeholder="社團照片"
					aria-describedby="basic-addon1" type="file" id="uploadImage" 
					name="uploadImage">
				<img id="img" src="">
			</div>
			<button class="btn btn-default" type="submit">送出</button>
		</form>
		
	</div>


	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="js/upload.js"></script>
</body>
</html>