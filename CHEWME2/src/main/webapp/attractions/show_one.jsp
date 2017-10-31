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

/*  地圖 */
 /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
 #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */

 #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      
      
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>商家列表</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- <script src="../js/bootstrap.min.js"></script> -->
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
	<form method="post" action="Attraction.do">
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
				<li><a href="#tabs-2" id="message">留言板</a></li>
				<li><a href="#map">地圖</a></li>
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
			</div>
			<div id="tabs-2">
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
			
			
			
<!-- 			放地圖的區塊 -->
			<div id="map">
			<div id="floating-panel">
			
     			<input id="address" type="textbox" value="Sydney, NSW">
      			<input id="submit" type="button" value="Geocode">
    		</div>
			</div>					
			<div>
				<tr>
					<td>
						<div class="checkbox"></div>
						<button type="submit" class="btn btn-default">編輯</button> <input
						type="hidden" name="attractionID" id="id1"
						value="${attrVO.attractionID}"> <input type="hidden"
						name="action" value="update_one">
					</td>
					<td><a href="listAll.jsp" class="btn btn-primary">返回列表</a></td>
				</tr>
			</div>
		</div>
	</form>
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
			$("#message").click(function(){				
				// 取得當前景點ID
				var num = document.getElementById("id1").innerHTML;
				//console.log(num);
  				$.getJSON("/CHEWME2/ArticleServlet?action=getmessage",{'message':num},function(data){
  					//var i = data.length;
  					for(i = 0; i < data.length; i ++){     
  						var val2 = data[i].contents;      // 取得陣列內的contents值，放入div
  						$("#text1").append("<div style='width:670px;height:80px;border-radius:5px;border:1px solid blue;margin-left:8px;padding:10px;'><strong>" + val2	+ "</strong></div>");
  					}  					
  					//console.log(val2);  					
//   					$("#text1").text(data.contents);	
//   					var div1 = $("#text1");
//   					$.each(data, function(i, val){
//   						var mes = $("<div></div>").text(data.contents);
//   						div1.append(mes);
//   					}) 			  				
  				})			 				
			})			
		})		
	</script>
	
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfX3HNjv2RvHE8gBJg5WDetgOUzjwsEpk&callback=initMap">
    </script>
</body>
</html>