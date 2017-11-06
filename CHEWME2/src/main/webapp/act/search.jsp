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

</style>
<body>
	<header><%@ include file="../header.jsp"%></header>
	
	<div class="container">
	<div class="row">
		<h2>Stylish Search Box</h2>
           <div id="custom-search-input">
                            <div class="input-group col-md-12">

                                <input type="text" class="  search-query form-control" placeholder="Search" id="text" name="text"/>
                                <span class="input-group-btn">
                                    <button class="btn btn-danger" type="button" id="search" name="search">
                                        <span class=" glyphicon glyphicon-search"></span>
                                    </button>
                                </span>
                            </div>
                        </div>
	</div>
</div>

	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row" id="div1">
					<c:forEach var="activityVO" items="${actSvc.all}">
						<div class="col-md-4">
							<div class="thumbnail">
								<img alt="" src="data:image/png;base64,${activityVO.act_photo}" id=""/>
								<div class="caption">
									<p>${activityVO.act_name}</p>
									<p>
										<a class="btn btn-primary" href="#" id="act_name">${activityVO.act_name}</a>
										<a class="btn btn-primary" href="#" id="act_groups">成團人數:${activityVO.act_groups}</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>					
				</div>
			</div>
		</div>
	</div>

	
</body>


<script src="../act/js/search.js"></script>

</html>