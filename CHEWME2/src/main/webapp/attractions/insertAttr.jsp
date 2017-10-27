<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrVO attrVO = (AttrVO) request.getAttribute("attrVO");
%>
<!DOCTYPE html>
<html>
<head>
<style>
input[type = "file"]{
	display:none;
}
.aaa {
	position: absolute;
	right: -10px;
	border: 1px solid #fff;
	background: #111111;
	color: #fff;
	border-radius: 100px;
	font-size: 12px;
	font-weight: 600;
	text-align: center;
	z-index: 15;
	width: 20px;
	height: 15px;
}

.nav-shopping-cart {
	position: relative;
	display: inline-block;
}

.custom-file-upload {
    border: 1px solid #ccc;
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商家/景點/住宿</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
</head>
<body>
	<div>
		<header><%@include file="../header.jsp"%></header>
	</div>
	<div
		style="margin: auto; width: 700px; background-color: #E8E8E8; border-radius: 10px; padding: 5px;">
		<h2 style="text-align: center;">新增商家/景點/住宿</h2>

		<form method="post" name="form1" action="Attraction.do"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="name" style="margin-left: 10px;">名稱</label> <input
					type="text" class="form-control" id="name" name="name"
					placeholder="請輸入名稱" value="${attrVO.name}" autofocus>
			</div>
			<div style="margin: 15px;">
				<span> <span>所在地區</span> <select name="county"
					class="selectpicker">
						<option>台北市</option>
						<option>新北市</option>
						<option>桃園縣</option>
						<option>新竹市</option>
						<option>台中市</option>
						<option>嘉義縣</option>
						<option>台南市</option>
						<option>高雄市</option>
						<option>宜蘭縣</option>
						<option>花蓮縣</option>
						<option>台東縣</option>
				</select>
				</span> <span> <span style="margin-left: 10px;">類型</span> <select
					name="type" class="selectpicker">
						<option>餐廳</option>
						<option>景點</option>
						<option>住宿</option>

				</select>
				</span>

			</div>

			<div class="form-group">
				<label for="address" style="margin-left: 10px;">地址</label> <input
					type="text" class="form-control" id="address" name="address"
					placeholder="請輸入地址" value="${attrVO.address}">
			</div>
			<div class="form-group">
				<label for="tel" style="margin-left: 10px;">電話</label> <input
					type="text" class="form-control" id="tel" name="tel"
					placeholder="請輸入電話" value="${attrVO.tel}">
			</div>
			<div class="form-group">
				<div>
					<label for="introduction" style="margin-left: 10px;">簡介</label>
				</div>
				<textarea id="introduction" name="intro" cols="40" rows="5"
					style="resize: none; width: 690px;" value="${attrVO.intro}"></textarea>
			</div>
			<div class="form-group">			
				<label for="inputfile" style="margin-left: 10px;">上傳圖片</label>				
				<input type="file" id="inputfile" name="photo" value="upload_photo" class="	glyphicon glyphicon-folder-open">
				<p class="help-block"></p>
			</div>
			<div>
				<tr>
					<td>
						<div class="checkbox"></div>
						<button type="submit" class="btn btn-default">送出</button> <input
						type="hidden" name="action" value="insert">
					</td>
					<td><a href="listAll.jsp" class="btn btn-primary">返回列表</a></td>
				</tr>
			</div>
		</form>
	</div>
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</body>
</html>