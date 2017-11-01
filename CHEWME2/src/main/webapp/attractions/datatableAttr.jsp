<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataTable列表</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.css" />
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
	
	<script src="../js/jquery-1.12.3.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/u/bs/jq-2.2.3,dt-1.10.12/datatables.min.js"></script>
	<script>
		$(function(){
// 			$.getJSON("/CHEWME2/DataServlet", {}, function (data){
// 				console.log(data.length);
// 				console.log(data[0].address);
// 				$("#table1>tbody").empty();
// 				$.each(data, function(i, product){
// 					var cell1 = $("<td></td>").text(product.attractionID);
//                     var cell2 = $("<td></td>").text(product.name);
//                     var cell3 = $("<td></td>").text(product.address);
//                     var cell4 = $("<td></td>").text(product.county);
//                     var cell5 = $("<td></td>").text(product.tel);
                    
//                     var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4, cell5]);

//                     $('#table1>tbody').append(row);
// 				})
				
// 			});		

				$('#table1').DataTable({
               "ajax": "/CHEWME2/DataServlet",
               "columns": [
                   { "data": "attractionID" },
                   { "data": "name" },
                   { "data": "address" },
                   { "data": "county" }
               ]            
            });
		})
	</script>
</body>
</html>