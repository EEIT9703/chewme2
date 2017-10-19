<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrVO attrVO = (AttrVO) request.getAttribute("attrVO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#tabs {
	margin: auto;
	width: 700px;
	height: 700px;
}

.st1 {
	list-style-type: none;
	margin: 20px;
}

#tabs-1 {
	border: 1px solid red;
	height: 450px;
}

#tabs-2 {
	border: 1px solid red;
	height: 550px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<form method="post" action="Attraction.do">
		<div id="tabs">
			<div style="margin-left: 20px;">
				<h2>${attrVO.name}</h2>
			</div>
			<div class="st1">
				<li>地址：${attrVO.address}</li>
				<li>電話：${attrVO.tel}</li>
				<li>類型：${attrVO.type}</li>
			</div>
			<ul>
				<li><a href="#tabs-1">介紹</a></li>
				<li><a href="#tabs-2">分享文</a></li>

			</ul>
			<div id="tabs-1">
				<p>${attrVO.intro}</p>
			</div>
			<div id="tabs-2"></div>
			<div>
				<tr>
					<td>
						<div class="checkbox"></div>
						<button type="submit" class="btn btn-default">編輯</button>
						<input type="hidden" name="attractionID" value="${attrVO.attractionID}"> 
						<input type="hidden" name="action" value="update_one">
					</td>
					<td><a href="ListAll.jsp" class="btn btn-primary">返回</a>
					</td>
				</tr>
			</div>
		</div>
	</form>
</body>
</html>