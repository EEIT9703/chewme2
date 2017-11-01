<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
		String SactID = (String) request.getAttribute("actID");
		Integer actID = Integer.parseInt(SactID);
		
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.min.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.min.css">
<link rel="stylesheet" href="/CHEWME2/css/vertical-timeline.css">
<script src="/CHEWME2/js/jquery-3.2.1.min.js"></script>
<script src="/CHEWME2/js/jquery-ui.min.js"></script>
<script src="/CHEWME2/js/bootstrap.min.js"></script>
<script src="/CHEWME2/js/vertical-timeline.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>行程表  ${actID}</title>
</head>
<style>
</style>
<body>

<header><%@include file="../header.jsp"%></header>

<h1 id="name"></h1>
<div id="vt1">
    <div data-vtdate="用 p 呈現">
        <h3>測試景點</h3>
        <p>名稱 </p>
        <p>類型</p>
        <p>簡介</p>
    </div>
    <div data-vtdate="用 table 呈現">
        <table border="1" >
				<tbody>
					<tr><td class="detailItem">名　稱</td><td id=detailName></td><td rowspan=4 id=detailPhoto style="height:220px;padding:10px;"></td></tr>	
					<tr><td class="detailItem">類　型</td><td id=detailType></td></tr>
					<tr><td class="detailItem">電　話</td><td id=detailTel></td></tr>
					<tr><td class="detailItem">地　址</td><td id=detailAdd></td></tr>
					<tr><td class="detailItem">簡　介</td><td colspan=2 id=detailIntro></td></tr>		
				</tbody>
			</table>
    </div>
</div>

<script>
	var actID=${actID};
	$('#vt1').verticalTimeline();

window.onload = function(){
	
	$.get("/CHEWME2/Schedule.do?mission=getActName",{'actID':actID},function(actName){
		console.log(actName);
		$('#name').html(actName+"的行程明細");
	});
	
 	$.getJSON("/CHEWME2/Schedule.do?mission=getTrip",{'actID':actID},showTimeLine);
	//這裡有問題
	function showTimeLine(array){
		var dataArray = array;
		console.log(dataArray[0].name);
/*		
		for(var i=0;i<dataArray;i++){
			var period = text(dataArray[i].period.subString(0,4));
			var name =  $("<p id='name'></p>").text(dataArray[i].name);
			var tel =  $("<p id='tel'></p>").text(dataArray[i].tel);
			var addr =  $("<p id='addr'></p>").text(dataArray[i].address);
			var intro =  $("<p id='intro'></p>").text(dataArray[i].intro);
//			var photo = $("<p></p>").html("<img src='data:image/png;base64,"+dataArray[i].img64+"'height=200px>")
//			photo.attr("id","photo");
			var point = $("<div id='period'></div>").append([name,tel,add,intro]);
			point.attr("data-vtdate",period);
			$("#vt1").append(point);
*/			
			$("#detailName").text(dataArray[0].name);
			console.log(dataArray[0].name);
			$("#detailType").text("TYPE");
			$("#detailTel").text(dataArray[0].tel);
			$("#detailAdd").text(dataArray[0].address);
			console.log(dataArray[0].address);
			$("#detailIntro").text(dataArray[0].intro);
			
//		}
	}
}
	

</script>
</body>
</html>