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
	href="<%=request.getContextPath()%>/css/bootstrap-adjust.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"></link>
<%--圖形區域選擇器 加上canvas所需要的程式碼--%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="css/dialog.css" />
<link rel="stylesheet" type="text/css"
	href="../css/igs/imgareaselect-default.css" />

<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.carousel-inner{
  width:100%;
  max-height: 350px; <!-- !important -->
}
.btn{
width:70%;
}
</style>
</head>
<body>

	<header><%@ include file="../header.jsp"%></header>

	<p hidden id="clubIdforView" value="">${clubVOForView.clubId}</p>
	<p hidden id="reqContextPath" value=""><%=request.getContextPath()%></p>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<table class="table table-hover">
					<thead>
						<tr>
							<td>名稱</td>
							<td>內容</td>
						</tr>
					</thead>
					<tbody>

						<tr>
							<td>社團編號:</td>
							<td>${clubVOForView.clubId}</td>
						</tr>
						<tr>
							<td>社團名稱:</td>
							<td>${clubVOForView.clubName}</td>
						</tr>
						<tr>
							<td>社團管理者:</td>
							<td>${clubVOForView.managerId}</td>
						</tr>
						<tr>
							<td>地點:</td>
							<td>${clubVOForView.locationId}</td>
						</tr>
						<tr>
							<td>地址:</td>
							<td>${clubVOForView.addr}</td>
						</tr>
						<tr>
							<td>參考網址:</td>
							<td>${clubVOForView.refURL}</td>
						</tr>
						<tr>
							<td>總拜訪人數:</td>
							<td>${clubVOForView.vistors}</td>
						</tr>
						<tr>
							<td>本月拜訪人數:</td>
							<td>${clubVOForView.vistorsInMonth}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-7">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div id="theClubPic" class="item active">
							<%-- 						<img class="d-block w-100" src="<%=request.getContextPath() %>/getImageInChewme.do?type=clubPic&id=${clubVOForView.clubId}" alt="First slide" style="margin:auto;"> --%>

								<img class=" center-block" src=""
									id="img_${clubVOForView.clubId}" alt="First slide">

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
			<div class="col-md-2">
				<div>
					<a class="btn btn-sm btn-primary" role="button"> 管理畫面 </a>
				</div>
				<div>
					<a class="btn btn-sm btn-primary"
						href="<%=request.getContextPath()%>/club/clubClientView.do?action=createClubAct&clubId=${clubVOForView.clubId}"
						role="button"> 創社團活動 </a>
				</div>
				<div>
					<label class="btn btn-sm btn-primary" for="uploadImage"> <input
						id="uploadImage" name="photo" style="display: none;" type="file"
						value="upload_photo"> <i class="fa fa-folder-open-o"></i>
						換照片
					</label>
				</div>


			</div>
		</div>
		<div class="row" id="tabs">
			<div class="col"></div>
			<div class="col-7">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="new-travel-tab" data-toggle="tab" href="#newActList-page"
						role="tab" aria-controls="home" aria-expanded="true">推薦行程</a></li>
					<li class="nav-item"><a class="nav-link " id="pass-travel-tab"
						data-toggle="tab" href="#oldActList-page" role="tab"
						aria-controls="profile">過去行程</a></li>
					<li class="nav-item"><a class="nav-link " id="forum-tab"
						data-toggle="tab" href="#forum-page" role="tab"
						aria-controls="profile">討論區</a></li>
					<li class="nav-item"><a class="nav-link " id="myclub-tab"
						data-toggle="tab" href="#profile" role="tab"
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
		<div id="canvasDiv" hidden>
			<canvas id="myCanvas" style="border: 1px solid #000000;"></canvas>
		</div>
		<div id="dialog-img" title="Create new user">
			<p class="validateTips">請選擇圖片所要的範圍</p>

			<!-- Allow form submission with keyboard without duplicating the dialog button -->
			<img id="img" src="">
			<button id="confirmImg">confirm</button>
		</div>



	</div>


	<script src="js/dialog.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.imgareaselect.pack.js"></script>
	<script src="js/clubClientViewFrameScript.js"></script>
	<script src="js/ccvCreateForum.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/com-resource/js/imgSelAndUpload.js"></script>
</body>
</html>