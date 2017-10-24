<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrVO attrVO = (AttrVO) request.getAttribute("attrVO");
%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>資料修改</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<header><%@include file="../header.jsp"%></header>
	<div style="margin: auto; width: 700px; background-color: #E8E8E8; border-radius: 10px; padding: 5px;">
		<h2 style="text-align: center;">資料修改</h2>
		<form method="post" action="Attraction.do">
			<div class="form-group">
				<label for="name" style="margin-left: 10px;">名稱</label> <input
					type="text" class="form-control" id="name" name="name"
					placeholder="請輸入名稱" value="${attrVO.name}">
			</div>
			<div style="margin: 15px;">
				<span> <span>所在地區</span> <select name="county">
						<option>台北市</option>
						<option>新北市</option>
						<option>桃園縣</option>
						<option>新竹市</option>
						<option>台中市</option>
						<option>嘉義縣</option>
						<option>台南市</option>
						<option>高雄市</option>
				</select>
				</span> <span> <span style="margin-left: 10px;">類型</span> <select
					name="type">
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
					style="resize: none; width: 690px;">${attrVO.intro}</textarea>
			</div>
			
			<div>
				<tr>
					<td>
						<div class="checkbox"></div>
						<button type="submit" class="btn btn-default">送出</button>
						<input type="hidden" name="attractionID" value="${attrVO.attractionID}"> 
						<input type="hidden" name="action" value="update">
					</td>					
					
				</tr>
			</div>
		</form>
	</div>
	<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>