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
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.product-item {
	padding: 15px;
	background: #fff;
	margin-top: 20px;
	position: relative;
}

.product-item:hover {
	box-shadow: 5px 5px rgba(234, 234, 234, 0.9);
}

.product-item:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
	font-size: 0;
	line-height: 0;
}

.sticker {
	position: absolute;
	top: 0;
	left: 0;
	width: 63px;
	height: 63px;
}

.sticker-new {
	background: url(http://keenthemes.com/assets/bootsnipp/new.png)
		no-repeat;
	left: auto;
	right: 0;
}

.pi-img-wrapper {
	position: relative;
}

.pi-img-wrapper div {
	background: rgba(0, 0, 0, 0.3);
	position: absolute;
	left: 0;
	top: 0;
	display: none;
	width: 100%;
	height: 100%;
	text-align: center;
}

.product-item:hover>.pi-img-wrapper>div {
	display: block;
}

.pi-img-wrapper div .btn {
	padding: 3px 10px;
	color: #fff;
	border: 1px #fff solid;
	margin: -13px 5px 0;
	background: transparent;
	text-transform: uppercase;
	position: relative;
	top: 50%;
	line-height: 1.4;
	font-size: 12px;
}

.product-item .btn:hover {
	background: #e84d1c;
	border-color: #c8c8c8;
}

.product-item h3 {
	font-size: 14px;
	font-weight: 300;
	padding-bottom: 4px;
	text-transform: uppercase;
}

.product-item h3 a {
	color: #3e4d5c;
}

.product-item h3 a:hover {
	color: #E02222;
}

.pi-price {
	color: #e84d1c;
	font-size: 18px;
	float: left;
	padding-top: 1px;
}

.product-item .add2cart {
	float: right;
	color: #a8aeb3;
	border: 1px #ededed solid;
	padding: 3px 6px;
	text-transform: uppercase;
}

.product-item .add2cart:hover {
	color: #fff;
	background: #e84d1c;
	border-color: #e84d1c;
}
</style>
<body>
	<header><%@ include file="../header.jsp"%></header>
	
	<div class="container">
	<div class="row">
		<h2>Stylish Search Box</h2>
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="  search-query form-control" placeholder="Search" />
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
</div>

	<jsp:useBean id="actSvc" scope="page"
		class="com.iii.eeit9703.activity.model.ActService" />

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row">
					<c:forEach var="activityVO" items="${actSvc.all}">
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="300x200"
									src="data:image/png;base64,${activityVO.act_photo}" />
								<div class="caption">
									<p>${activityVO.act_name}</p>
									<p>
										<a class="btn btn-primary" href="#">${activityVO.act_name}</a>
										<a class="btn btn-primary" href="#">成團人數:${activityVO.act_groups}</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>					
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row">										
						<c:forEach var="activityVO" items="${actSvc.all}">
						<div class="col-md-4">
							<div class="thumbnail">
								<div class="product-item">
									<div class="pi-img-wrapper">									
										<img src="data:image/png;base64,${activityVO.act_photo}"
											class="img-responsive" alt="Berry Lace Dress">
										<div>
											<a href="#" class="btn">View</a>
										</div>
									</div>
									<h3>
										<a href="shop-item.html">Berry Lace Dress</a>
									</h3>
									<div class="pi-price">$29.00</div>
									<a href="javascript:;" class="btn add2cart">Add to cart</a>
									<div class="sticker sticker-new"></div>																
								</div>
							</div>
						</div>
                    </c:forEach>	
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
</script>
<script src="../js/jquery.twzipcode.min.js"></script>
</html>