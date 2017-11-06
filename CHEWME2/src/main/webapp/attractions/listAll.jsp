<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>
<%
	AttrService attr = new AttrService();
	ArrayList<AttrVO> lis = attr.getAll();
	pageContext.setAttribute("list1", lis);
%>
<!DOCTYPE html>
<html>
<head>
<style>
#listtable {
	margin: auto;
	width:1100px;
}
tr{
text-align: center;
}
#th1{
text-align: center;
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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>列表</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body>
<header><%@include file="../header.jsp"%></header>
<div class="container">
	<div class="row">		
    	<div id="custom-search-input">
        	<div class="input-group col-md-12">
        	<form method="get" action="SearchServlet">
        	<table>
        	<tr>
        		<td>
            		<input type="text" class="search-query form-control" placeholder="搜尋" id="tags" name="tags" autofocus/> 
            	</td>
            	<td>               	
<!--                 	<span class="input-group-btn"> -->
                		<button class="btn btn-info" type="submit" id="button1">
                			<span class=" glyphicon glyphicon-search"></span>
                		</button>
<!--                 	</span>                	 -->
                	<input type="hidden" name="action" value="search">
            	</td>   
            	 	
            </tr>    
            </table>
            </form>
            <div style="margin-left:10px;color:red;" id="errorarea">${error.searcherror}</div>    	
           </div>
       </div>
	</div>
</div>
	<div id="listtable">
		<table class="table table-bordered" id="table1">	
			<thead>		
				<tr>
					<th id="th1" style="display:none;">編號</th>
					<th id="th1">名稱</th>
					<th id="th1">縣市</th>
					<th id="th1">類型</th>
					<th id="th1">地址</th>
					<th id="th1">聯絡電話</th>					
					<th colspan="2" style="text-align: center;">詳細內容</th>					
				</tr>			
			</thead>	
			<tbody>
				<c:forEach var="attrVo" items="${list1}">
					<tr>
						<td style="display:none;">${attrVo.attractionID}</td>
						<td>${attrVo.name}</td>
						<td>${attrVo.county}</td>
						<td>${attrVo.type}</td>
						<td>${attrVo.address}</td>
						<td>${attrVo.tel}</td>
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
		
		<a href="insertAttr.jsp" class="btn btn-primary">我要新增</a>
	</div>	
	
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			var datas = [];
		    // 呼叫servlet的getALL方法，回傳全部資料
			$.getJSON("/CHEWME2/DataServlet", {}, function(data){
				for(i = 0; i < data.length; i ++){			
					datas.push(data[i].name);   // 取得全部資料的name屬性，放入datas陣列			
				}		
				console.log(datas);
				console.log(data);
			})    
		    
		    $("#tags").autocomplete({
		      source: datas
		    });
		    
		  	$("#button1").click(function(){
		  		var i = $("#tags").val();
		  		console.log(i);  		
		  	})
			
			$(".btn.btn-danger").click(function(){
				alert("是否刪除?");
			});
			
		$("#table1>tbody>tr:nth-child(even)").css("background-color","#f1f7fe");		
		
		})
	</script>
	
	
</body>
</html>