﻿﻿﻿﻿
<%-- <%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>
<%@ page import="com.iii.eeit9703.collection.*"%>
<%
CollectionService ser=new CollectionService();
List<CollectionVO> list=ser.getColVOListByMemId(1);
pageContext.setAttribute("list",list);
int a=list.size();
pageContext.setAttribute("all",a);
%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- 置頂  -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/loginNregister.css">

<style>

/*  shopping car start  */
.cartrows {
	overflow-x: hide;
	overflow: auto;
	max-height: 40vh;
	width: 298px
}

.cartrow {
	width: 100%;
	padding: 10px;
	margin: auto;
}

.close {
	text-align: right;
}

.goshop {
	text-align: center;
}

/* .courseTitle { 
 	font-size: 20px; 
 	color: #3e3d3e; 
 	width: 70%; 
 	white-space: nowrap; 
 	text-overflow: ellipsis; 
 	overflow: hidden; 
 	float: right; 
 	font-weight: bold; 
 } 
 .courseSubtitle { 
 	font-size: 16px; 
 	float: left; 
 } 
 .courseDelete { 
 	float: right; 
 	padding-right: 10px; 
 } 
  .cartrow img {  
  	width: 30%; 
  	height: 70px; 
  }  
  
 	.cartcount { 
 	position: absolute; 
 	right: 5px; 
 	border: 1px solid #FFF; 
 	background: #F68867;
 	color: #FFF; 
 	border-radius: 100px; 
 	font-size: 12px; 
 	font-weight: bold; 
 	text-align: center; 
 	z-index: 15; 
 	width: 20px; 
 	height: 20px; 
 } */

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

.nav-shopping-cart {
	position: relative;
	display: inline-block;
	margin-top: 8px;
	margin-right: 25px;
}

.navbar-default {
	background-color: #f8f8f8;
	border-color: #e7e7e7;
	margin-top: 0px
}

.btn-primary {
	color: #fff;
	background-color: #286090;
	border-color: #204d74;
	width: 150px;
	height: 30px;
}

body {
	padding-bottom: 100px;
}

/* header不要加 50px 以上body裡面的內容為bootstrap網站裡面的解決方法*/
</style>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div>
			<div>
				<p class="navbar-left" href="<%=request.getContextPath()%>/index.jsp">
					<img src="<%=request.getContextPath()%>/image/chewme-logo-3-2.png"
						width="" height="" alt="" style="max-width:250px;">
				</p>
			</div>
