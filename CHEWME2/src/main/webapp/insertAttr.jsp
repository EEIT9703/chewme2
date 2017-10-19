<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrVO attrVO = (AttrVO) request.getAttribute("attrVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增商家/景點/住宿</title>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div style="margin: auto; width: 700px; background-color: #E8E8E8; border-radius: 10px; padding: 5px;">
		<h2 style="text-align: center;">新增商家/景點/住宿</h2>
		<form role="form" method="post" name="form1" action="Attraction.do">
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
					style="resize: none; width: 690px;" value="${attrVO.intro}"></textarea>
			</div>
			<div class="form-group">
				<label for="inputfile" style="margin-left: 10px;">上傳圖片</label> 
				<input type="file" id="inputfile" name="photo" value="upload_photo">
				<p class="help-block"></p>
			</div>
			<div>
				<tr>
					<td>
						<div class="checkbox"></div>
						<button type="submit" class="btn btn-default">送出</button> <input
						type="hidden" name="action" value="insert">
					</td>
					<td>
					 <a href="ListAll.jsp" class="btn btn-primary">查詢</a>					
					</td>					
				</tr>
			</div>
		</form>
	</div>
</body>
</html>