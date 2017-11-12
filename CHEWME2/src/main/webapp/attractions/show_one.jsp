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
	height: 1100px;
}

.st1 {
	list-style-type: none;
	margin: 20px;
	margin-left: 50px;
}

#tabs-1 {
	height: 900px;
/* 	border:1px solid green; */
}

#tabs-2 {
	height: 700px;
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

#memo {
	resize: none;
	background-color:#EDEDED;
	border: 2px solid #E8E8E8;
	width: 600px;
	height:70px;
	margin-top: 10px;
	margin-left: 5px;
}

#text1 {
	width: 700px;
	height: 500px;
}

.btn.btn-info {
	margin-left: 600px;
}    
#map_canvas{
	height:350px;
	width:500px; 	
	border-radius:5px;
	margin:auto;
}   
html { 
 	height: 100% 
 } 

 body { 
 	height: 100%; 
 	margin: 0 20%; 
 	padding: 0px 
 }    
 #button1{
 	margin:0px;
 	margin-left:570px;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<header><%@include file="../header.jsp"%></header>
	<form method="post" action="Attraction.do">
		<div id="tabs">
		<div id="id1" style="display:none;">${attrVO.attractionID}</div>
			<div style="margin-left: 20px; border-bottom: 4px double green; width: 650px;">
				<h2 id="name1">${attrVO.name}</h2>
			</div>
			<div class="st1">
				<li>地址：${attrVO.address}</li>
				<li>電話：${attrVO.tel}</li>				
				<li>類型：${attrVO.type}</li>
			</div>
			<ul>
				<li><a href="#tabs-1">介紹</a></li>				
				<li><a href="#tabs-3" id="message">留言板</a></li>
			</ul>
			<div id="tabs-1">
				<table>
					<tr>
						<td style="padding: 10px;">
							<h3>簡介：</h3>
							<div style="width: 200px;">${attrVO.intro}</div>
						</td>
						<td style="padding: 20px;"><span><img id="img2"	src="<%=request.getContextPath()%>/getImage.do?id2=${attrVO.attractionID}&type=upimg">
						</span></td>
					</tr>
				</table>
				<div id="map_canvas"></div>	
			</div>
					
			<div id="tabs-3">			
					<h4 style="margin: 0px 0px 10px 10px;">
					<strong>我要留言：</strong>
				</h4>
				</hr>
				<div style="border: 1px solid #E3E3E3; padding:3px;">
					<table>
						<tr>
							<td><img src='data:image/png;base64,${LoginOK.memPhoto}' width=40px height=40px>
							</td>
							<td><textarea id="memo" placeholder="請輸入內容..."></textarea></td>
						</tr>
					</table>
				</div>
				<div>
					<button type="button" class="btn btn-info" id="button1">送出留言</button>
				</div>				
				<div id="text1"></div>	
			</div>		
				<div>
			<input id="address_val" name="address_val"
				style="width: 400px;display:none;" type="text" value="${attrVO.address}" >
			</div>
			<div id="SearchLatLng" style="display:none;"></div>
			<div id="NowLatLng" style="display:none;"></div>	
			<div>
				<tr>
<!-- 					<td> -->
<!-- 						<div class="checkbox"></div> -->
<!-- 						<button type="submit" class="btn btn-default">編輯</button> <input -->
<!-- 						type="hidden" name="attractionID" id="id1" -->
<%-- 						value="${attrVO.attractionID}"> <input type="hidden" --%>
<!-- 						name="action" value="update_one"> -->
<!-- 					</td> -->
					<td><a href="/CHEWME2/attractions/listAll.jsp" class="btn btn-primary" style="color:white;">返回列表</a></td>
				</tr>
			</div>
		</div>
	</form>
<!-- 	<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfX3HNjv2RvHE8gBJg5WDetgOUzjwsEpk&callback=initMap"></script> -->
	<script>	
			$(function() {
				var temp1;
				var j = 0;
				function getTemp1() {
					$.get("/CHEWME2/attractions/temp1.jsp", {}, function(data) {
						//console.log(data);
						temp1 = data;	
					})
				}
				$.when(getTemp1())
				// 當按下"送出留言"發生事件
				$("#button1").click(function() {
					//console.log(id1.value);				
				var val1 = $("#memo").val();                // 取得textarea內輸入的留言
				var anum = document.getElementById("id1").innerHTML;    // 取得當前頁面的景點編號
					if (val1 == "") {
						alert("請勿空白");
					} 
					else {
						// 按下送出留言，底下區塊新增一個div
						$("#text1").append(temp1);
						$(".text_01:last").attr("id", "mytext"+j);
						$("#mytext"+j).text(val1);					
					}
				//alert(mnum);
				// 取得 1.使用者輸入的留言內容(val1)  2.當前頁面的景點編號(anum)   傳送到後端servlet寫進資料庫
				$.post("/CHEWME2/ArticleServlet?action=sendmessage",{"contents":val1, "attractionID":anum}, function(data){
					
					})			
					j++;
				$("#memo").val("");
				});
				
				// 點擊留言版的標籤發生事件
				$("#message").one('click', function(){				
					// 取得當前景點ID
					var num = document.getElementById("id1").innerHTML;
					//console.log(num);
	  				$.getJSON("/CHEWME2/ArticleServlet?action=getmessage",{'message':num},function(data){ 	
						$.each(data, function(i, datas){
							console.log(datas.contents);
							$("#text1").append(temp1);
							$(".text_01:last").attr("id", "mytext_01"+i);
							$("#mytext_01"+i).text(datas.contents);	
						})
	  				})			 				
				})					
			})					
	</script>	
	
	<!-- 	地圖 -->
	<script src="<%=request.getContextPath()%>/attractions/js/map.js"></script>  
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfX3HNjv2RvHE8gBJg5WDetgOUzjwsEpk&callback=initMap"></script>
	
</body>
</html>