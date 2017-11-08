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

body { background-color:#ddd; }
.blog-row {margin-top:50px; }
.margin_bottom30 { margin-bottom:30px; }
.margin_left10 {margin-left:10px; }
.blog-content {padding:10px; }
.bg-white {background-color:#fff;}

.product_buttons {
  -webkit-font-smoothing: antialiased;
  -moz-font-smoothing: antialiased;
  font-smoothing: antialiased;
}

.add_to_cart:hover {
  color: #4DC8D3;;
  background: rgba(255, 255, 255, 0.5);
}

.product_buttons button {
    color: #252525;
    background: rgba(255, 255, 255, 1);
    font-size: 1em;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    border: 1px solid #000;
  }


</style>
<body>

	
	
	<div class="container">
	<div class="row">
		<h2>Stylish Search Box</h2>
           <div id="custom-search-input">
                            <div class="input-group col-md-12">
                                <input type="text" class="search-query form-control" placeholder="Search" id="text"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button" id="search">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
</div>
	




	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />


    <div class="container">             	
	<div class="row" id="div1">
          <c:forEach var="activityVO" items="${actSvc.all}">
           <div class="col-md-4  margin_bottom30">
           <div class="thumbnail">
			<a href="javascript::;">
				<img class="img-responsive center-block" src="data:image/png;base64,${activityVO.act_photo}" height="250">
				</a>
				<div class="blog-content bg-white">
				<h3>${activityVO.act_name}</h3>
				<p>Category : <a href="javascript::;">Nature</a></p>
				<p>旅遊介紹<a href="javascript::;"  class="heading_color">  Continue Reading</a></p>
				<hr>
				<p><span>Share : 
				<a href="javascript::;"><i class="fa fa-facebook margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-twitter margin_left10" aria-hidden="true"></i></a>
				<a href="javascript::;"><i class="fa fa-google-plus margin_left10" aria-hidden="true"></i></a>
				 </span> 

				<span class="pull-right">
				<a href="#" class="btn btn-info btn-sm">
              <span class="glyphicon glyphicon-shopping-cart" id="add_cart"></span> 加入購物
              </a>                   
              </span>

				</div>
				</div>
			</div>
			</c:forEach>
			</div>
			</div>
	
</body>


<script src="../act/js/search.js"></script>
<script src="https://use.fontawesome.com/1dec14be15.js"></script>

</html>