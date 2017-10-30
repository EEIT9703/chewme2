<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.activity.model.*"%>

<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="styLesheet" href="../css/bootstrap.min.css">

<!-- <script src="js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

<!-- jQuery UI Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- Font Awesome  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"></link>


</head>

<body>
	<header><%@ include file="../header.jsp"%></header>

	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />

	<div class="container">
		<div class="jumbotron">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h1>Activity</h1>



					<form role="form" enctype="multipart/form-data"
						class="form-horizontal" method="post" action="activityServlet.do"
						name="actForm">
						<div class="from-group">
							<label for="actID">選擇活動</label> <select class="form-control"
								size="1" name="actID" id="actID">
								<c:forEach var="activityVO" items="${actSvc.all}">
									<option value="${activityVO.actID}">${activityVO.act_name}</option>
								</c:forEach>
							</select>

						</div>
						<div class="form-group">
							<label for="act_name">活動名稱</label> 
							<input type="text" class="form-control" name="act_name" id="act_name" value="" />
							<font color="red" size="-1">${error.errorName}</font>
						</div>	
						<div class="form-group">
							<label for="act_groups">成團人數</label> 
							<input type="text" class="form-control" name="act_groups" id="act_groups" value="" />
						</div>			
						<div class="form-group">
							<label for="act_current">參加人數</label> 
							<input type="text" class="form-control" name="act_current" id="act_current" value="" disabled="disabled" />
						</div>
						<div class="form-group">
							<label for="BDate">出發日期</label> 
							<input type="text" class="form-control" name="BDate" id="BDate" value="" />
						</div>
						<div class="form-group">
							<label for="EDate">結束日期</label> 
							<input type="text" class="form-control" name="EDate" id="EDate" value="" />
						</div>
						<div class="from-group">
							<label for="activity_state">活動狀態</label> <select class="form-control" name="activity_state" id="activity_state">
								<option value="0">建構中</option>
								<option value="1">上架</option>
								<option value="3">下架</option>
							</select>
						</div>

						<div class="form-group">
							<label class="btn btn-info" for="upload"> <input id="upload" name="upload" style="display: none;" type="file">
								<i class="fa fa-folder-open-o"></i> 上傳圖片
							</label>
						</div>

						<div class="form-group"></div>
						<button type="button" class="btn btn-lg btn-primary" id="submit">Submit</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		
	</script>

	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- SweetAlert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="../act/js/creatAct.js"></script>
</body>
</html>