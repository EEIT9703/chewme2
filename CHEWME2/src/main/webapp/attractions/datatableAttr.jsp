<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrService attr = new AttrService();
	List<AttrVO> list = attr.getAll();
	pageContext.setAttribute("list1", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataTable列表</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
</head>
<body>
	<table id="table1" class="table table-bordered table-striped table-hover">
		<thead>			
			<tr>
				<th>名稱</th>
				<th>縣市</th>
				<th>類型</th>
				<th>地址</th>
				<th>連絡電話</th>	
			</tr>
		</thead>
		<tbody>
		
		</tbody>			
	</table>
	
	
	
	
	<script src="js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
	<script>
		$(function(){
			$("#table1").DataTable({
				"ajax": "DataServlet",				
				"columns": [
					{"data": "attractionID"},
					{"data": "name"}
				]
			})			
		})
	</script>
</body>
</html>