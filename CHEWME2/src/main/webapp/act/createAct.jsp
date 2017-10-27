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
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Custom styles for this template -->
<link href="../css/navbar-fixed-top.css" rel="stylesheet">

<!-- jQuery UI Datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- SweetAlert  -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="../js/jquery.file-preview.js"></script>



</head>
<style>
input[type="file"] {
	display: none;
}

.custom-file-upload {
	border: 1px solid #ccc;
	display: inline-block;
	padding: 6px 12px;
	cursor: pointer;
}
</style>

<body>
	<header><%@ include file="../header.jsp"%></header>

	<jsp:useBean id="actSvc" scope="page"
		class="com.iii.eeit9703.activity.model.ActService" />

	<div class="jumbotron">
		<div class="container">
			<h1>Activity</h1>
			<form class="form-horizontal" method="post"
				action="activityServlet.do" name="actForm">
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="actID">選擇活動</label>
					<div class="col-sm-10">
						<select class="form-control input-sm" size="1" name="actID"
							id="actID">
							<c:forEach var="activityVO" items="${actSvc.all}">
								<option value="${activityVO.actID}">${activityVO.act_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="act_name">活動名稱</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="act_name"
							id="act_name" value=" ">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="act_groups">成團人數</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="act_groups"
							id="act_groups" value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="act_current">參加人數</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm"
							name="act_current" id="act_current" value="" disabled="disabled">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="BDate">出發日期</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="BDate"
							id="BDate" value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="EDate">結束日期</label>
					<div class="col-sm-10">
						<input type="text" class="form-control input-sm" name="EDate"
							id="EDate" value="">
					</div>
				</div>
				<div class="from-group">
					<label class="col-sm-2 control-lable" for="activity_state">活動狀態</label>
					<div class="col-sm-10">
						<select class="form-control input-sm" name="activity_state"
							id="activity_state">
							<option value="0">建構中</option>
							<option value="1">上架</option>
							<option value="3">下架</option>
						</select>
					</div>
				</div>
				<div class="form1">
					<label for="file-upload"
						class="col-sm-2 control-lable custom-file-upload glyphicon glyphicon-folder-open btn btn-success fileinput-button">
						上傳圖片 </label>
					<div class="col-sm-4">
						<input id="file-upload" type="file" name="upload[]" class="upload" multiple/>
						<div>
							<div class="img"></div>
							<div class="img"></div>
							<div class="img"></div>
							<div class="img"></div>
							<div class="img"></div>
						</div>
					</div>
				</div>


				<div class="from-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="button" class="btn btn-lg btn-primary" id="submit">送出
							&raquo;</button>
						<button type="reset" class="btn btn-lg btn-primary">清除
							&raquo;</button>
					</div>
				</div>
			</form>
		</div>
	</div>




	<script>
		$(function() {

			//結束
			$("#EDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "yy-mm-dd"
			});

			//出發
			$("#BDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "yy-mm-dd"
			});
			
			//選擇上架
			$("#activity_state").selectmenu();

			//觸發actID,帶入資料到<input>
			$("#actID").change(function() {
                var actID = $(this).val();
                console.log(actID);
                $.getJSON('/CHEWME2/activityServlet.do?action=getOne_For_Update',{'actID' : actID},function(data) {
			    //actID = JSON.parse(data);
			    console.log(data);
			    $('#act_name').val(data.act_name);
			    $('#act_groups').val(data.act_groups);
			    $('#act_current').val(data.act_current);
				$('#BDate').val(data.BDate);
				$('#EDate').val(data.EDate);
				$('#activity_state').val(data.activity_state);
				
                });
			});
			
			//送出更新資料
			$('#submit').click(
					function() {
						var afrm = $('form[name="actForm"]');
						//console.log(afrm)
						$.post('/CHEWME2/activityServlet.do?action=Updata',
								afrm.serialize(), function(data) {
									swal('更新成功', 'Hello World!', 'success');

									$('#act_name').val(data.act_name);
									$('#act_groups').val(data.act_groups);
									$('#BDate').val(data.BDate);
									$('#EDate').val(data.EDate);
									$('#activity_state').val(data.activity_state);
									});
						});
			
			$().filePreview({
			    parent: ".form1",
			    selector: ".upload",
			    success: function (key, obj){
			        console.log(obj)
			    }
			});
			});
	</script>
</body>
</html>