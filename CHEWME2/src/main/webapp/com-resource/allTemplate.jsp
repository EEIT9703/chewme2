<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>歡迎蒞臨${clubVOForView.clubName}</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/club/css/mystyle.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-adjust.min.css">

</head>
<body>

	<header><%@ include file="../header.jsp"%></header>

	<div class="container">
		<div class="panel panel-default" id="newIssue">
			<div class="container">
			
				<div class="panel-heading">

					<div class="col-xs-2 col-sm-2 col-md-2">
						<h3 class="panel-title" style="text-align:center">新議題：</h3>
					</div>
					<input type="text" id="title" style="width: 82%">
				</div>
				<div class="panel-body">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<textarea class="" rows="4" id="newIssueContext" style="width: 100%;resize: none;" ></textarea>
					</div>
				</div>
			</div>
		</div>
		<div class="panel panel-default" id="">
			<div class="panel-heading">
				<h3 class="panel-title">Panel title</h3>
			</div>
			<div class="panel-body">
				<ul class="list-group">
					<li class="list-group-item">
						<div class="row">
							<div class="col-xs-1 col-sm-1 col-md-1">
								<img src="http://via.placeholder.com/50x50"
									class="img-responsive"></img>
							</div>
							<div class="col-xs-10 col-sm-10 col-md-11">
								<div class="well">...</div>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="row">
							<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
								<img src="http://via.placeholder.com/50x50"
									class="img-responsive"></img>
							</div>
							<div class="col-xs-10 col-sm-10 col-md-10">
								<div class="well">...</div>
							</div>
						</div>
					</li>


					<li class="list-group-item">
						<div class="row">
							<div class="col-xs-1 col-sm-1 col-md-1 col-md-offset-1">
								<img src="http://via.placeholder.com/300x300"
									class="img-responsive"></img>
							</div>
							<div class="col-xs-10 col-sm-10 col-md-9">
								<textarea class="full" style="resize: none;"></textarea>
							</div>
							<div class="col-xs-1 col-sm-1 col-md-1">
								<button type="submit" class="btn btn-primary btn-xs"
									name="comment" style="width: 80%">送出</button>
								<div class="container"></div>
							</div>

						</div>
					</li>
				</ul>
			</div>
		</div>





	</div>

	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/clubClientViewFrameScript.js"></script>
</body>
</html>