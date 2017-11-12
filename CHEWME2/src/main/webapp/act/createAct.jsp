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

<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<!-- Summernote  -->
<link href="<%=request.getContextPath()%>/css/summernote.css" rel="stylesheet">
<!-- Font Awesome  -->
<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<!-- jQuery UI Datepicker -->
<link href="<%=request.getContextPath()%>/css/jquery-ui.css" rel="stylesheet">
</head>
<style>

body{
    height: 100%;
 	background-repeat: no-repeat;
 	background:url(https://i.ytimg.com/vi/4kfXjatgeEU/maxresdefault.jpg);
 	font-family: 'Oxygen', sans-serif;
	background-size: cover;
}

.jumbotron{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 400px;
    padding: 10px 40px;
	background:#009edf;
	color: #FFF;
    text-shadow: none;
	-webkit-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
    -moz-box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);
    box-shadow: 0px 3px 5px 0px rgba(0,0,0,0.31);

}

.form-group{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}
.input-group {
    -webkit-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    -moz-box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
    box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.21)!important;
}

label{
	margin-bottom: 15px;
}

button {
    border: 1px solid #ccc;
    margin-top: 28px;
    padding: 6px 12px;
    color: #666;
    text-shadow: 0 1px #fff;
    cursor: pointer;
    -moz-border-radius: 3px 3px;
    -webkit-border-radius: 3px 3px;
    border-radius: 3px 3px;
    -moz-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    -webkit-box-shadow: 0 1px #fff inset, 0 1px #ddd;
    box-shadow: 0 1px #fff inset, 0 1px #ddd;
    background: #f5f5f5;
    background: -moz-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #eeeeee));
    background: -webkit-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -o-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: -ms-linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    background: linear-gradient(top, #f5f5f5 0%, #eeeeee 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5f5f5', endColorstr='#eeeeee', GradientType=0);
}
.login-button{
	margin-top: 5px;
}
</style>


<body>
	<header><%@ include file="../header.jsp"%></header>

	<jsp:useBean id="actSvc" scope="page"
		class="com.iii.eeit9703.activity.model.ActService" />

	<div class="container">
		<div class="jumbotron">
			<div class="row clearfix">
				<div class="col-md-12 column">

					<h1>揪新團</h1>
					<p hidden>${LoginOK_MS.ownActivityVOList}</p>
					<c:if test="${ !empty createAct_clubId }">

						<p >社團活動:${createAct_clubId}</p>
					</c:if>



					<form role="form" enctype="multipart/form-data" class="form-horizontal" method="post" action="<%=request.getContextPath() %>/act/actServlet" name="actForm">
						<div class="from-group">
							<label for="actID">選擇活動</label> <select class="form-control" size="1" name="actID" id="actID">
								<option value="0">----請選擇活動----</option>
								<c:forEach var="activityVO"
									items="${LoginOK_MS.ownActivityVOList}">
									<option value="${activityVO.actID}">${activityVO.act_name}</option>
								</c:forEach>
							</select>

						</div>
						<div class="form-group">
							<label for="act_name">活動名稱</label>
							 <div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-flag" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="act_name" id="act_name" value="" placeholder="請輸入活動名稱"/> 
							<font color="red" size="-1"></font>							
						</div>					
						</div>					
						</div>
						
						
						<div class="form-group">
							<label for="act_groups">成團人數</label>
							<div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>							
							<input type="text" class="form-control" name="act_groups" id="act_groups" value="" placeholder="請輸入成團人數"/> 
							<font color="red" size="-1"></font>
						</div>
						</div>
						</div>
						
						<div class="form-group">
							<label for="act_current">參與人數</label>
							<div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span> 
							<input type="text" class="form-control" name="act_current" id="act_current" value="" disabled="disabled" />
						</div>
						</div>
						</div>
						
						<div class="form-group">
							<label for="BDate">出發日期</label>
							<div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="BDate" id="BDate" value="" placeholder="請選擇出發日期"/> 
							<font color="red" size="-1"></font>
						</div>
						</div>
						</div>
						
						<div class="form-group">					
							<label for="EDate">結束日期</label>
							<div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span> 
							<input type="text" class="form-control" name="EDate" id="EDate" value="" placeholder="請選擇結束日期"/> 
								<font color="red" size="-1"></font>
						</div>
						</div>
						</div>
						
						<div class="form-group">
							<label for="act_price">價格</label>
							<div class="cols-sm-10"> 
							<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span> 
							<input type="text" class="form-control" name="act_price" id="act_price" value="" placeholder="請輸入價格"/> 
							<font color="red" size="-1"></font>
						</div>
						</div>
						</div>


						<div class="from-group">
							<label for="activity_state">活動狀態</label> <select
								class="form-control" name="activity_state" id="activity_state">
								<option value="0">建構中</option>
								<option value="1">上架</option>
								<option value="3">下架</option>
							</select>
						</div>

						<div class="form-group"></div>
						<button type="submit" class="btn btn-lg btn-primary login-button" id="submit">Next</button>
						<input type="hidden" name="action" value="Next" style="text-align:center ">
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		
	</script>


	<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.js"></script>
	
	<!-- SweetAlert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="<%=request.getContextPath()%>/act/js/creatAct.js"></script>
</body>
</html>