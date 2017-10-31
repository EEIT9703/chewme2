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
<title>行程表</title>
</head>
<style>
</style>
<body>

<header><%@include file="../header.jsp"%></header>

<h1>行程表(ID=${actID})</h1>
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
	$('#vt1').verticalTimeline();
</script>
</body>
</html>