<!-- 			 <div class="navbar-header" >
				<p class="navbar-brand " style="font-family: 'Arial';font-size:30px;margin-top:7px;font-weight:bold;">CHEWME</p>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-right"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div> -->
		</div>
		<div id="navbar-right" class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style="margin-left: 50px">
				<li><a href="<%=request.getContextPath()%>/index.jsp"><img
						src="<%=request.getContextPath()%>/image/home.png" width=40px
						height=40px> Home</a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img
						src="<%=request.getContextPath()%>/image/calendar.png" width=40px
						height=40px> 揪旅行<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="<%=request.getContextPath()%>/actEditor/editorScuedule.jsp">創行程</a></li>
						<li><a
							href="<%=request.getContextPath()%>/act/actServlet?action=createAct">揪新團</a></li>
					</ul></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img
						src="<%=request.getContextPath()%>/image/users.png" width=40px
						height=40px> 找社團<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a
							href="<%=request.getContextPath()%>/club/createClub.do">創社團</a></li>
						<li><a href="<%=request.getContextPath()%>/club/findClub.do">揪社團</a></li>
					</ul></li>

				<li><a
					href="<%=request.getContextPath()%>/attractions/listAll.jsp"><img
						src="<%=request.getContextPath()%>/image/maps.png" width=40px
						height=40px> 查景點</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right" style="margin-top: 10px;">

				<c:choose>
					<c:when test="${!empty LoginOK}">
						<li class="nav-shopping-cart"><div class="dropdown">
								<img id="drop" data-toggle="dropdown"
									src="<%=request.getContextPath()%>/image/material.png"
									width=40px height=40px /><span class="aaa" data-reactid="65"></span>
								<ul style="width: 300px;"
									class="dropdown-menu pull-right  role="
									menu"
							aria-labelledby="drop">
									<!-- 						<ul class="dropdown-menu" style="width: 465px;"> -->
									<!--  											<li class="dropdown-header"  -->
									<!--  												style="border-bottom: 1px solid #aaaaaa;"><h3>4444</h3></li>  -->
									<div class="cartrows">
										<!-- 							<div class="cartrow"> -->
										<!-- 									<div style="float: left"> -->
										<!-- 										<img src="image/101.jpg" height=50px width=50px> -->
										<!-- 									</div> -->
										<!-- 									<div> -->
										<!-- 										<span>九份一ssssssssssss日遊</span>  -->
										<!-- 										<span><button type="button" class="close glyphicon glyphicon-remove"></button></span> -->
										<!-- 									</div> -->
										<!-- 									<div>$5880</div> -->
										<!-- 							</div>		 -->
									</div>
									<li role="presentation" class="divider"></li>
									<li role="presentation" class="goshop"><a
										href="<%=request.getContextPath()%>/backage/collection.jsp"><input
											type="button" value="前往收藏列表" class="btn btn-primary"
											style="text-align: center"></a></li>
								</ul>
							</div></li>
					</c:when>
					<c:otherwise>
						<li class="nav-shopping-cart"><div class="dropdown">
								<img id="drop" data-toggle="dropdown"
									src="<%=request.getContextPath()%>/image/material.png"
									width=40px height=40px />
					</c:otherwise>

				</c:choose>

				<li><c:if test="${  !empty SysManager }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/backage/backage_index.jsp"><span>
							<img src="<%=request.getContextPath()%>/image/settings.png" width=30px height=30px></span>維護 </a>
					</c:if></li>
				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="#" data-toggle="modal"
							data-target="#loginNregisterModal"><span>
							<img src="<%=request.getContextPath()%>/image/login_1.png" width=30px height=30px></span>登入/註冊 </a>
					</c:if></li>

				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/logout.jsp"><span>
							<img src="<%=request.getContextPath()%>/image/login_out_1.png" width=30px height=30px></span>登出 </a>
					</c:if></li>
	
				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link" style="padding:19px 0px 0px 0px;margin-right:10px"
							href="<%=request.getContextPath()%>/member/mempage.jsp" a>${LoginOK.memNickN}</a>
					</c:if></li>
				<c:choose>
						<c:when test="${  empty LoginOK}">
						<li style="padding:18px 0px 0px 0px;margin-left:20px">
								訪客,你好
						</c:when>
						<c:when test="${ ! empty LoginOK && empty LoginOK.memPhoto && empty picUri}">
						<li >
							<img src='<%=request.getContextPath()%>/image/nophoto.png'
									style="border-radius: 50%" width=50px height=50px>
						</c:when>
						
						<c:when test="${ ! empty LoginOK && ! empty LoginOK.memPhoto}">
						<li>
							<img src='data:image/png;base64,${LoginOK.memPhoto}'
								style="border-radius: 50%" width=50px height=50px>
						</c:when>
						
						<c:otherwise>
							<img src='${picUri}' style="border-radius: 50%" width=50px height=50px >
						</c:otherwise>
					</c:choose></li>
				<li style="width: 50px"></li>
			</ul>
		</div>
	</div>


</nav>

