<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mybootstrap.css">
<style>
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
</head>

<body>
	<header>
		<%@ include file="header.jsp"%></header>

	<div class="container">
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="image/101.jpg" alt="First slide">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="image/beach.jpg" alt="Second slide">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="image/water_sporting.png" alt="Third slide">
					<div class="carousel-caption">...</div>
				</div>
				...
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-expanded="true">Home</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">有趣經驗</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">旅遊景點</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">關於我們</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"></a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
				role="button" aria-haspopup="true" aria-expanded="false">
					Dropdown </a>
				<div class="dropdown-menu">
					<a class="dropdown-item" id="dropdown1-tab" href="#dropdown1"
						role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a> <a
						class="dropdown-item" id="dropdown2-tab" href="#dropdown2"
						role="tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a>
				</div></li>
		</ul>

	<%-- 	<c:forEach var="activity" items=""> --%>
			<div class="row">
				<c:forEach var="x" varStatus="statusX" begin="1" end="3" step="1">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="..." alt="...">
							<div class="caption">
								<h3>Thumbnail label</h3>
								<p>...</p>
								<p>
									<a href="#" class="btn btn-primary" role="button">Button</a> <a
										href="#" class="btn btn-default" role="button">Button</a>
								</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		<%-- </c:forEach>	 --%>

	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>