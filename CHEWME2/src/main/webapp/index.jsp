<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/slideshow.js">	</script>

<style>

ul, li {
	padding: 0;
	margin: 0;
	list-style-type: none,
}

#abgne-block-20110317 {
	width: 1140px; /* 圖片的寬 */
	height: 350px; /* 圖片的高 + 30 */
	border: 10px solid #ddd;
}

.abgne-player {
	width: 1120px; /* 圖片的寬 */
	height: 308px; /* 圖片的高 */
	position: relative;
	overflow: hidden;
}

.abgne-player ul.abgne-list {
	position: absolute;
	width: 9999px;
	height: 100%;
}

.abgne-player ul.abgne-list li {
	float: left;
	width: 1120px; /* 圖片的寬 */
	height: 100%;
}

.abgne-player ul.abgne-list img {
	width: 100%;
	height: 100%;
	border: 0;
}

.abgne-control {
	height: 26px;
	padding: 3px;
	color: #fff;
	font-size: 13px;
	background: #333;
}

.abgne-control ul {
	float: left;
}

.abgne-control ul li {
	float: left;
	padding: 0 5px;
	line-height: 20px;
	margin: 2px;
	background: #666;
	cursor: pointer;
}

.abgne-control ul.numbers {
	margin-left: 13px;
}

.abgne-control ul li.current {
	background: #fff;
	color: #000;
}

.abgne-control ul li.hover {
	background: #fff;
	color: #000;
}

</style>

</head>

<body>
	<header><%@ include file="header.jsp"%></header>
	<article>
		<div class="jumbotron">
			<div class="container">

				<div id="abgne-block-20110317">
					<div class="abgne-player">
						<ul class="abgne-list">

						</ul>
					</div>
					<div class="abgne-control">
						<ul class="arrows" style="list-style-type: none">
							<li style="list-style-type: none" class="prev">&lt;</li>
							<li style="list-style-type: none" class="next">&gt;</li>
						</ul>
					</div>
				</div>
				


<!-- 				<ul class="nav nav-tabs" id="myTab" role="tablist"> -->
<!-- 					<li class="nav-item"><a class="nav-link active" id="home-tab" -->
<!-- 						data-toggle="tab" href="#home" role="tab" aria-controls="home" -->
<!-- 						aria-expanded="true">Home</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile">有趣經驗</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile">關於我們</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile"></a></li> -->
<!-- 					<li class="nav-item dropdown"><a -->
<!-- 						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" -->
<!-- 						role="button" aria-haspopup="true" aria-expanded="false"> -->
<!-- 							Dropdown </a> -->
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<a class="dropdown-item" id="dropdown1-tab" href="#dropdown1" -->
<!-- 								role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a> -->
<!-- 							<a class="dropdown-item" id="dropdown2-tab" href="#dropdown2" -->
<!-- 								role="tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a> -->
<!-- 						</div></li> -->
					
<!-- 				</ul> -->

				<%-- 	<c:forEach var="activity" items=""> --%>
				<div><%@ include file="act/search.jsp"%></div>
				<div class="row">
<%-- 					<c:forEach var="x" varStatus="statusX" begin="1" end="3" step="1"> --%>
<!-- 						<div class="col-sm-6 col-md-4"> -->
<!-- 							<div class="thumbnail"> -->
<!-- 								<img src="..." alt="..."> -->
<!-- 								<div class="caption"> -->
<!-- 									<h3>Thumbnail label</h3> -->
<!-- 									<p>...</p> -->
<!-- 									<p> -->
<!-- 										<a href="#" class="btn btn-primary" role="button">Button</a> <a -->
<!-- 											href="#" class="btn btn-default" role="button">Button</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
				</div>
				
				
				<%-- </c:forEach>	 --%>

			</div>
		</div>
		<div id="2">  
		<span><input type="button" class="inputCar" value="測試加入購物車"></span>
		<span><input type="button" class="report" value="檢舉"></span>
		</div>
		
		<ul class="dropdown-menu mega-dropdown-menu row">
            <li class="col-sm-3">
              <ul>
                <li class="dropdown-header">New in Stores</li>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                    <div class="item active left">
                      <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 1"></a>
                      <h4><small>Summer dress floral prints</small></h4>
                      <button class="btn btn-primary" type="button">49,99 €</button>
                      <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>
                    </div>
                    <!-- End Item -->
                    <div class="item next left">
                      <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 2"></a>
                      <h4><small>Gold sandals with shiny touch</small></h4>
                      <button class="btn btn-primary" type="button">9,99 €</button>
                      <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>
                    </div>
                    <!-- End Item -->
                    <div class="item">
                      <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 3"></a>
                      <h4><small>Denin jacket stamped</small></h4>
                      <button class="btn btn-primary" type="button">49,99 €</button>
                      <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>
                    </div>
                    <!-- End Item -->
                  </div>
                  <!-- End Carousel Inner -->
                </div>
                <!-- /.carousel -->
                <li class="divider"></li>
                <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
              </ul>
            </li>
            
          </ul>
	
	</article>



</body>

</html>