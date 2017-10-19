<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrService attr = new AttrService();
	List<AttrVO> lis = attr.getAll();
	pageContext.setAttribute("list1", lis);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#listtable {
	margin: auto;
	width: 950px;
}
tr{
text-align: center;
}
#th1{
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>列表</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div id="listtable">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th id="th1">編號</th>
					<th id="th1">名稱</th>
					<th id="th1">縣市</th>
					<th id="th1">類型</th>
					<th id="th1">地址</th>
					<th id="th1">聯絡電話</th>					
					<th colspan="2" style="text-align: center;">管理</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="attrVo" items="${list1}">
					<tr>
						<td>${attrVo.attractionID}</td>
						<td>${attrVo.name}</td>
						<td>${attrVo.county}</td>
						<td>${attrVo.type}</td>
						<td>${attrVo.address}</td>
						<td>${attrVo.tel}</td>
						

						<td>
							<form method="post" action="Attraction.do">
								<button type="submit" class="btn btn-danger">
									<span class="glyphicon glyphicon-remove"></span>
								</button>								
								<input type="hidden" name="attractionID"
									value="${attrVo.attractionID}"> <input type="hidden"
									name="action" value="delete">
							</form>
						</td>
						<td>	
							<form method="post" action="Attraction.do">
								<button class="btn btn-success">
									<span class="glyphicon glyphicon-info-sign"></span>
								</button>
								<input type="hidden" name="attractionID" value="${attrVo.attractionID}"> 
								<input type="hidden" name="action" value="one_info">
							</form>
						</td>											
					</tr>					
				</c:forEach>
			</tbody>
		</table>
		<a href="InsertAttr.jsp" class="btn btn-primary">返回</a>
	</div>
	<script src="js/jquery-1.12.3.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script>
		$(function() {
			$(".btn.btn-danger").click(function(){
				alert("是否刪除?");
			});
		
		})
	</script>
</body>
</html>