<div class="modal fade" id="loginNregisterModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2 style="color: #00BBFF">CHEWME</h2>
			</div>
			<div class="modal-body">
				<div class="container" align="center">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="panel panel-login">
								<div class="panel-heading">
									<div class="row">
										<div class="col-xs-6">
											<a href="#" class="active" id="login-form-link">登入</a>
										</div>
										<div class="col-xs-6">
											<a href="#" id="register-form-link">註冊</a>
										</div>
									</div>
									<hr>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-lg-12">
											<form id="login-form"
												action="<%=request.getContextPath()%>/member/login.do"
												method="post" role="form" style="display: block;">
												<%@ include file="/member/login.jsp"%>
											</form>									
											<form ENCTYPE="multipart/form-data" id="register-form"
											action="<%=request.getContextPath()%>/member/register.do"
											method="post" role="form" style="display: none;">
												<%@ include file="/member/register.jsp"%>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->
</div>
<div id="gridSystemModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="gridModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="gridModalLabel" style="color:#007799">忘記密碼?</h4>
			</div>
			<form action="<%=request.getContextPath()%>/member/forgetPwd.do" method="post">
				<div class="modal-body">
					<div class="row">
						<div class="col-md-3 col-md-offset-3">
							&nbsp;您的帳號：<input type="text" name="userId" /><br>
							&nbsp;您的信箱：<input type="text" name="userMail" /><br>
						</div>
						<br />
					</div>

				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/register.js"></script>
<script src="<%=request.getContextPath()%>/js/loginNregister.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script>
 $(function(){
	
	loadActivity();

	function loadActivity(){		
		$.getJSON('<%=request.getContextPath()%>/ShoppingCar?action=getMyCars',{},function(array){
			
        var fg = $(document.createDocumentFragment());
	 		var opt = $(".cartrows");
	 			opt.empty();
			var count=0;
			
			if(array!=''){
	 		$.each(array,function(i,activity){
	 			var img ="data:image/png;base64,"+activity.act_photo;
	 			var div_out=$("<div></div>").addClass('cartrow');
	 		
	 			var cell1=$("<div></div>").css("float","left");
	 			var img =$('<img width=50px height=50px >').attr('src',img);
	 			
	 			
	 			var span1=$('<span></span>').text(activity.act_name)
	 			var button = $('<button id="opop"></button>').css('color','red').addClass('close glyphicon glyphicon-remove').attr({'type':'button','name':activity.actID});
	 			var span2=$('<span></span>').append(button)			
	 			var cell2=$("<div></div>").append([span1,span2])	
	 			var cell3=$("<div></div>").text("價錢:"+activity.act_price+"$").css('margin','5px 0px 0px 0px')
	 			
	 			cell1.append(img);
	 			div_out.append([cell1,cell2,cell3]);
	 			fg.append(div_out);
	 			count++;
	 		})
			}
			else{
				var div_no=$("<h3>你未收藏任何行程</h3>").addClass('cartrow')
				fg.append(div_no);
				
			}
	 		$('.aaa').text(count);
	 		$('.cartrows').append(fg);
	 		
		})
			
			
	}
		

	
	$('.cartrows').on('click','button',function(){
		var actID=$(this).attr('name');
	
		$.post('<%=request.getContextPath()%>/ShoppingCar?action=deleteCar',{"actID":actID},loadActivity);
	
	
	})
	

	
	$('#div1').on('click','button',function(){
		var id = $(this).parent().parent().parent().parent().parent().find('input').attr('id')
	
		
		$.getJSON('<%=request.getContextPath()%>/ShoppingCar?action=inputCar',{'ID' : id}, result);
	})
		function result(array) {
			$.each(array, function(i, result) {
				if (result.existColl == "已加入購物車") {
					alert(result.existColl)
				} else {
					alert(result.inputOK)
					loadActivity();
				}
			})

		}



	})
	$(function() {
			// 預覽圖片
			$("#memPhoto").change(function() {

				readImage_header(this);
			});

			function readImage_header(input) {
				if (input.files && input.files[0]) {
					var file = input.files[0];
					var FR = new FileReader();
					FR.onload = function(e) {
						// e.target.result = base64 format picture
						$('#img_header ').attr("src", e.target.result);
						var url = e.target.result;

					};
					FR.readAsDataURL(input.files[0]);
				}
			} // 預覽圖片結束
		})		
</script>
