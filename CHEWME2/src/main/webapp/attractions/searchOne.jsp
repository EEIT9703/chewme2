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
	border-radius: 3px 20px 20px 20px;
	border: 2px solid blue;
	width: 600px;
	margin-top: 10px;
	margin-left: 5px;
}

#text1 {
	border: 2px solid yellow;
	width: 650px;
	height: 500px;
}

.btn.btn-info {
	margin-left: 600px;
}    
#map_canvas{
	height:200px;
	width:200px; 	
}   
html { 
 	height: 100% 
 } 

 body { 
 	height: 100%; 
 	margin: 0 20%; 
 	padding: 0px 
 }    
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>搜尋結果</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- <script src="../js/bootstrap.min.js"></script> -->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <script src="../js/jquery-1.12.3.min.js" type="text/javascript"></script> -->
<script>
	$(function() {
		$("#tabs").tabs();
	});
</script>
</head>
<body>
	<header><%@include file="../header.jsp"%></header>
	<div id="tabs">
		<div id="id1" style="display:none">${attrVO.attractionID}</div>
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
				<li><a href="#tabs-2">地圖</a></li>
				<li><a href="#tabs-3" id="message">留言板</a></li>
			</ul>
			<div id="tabs-1">
				<table>
					<tr>
						<td style="padding: 10px;">
							<h3>簡介：</h3>
							<div style="width: 200px;">${attrVO.intro}</div>
						</td>
						<td style="padding: 20px;"><span><img id="img2"
								src="<%=request.getContextPath()%>/getImage.do?id2=${attrVO.attractionID}&type=upimg">
						</span></td>
					</tr>
				</table>
				<div id="map_canvas"></div>	
			</div>
			<div id="tabs-2">
				
			
			</div>			
			
<!-- 			放地圖的區塊 -->
			<div id="tabs-3">			
					<h4 style="margin: 10px 0px 10px 20px;">
					<strong>我要留言：</strong>
				</h4>
				</hr>
				<div style="border: 1px solid black; padding: 3px;">
					<table>
						<tr>
							<td><img src="img/portrait.png" width="40" height="40">
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
			地址：<input id="address_val" name="address_val"
				style="width: 400px;" type="text" value="${attrVO.address}">
			</div>
			<div id="SearchLatLng">【您輸入的地址位置】</div>
			<div id="NowLatLng">【移動標記點後的位置】</div>
			</div>
			
		<script>	
			$(function() {
				// 當按下"送出留言"發生事件
				$("#button1").click(function() {
					//console.log(id1.value);
					
				var val1 = $("#memo").val();                // 取得textarea內輸入的留言
				var anum = document.getElementById("id1").innerHTML;    // 取得當前頁面的景點標號
					if (val1 == "") {
						alert("請勿空白");
					} else {
						// 按下送出留言，底下區塊新增一個div
						$("#text1").append("<div style='width:670px;height:80px;border-radius:5px;border:1px solid blue;margin-left:8px;padding:10px;'><strong>" + val1	+ "</strong></div>");
					}	
				
				$("#memo").val("");
				//alert(mnum);
				// 取得 1.使用者輸入的留言內容  2.當前頁面的景點編號   傳送到後端servlet寫進資料庫
				$.post("/CHEWME2/ArticleServlet?action=sendmessage",{"contents":val1, "attractionID":anum}, function(data){
					
					})			
				});
				
				// 點擊留言版的標籤發生事件
				$("#message").one('click', function(){				
					// 取得當前景點ID
					var num = document.getElementById("id1").innerHTML;
					//console.log(num);
	  				$.getJSON("/CHEWME2/ArticleServlet?action=getmessage",{'message':num},function(data){
	  					//var i = data.length;
	  					for(i = 0; i < data.length; i ++){     
	  						var val2 = data[i].contents;      // 取得陣列內的contents值，放入div
	  						$("#text1").append("<div style='width:670px;height:80px;border-radius:5px;border:1px solid blue;margin-left:8px;padding:10px;'><strong>" + val2	+ "</strong></div>");
	  					}  									  				
	  				})			 				
				})	
				
			})	
				
	// 地圖開始			
		var map;
		var marker;
		
		function initMap() {
			console.log("1");
			//初始化地圖時的定位經緯度設定
			var latlng = new google.maps.LatLng(23.973875, 120.982024); //台灣緯度Latitude、經度Longitude：23.973875,120.982024
			//初始化地圖options設定
			var mapOptions = {
				zoom : 14,
				center : latlng,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			//初始化地圖
			map = new google.maps.Map(document.getElementById("map_canvas"),
					mapOptions);
			//加入標記點
			marker = new google.maps.Marker({
				draggable : true,
				position : latlng,
				title : "台灣 Taiwan",
				map : map
			});
			//增加標記點的mouseup事件
			google.maps.event.addListener(marker, 'mouseup',
					function() {
						LatLng = marker.getPosition();
						$("#NowLatLng").html(
								"【移動標記點後的位置】緯度：" + LatLng.lat() + "經度："
										+ LatLng.lng());
					});
			GetAddressMarker();
		}
		

		function GetAddressMarker() {    //重新定位地圖位置與標記點位置
			
			console.log("2");
			address = $("#address_val").val();
			console.log(address);
			geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					console.log(results[0].geometry.location);
					LatLng = results[0].geometry.location;
					map.setCenter(LatLng); //將地圖中心定位到查詢結果

					marker.setPosition(LatLng); //將標記點定位到查詢結果
					marker.setTitle(address); //重新設定標記點的title
					$("#SearchLatLng").html(
							"【您輸入的地址位置】緯度：" + LatLng.lat() + "經度："
									+ LatLng.lng());
				}
			});
		}
		
		// 地圖結束
		
		
		
		
		
		
					
				
	</script>
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfX3HNjv2RvHE8gBJg5WDetgOUzjwsEpk&callback=initMap"></script>
</body>
</html>