<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.activity.model.*"%>


<%
// 	ActivityVO activityVO = (ActivityVO) request.getAttribute("activityVO");

//  	ActService act = new ActService();
// 	List<ActivityVO> list = act.getAll();
// 	pageContext.setAttribute("list", list); 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="styLesheet" href="../css/bootstrap.min.css">

<!-- <script src="js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

<!-- jQuery UI Datepicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>

<body>
	<header><%@ include file="../header.jsp"%></header>
	
	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />

	<div class="jumbotron">
		<div class="container">
			<h1>Activity</h1>
			<form class="form-horizontal" method="post" action="activityServlet.do">
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="actID">選擇活動</label>
					<div class="col-sm-10">
						<select class="form-control input-sm" size="1" name="a"
							id="actID">
							<c:forEach var="activityVO" items="${actSvc.all}">
								<option value="${activityVO.actID}">${activityVO.act_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="from-group">
					<label for="actname" class="col-sm-2 control-lable">活動名稱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="b" id="act_name" value=" ">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="act_groups">成團人數</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="c"
						id="act_groups" value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="BDate">出發日期</label>
					<div class="col-sm-10">
						<input type="text" name="d" class="form-control input-sm"
							id="BDate" value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="BDate">結束日期</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="e"
							id="EDate"  value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="activity_state">活動狀態</label>
					<div class="col-sm-10">
						<select class="form-control input-sm" id="activity_state" name="f">
							<option value="0">建構中</option>
							<option value="1">上架</option>
							<option value="3">下架</option>
						</select>
					</div>
				</div>
				<div class="from-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-lg btn-primary" id="submit">送出 &raquo;</button>
						<button type="reset"  class="btn btn-lg btn-primary">清除
							&raquo;</button>
					</div>
				</div>
			</form>
		</div>
	</div>


<script>
		
 $(function() {

	 //結束
	 $( "#EDate" ).datepicker({
		 changeMonth: true,
		 changeYear: true});

	 //出發
    $( "#BDate" ).datepicker({
      changeMonth: true,
      changeYear: true
    });
	 
    $("#activity_state").selectmenu();

	 
	//觸發actID
	$("#actID").change(function(){
		var data;
 		var actID = $(this).val();
		console.log(actID);

		$.get('/CHEWME2/activityServlet.do?action=getOne_For_Update',{'actID':actID},function(data){
			actID = JSON.parse(data);
			console.log(data);

			$('#act_name').val(actID.act_name);
			$('#act_groups').val(actID.act_groups);
			$('#BDate').val(actID.BDate);
			$('#EDate').val(actID.EDate);
			$('#activity_state').val(actID.activity_state); 
			
			});
	
	});
	
	$('#submit').click(function(){
		$.get('/CHEWME2/activityServlet.do?action=Updata',{},function(){
			alert("3345678");
			
		});
	});
	
  });
	</script>
</body>
</html>