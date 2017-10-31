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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html { 
 	height: 100% 
 } 

 body { 
 	height: 100%; 
 	margin: 0 20%; 
 	padding: 0px 
 } 

#map_canvas {
	height:500px;
	width:500px; 
	
}
</style>


<!-- <script src="../js/jquery-1.12.3.min.js" type="text/javascript"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>
	  
	<div style="height: 150;">
		<div>
			地址：<input id="address_val" name="address_val"
				style="width: 400px;" type="text" value="台北市文山區新光路二段30號">
		</div>
		<div id="SearchLatLng">【您輸入的地址位置】</div>
		<div id="NowLatLng">【移動標記點後的位置】</div>
	</div>
	<div id="map_canvas"></div>
	

	<script>
//	$(document).ready(function() {
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
		

		function GetAddressMarker() {//重新定位地圖位置與標記點位置
			
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
		
	
			
//			console.log("3");
			//綁定地址輸入框的keyup事件以即時重新定位
// 			$("#address_val").bind("keyup", function() {
				
// 				$("#NowLatLng").html("【移動標記點後的位置】");
// 			});
//		});
	</script>
	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfX3HNjv2RvHE8gBJg5WDetgOUzjwsEpk&callback=initMap"></script>
</body>
</html>