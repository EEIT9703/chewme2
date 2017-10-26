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
	height: 1000px;
	margin-top:50px;
}

.st1 {
	list-style-type: none;
	margin: 20px;
	margin-left: 50px;
}

#tabs-1 {
	height: 700px;
}

#tabs-2 {
	height: 700px;
}

#img1 {
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

#memo {
	resize: none;
	width:600px;
	height:70px;
	border-radius:10px;
	border:3px solid blue;
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="../js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<header><%@include file="../header.jsp"%></header>
	<div id="tabs">
		<div style="margin-left: 20px; border-bottom: 4px double green; width: 650px;">
			<h2>${attrVO.name}</h2>
		</div>
		<div class="st1">
			<li>地址：${attrVO.address}</li>
			<li>電話：${attrVO.tel}</li>
		</div>
		<ul>
			<li><a href="#tabs-1">介紹</a></li>
			<li><a href="#tabs-2">留言板</a></li>
		</ul>
		<div id="tabs-1">
			<table>
				<tr>
					<td style="padding: 10px;">
						<h3>簡介：</h3>

						<div style="width: 200px;">${attrVO.intro}</div>
					</td>
					<td style="padding: 20px;"><span> <img id="img1"
							src="<%=request.getContextPath()%>/getImage.do?id=${attrVO.name}&type=uploadimg">
					</span></td>
				</tr>
			</table>
		</div>
		<div id="tabs-2">
		
			
			<textarea id="memo"></textarea>
			
			<input type="button" id="button1" value="送出">
			
		</div>
		<div>
			<a href="insertAttr.jsp" class="btn btn-default">返回</a>

		</div>

	</div>
	<script>
	$(function(){
		$("#button1").click(function(){						
					
			$("textarea").html("123");
			var val1 = $("#memo").val();		
		
			
			$("#tabs-2").append("<div style='width:600px;height:70px;border-radius:10px;border:3px solid blue;margin:5px;'>" + val1  +"</div>");
			
			if(val1 == ""){
				alert("請勿空白");
				
			}
			
	
			
			
		});
	})
	
	
	
	
	</script>
</body>
</html>