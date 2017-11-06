﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	href="<%=request.getContextPath()%>/css/bootstrap-adjust.css">

</head>
<body>

	<header><%@ include file="../header.jsp"%></header>

	<p hidden id="clubIdforView" value="">${clubVOForView.clubId}</p>
	<p hidden id="reqContextPath" value=""><%=request.getContextPath()%></p>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				
				
			</div>

			<div class="col-md-8">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="row">
								<%-- 						<img class="d-block w-100" src="<%=request.getContextPath() %>/getImageInChewme.do?type=clubPic&id=${clubVOForView.clubId}" alt="First slide" style="margin:auto;"> --%>

								<div id="theClubPic" class="container">
									<img class="d-block w-100 img-responsive" src=""
										id="img_${clubVOForView.clubId}" alt="First slide">
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carouselExampleControls"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
			<div cass="col-md-2">
				 <a class="btn btn-sm btn-primary"  role="button">
					管理畫面
				</a>
				 <a class="btn btn-sm btn-primary" href="<%=request.getContextPath()%>/club/clubClientView.do?action=createClubAct&clubId=${clubVOForView.clubId}" role="button">
					創社團活動
				</a>
				 
			</div>
		</div>
		<div class="row" id="tabs">
			<div class="col"></div>
			<div class="col-7">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="new-travel-tab" data-toggle="tab" href="#newActList-page"
						role="tab" aria-controls="home" aria-expanded="true">推薦行程</a></li>
					<li class="nav-item"><a class="nav-link "
						id="pass-travel-tab" data-toggle="tab" href="#oldActList-page"
						role="tab" aria-controls="profile">過去行程</a></li>
					<li class="nav-item"><a class="nav-link " id="forum-tab"
						data-toggle="tab" href="#forum-page" role="tab"
						aria-controls="profile">討論區</a></li>
					<li class="nav-item"><a class="nav-link "
						id="myclub-tab" data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile">關於我們</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#addNewAct-page" role="tab"
						aria-controls="profile">新增行程</a></li>
					<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
							Dropdown </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" id="dropdown1-tab" href="#dropdown1"
								role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a>
							<a class="dropdown-item" id="dropdown2-tab" href="#dropdown2"
								role="tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a>
						</div></li> -->
				</ul>
			</div>
			<div class="col"></div>
			<div id="forum-page">
				<%@ include file="ccvForum.jsp"%>
			</div>
			<div id="newActList-page">
				<%@ include file="ccvNewActList.jsp"%>
			</div>
			<div id="oldActList-page">
				<%@ include file="ccvOldActList.jsp"%>
			</div>
			<div id="addNewAct-page">
				<iframe src="../act/createAct2.jsp"></iframe>
			</div>
		</div>



	</div>

	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/clubClientViewFrameScript.js"></script>
	<script src="js/ccvCreateForum.js"></script>
</body>
</html>