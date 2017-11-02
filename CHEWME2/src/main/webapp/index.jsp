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
<!-- <link rel="stylesheet" href="css/mybootstrap.css"> -->
<style>

/* shopping car start */
/* .courseTitle { */
/* 	font-size: 20px; */
/* 	color: #3e3d3e; */
/* 	width: 70%; */
/* 	white-space: nowrap; */
/* 	text-overflow: ellipsis; */
/* 	overflow: hidden; */
/* 	float: right; */
/* 	font-weight: bold; */
/* } */
/* .courseSubtitle { */
/* 	font-size: 16px; */
/* 	float: left; */
/* } */
/* .courseDelete { */
/* 	float: right; */
/* 	padding-right: 10px; */
/* } */
/* .cartrows { */
/* 	overflow-x: hide; */
/* 	overflow: auto; */
/* 	max-height: 40vh; */
/* 	width:400px */
/* } */
/* .cartrow { */
/* 	width: 90%; */
/* 	padding: 20px; */
/* 	border-bottom: 1px solid #cccccc; */
/* 	margin: auto; */
/* } */
/* .cartrow img { */
/* 	width: 30%; */
/* 	height: 70px; */
/* } */
/* .close { */
/* 	float: none; */
/* } */
/* .cartcount { */
/* 	position: absolute; */
/* 	right: 5px; */
/* 	border: 1px solid #FFF; */
/* 	background: #F68867; */
/* 	color: #FFF; */
/* 	border-radius: 100px; */
/* 	font-size: 12px; */
/* 	font-weight: bold; */
/* 	text-align: center; */
/* 	z-index: 15; */
/* 	width: 20px; */
/* 	height: 20px; */
/* } */

/* shopping car end */

.aaa {
	position: absolute;
	right: -10px;
	border: 1px solid #fff;
	background: #FF5511;
	
	color: #fff;
	border-radius: 100px;
	font-size: 12px;
	font-weight: 800;
	text-align: center;
	z-index: 15;
	width: 20px;
	height: 15px;
			
}
.close {
	float: none;
}

.Carli{

width:600px;

}
.goshop {

	margin-left:30px;

}

.carlist{
	padding:5px;

}
	

.nav-shopping-cart {
	position: relative;
	display: inline-block;
	margin-top:8px;
	margin-right:25px;
}

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
				


				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-expanded="true">Home</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile">有趣經驗</a></li>
					<li class="nav-item"><a  href="/CHEWME2/attractions/listAll.jsp" >旅遊景點</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile">關於我們</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile"></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
							Dropdown </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" id="dropdown1-tab" href="#dropdown1"
								role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a>
							<a class="dropdown-item" id="dropdown2-tab" href="#dropdown2"
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
		</div>
		<div id="4">
		<span><input type="button" class="inputCar" value="測試加入購物車"></span>
		<span><input type="button" class="report" value="檢舉"></span>
		</div>
		
	</article>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/slideshow.js">	</script>



<script>
$(function(){
	$.getJSON('<%=request.getContextPath()%>/activity?action=getMyCollection',{},snedActivity);
	
	function snedActivity(array){

// 		var fg = $(document.createDocumentFragment());
// 		var opt = $(".cartrows");
// 			opt.empty();
		
// 		$.each(array,function(i,activity){		
// 			var cell1=$("<div style='float:left'></div>").html("<img src='image/101.jpg' width=30px height=30px>");
			
// 			var cell2=$("<div style='text-align:left'></div>").text(activity.act_name);
// 			var cell3=$("<div style='text-align:left'></div>").text("價錢9527");
			
// 			var Div1= $("<div style='float:right'></div>").append([cell2,cell3])
// 			var a=$('<a role="menuitem" tabindex="-1" href="#"></a>').append(Div1);
// 			var Div2= $("<div></div>").append(a)
		
				
// 			var butt =$('<button></button>').css('color','red').addClass('close glyphicon glyphicon-remove').attr({'id':"www",'type':'button','name':activity.actID});
// 			var butDiv= $("<div style='float:right'></div>").append(butt);
			
// 			var cell4=$("<div style='float:left'></div>").append([Div2,butDiv])
// 			var cell5=$('<li role="presentation" class="Carli"></li>').append(cell4);
	
						
// 			opt.append(cell5);
// 		})
		
		
		
// 		var fg = $(document.createDocumentFragment());	
// 		$('.cartrows').empty();
// 		$.each(array,function(i,activity){			
// 			var cell1 = $('<div></div>').addClass('cartrow').val(activity.act_name);
// 			var cell2 = $('<div></div>').css('text-align','right');
// 			var cell3 = $('<div></div>').css(['float','left','width','80%','text-align','left']);
// 			var cell4 = $('<button></button>').css('color','red').addClass('close glyphicon glyphicon-remove').attr({'type':'button','name':activity.act_name});
<%-- var cell5 = $('<img>').attr({'src':'<%=request.getContextPath() %>/image/101.jpg'}); --%>
// 			var cell5 = $("<img src='image/101.jpg' width=30px height=30px>");
// 			var cell6 = $('<span></span>').addClass('courseTitle').text(activity.act_name);
// 			var cell7 = $('<br>')
// 			var cell8 = $('<span></span>').addClass('courseSubtitle').text("aaa");
// 			var cell9 = $('<span></span>').addClass('courseDelete')
// 			var cell10 = $('<br>');				
//          var cell11 = $('<span></span>').addClass('courseDelete').text('$1000元');
// 			cell2.append([cell3,cell4])
// 			cell6.append([cell7,cell8,cell9,cell10,cell11])
// 			cell1.append([cell2,cell5,cell6])
// 			fg.append(cell1)	
// 		})
// 		$('.cartrows').append(fg);
	}
	
	$('#www').on('click',{},function(){
		
				alert('aa')
		
	})
	
	
	
	$('.inputCar').click(function(){
		 var id = $(this).parents('div').attr('id');
		 $.getJSON('<%=request.getContextPath()%>/activity?action=inputCar',{'ID':id},result);
			
	})	
	function result(array){	
		$.each(array,function(i,result){				
		if(result.existColl=="已加入購物車"){
				alert(result.existColl)		
		}
		else {		
			alert(result.inputOK)
		}
		})	
		
	}
	
	
	
})

</script>
</body>

</html>