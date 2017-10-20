<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/mybootstrap.css">

</head>

<body>
	<header> <nav class="navbar navbar-expand-lg">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand " href="#"> <img src="image/letter-c.png"
				width="30" height="30" class="d-inline-black align-top " alt="">
				CHEWME
			</a>
		</div>
		<ul class="nav">
			<li class=" nav-item"><a class="nav-link" href="#">Home</a></li>
			<li class=" nav-item"><a class="nav-link" href="#">揪人玩</a></li>
			<li class=" nav-item"><a class="nav-link" href="#">創行程</a></li>
			<li class=" nav-item"><a class="nav-link" href="#">創社團</a></li>

		</ul>
		
		<ul class="nav justify-content-end">
			<li class=" nav-item"><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-user"></span> 登入</a></li>
			<li class=" nav-item"><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-log-in"></span> 註冊</a></li>
		</ul>
	</div>

	</nav> </header>

	<div class="container">
		<div class="carousel-item active">
			<div class="row">
				<div class="col"></div>
				<div class="col-7"></div>
				<div class="col"></div>
			</div>
		</div>
		<nav class="navbar-light bg-littleblue text-white"> </nav>
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">

			<div class="carousel-inner">

				<div class="carousel-item active">
					<img class="d-block w-100" src="image/101.jpg" alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="image/beach.jpg" alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="image/water_sporting.png"
						alt="Third slide">
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


		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="home-tab"
				data-toggle="tab" href="#home" role="tab" aria-controls="home"
				aria-expanded="true">Home</a></li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">有趣經驗</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">旅遊景點</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile">關於我們</a>
			</li>
			<li class="nav-item"><a class="nav-link" id="profile-tab"
				data-toggle="tab" href="#profile" role="tab" aria-controls="profile"></a>
			</li>
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


		<div class="row">
			<div class="col-6 col-md-3 mymiddle">
				<br> <br> <br>
				<button type="button" class="btn btn-primary btn-lg">我要揪人</button>
			</div>
			<div class="col-6 col-md-3 mymiddle">
				<br> <br> <br>
				<button type="button" class="btn btn-primary btn-lg">創建社團</button>
			</div>
			<div class="col-6 col-md-3 mymiddle">
				<br> <br> <br>
				<button type="button" class="btn btn-primary btn-lg">加入社團</button>
			</div>
			<div class="col-6 col-md-3 mymiddle">
				<br> <br> <br>
				<button type="button" class="btn btn-primary btn-lg">其他選項</button>
			</div>
		</div>

	</div>
	<script src="js/jquery-3.2.1.slim.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>

</html>