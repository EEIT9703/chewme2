<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrVO attrVO = (AttrVO) request.getAttribute("attrVO");
%>
<!DOCTYPE html>
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
	margin-left: 50px;
}

#tabs-1 {
	height: 450px;
}

#tabs-2 {
	height: 550px;
}

#img2 {
	height: 288px;
	width: 384px;
	border-radius: 5px;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">


</head>
<body>
	<header><%@ include file="../header.jsp"%></header>
	<div>
		<form method="post" action="Attraction.do">
			<div id="tabs">
				<div
					style="margin-left: 20px; border-bottom: 4px double green; width: 650px;">
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
					<table>
						<tr>
							<td style="padding: 10px;">
								<h3>簡介：</h3>
								<div style="width: 200px;">${attrVO.intro}</div>
							</td>
							<td style="padding: 20px;"><span><img id="img2"
									src="${PageContext.servletContext.contextPath}/getImage.do?id2=${attrVO.attractionID}&type=upimg">
							</span></td>
						</tr>
					</table>
				</div>
				<div id="tabs-2"></div>
				<div></div>
				<div style="border: 1px solid blue;">

					<tr>
						<td>
							<div class="checkbox"></div>
							<button type="submit" class="btn btn-default">編輯</button> <input
							type="hidden" name="attractionID" value="${attrVO.attractionID}">
							<input type="hidden" name="action" value="update_one">
						</td>
						<td><a href="ListAll.jsp" class="btn btn-primary">返回</a></td>

					</tr>

				</div>
			</div>
		</form>
	</div>
	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</body>
</html>