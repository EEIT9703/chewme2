﻿
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

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- 置頂  -->
<link href="<%=request.getContextPath()%>/css/navbar-fixed-top.css"
	rel="stylesheet">
<!-- 會員 -->>	
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/member.css">

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
	padding: 20px;
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
				<p class="navbar-brand " href="#">
					<img src="<%=request.getContextPath()%>/image/chewme-logobig.png"
						width="330" height="50" alt="" style="padding-bottom: 10px;">
				</p>
			</div>
			<!-- <div class="navbar-header" >
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
											type="button" value="前往結帳" class="btn btn-primary"
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
							href="<%=request.getContextPath()%>/backage/backage_index.jsp"><span
							class="glyphicon glyphicon-log-in"></span>維護 </a>
					</c:if></li>
				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="#" data-toggle="modal"
							data-target="#loginModal"><span
							class="glyphicon glyphicon-log-in"></span>登入 </a>
					</c:if></li>

				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/logout.jsp"><span
							class="glyphicon glyphicon-log-in"></span>登出 </a>
					</c:if></li>

				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="#" data-toggle="modal"
							data-target="#registerModal"><span
							class="glyphicon glyphicon-log-in"></span>註冊 </a>
					</c:if></li>
				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/mempage.jsp" a>${LoginOK.memName }</a>
					</c:if></li>
				<li><c:choose>
						<c:when test="${  empty LoginOK.memPhoto && empty picUri}">
							<img src='<%=request.getContextPath()%>/image/nophoto.png'
								style="border-radius: 50%" width=50px height=50px>
						</c:when>
						<c:when test="${ ! empty LoginOK.memPhoto }">
							<img src='data:image/png;base64,${LoginOK.memPhoto}'
								style="border-radius: 50%" width=50px height=50px>
						</c:when>
						<c:otherwise>
							<img src='${picUri}' style="border-radius: 50%" width=50px
								height=50px>
						</c:otherwise>
					</c:choose></li>
				<li style="width: 50px"></li>
			</ul>
		</div>
	</div>


</nav>



<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">登入</h4>
			</div>
			<div class="modal-body">


				<div class="main">
					<h3>
						LoginMe,or <a class="nav-link" href="#" data-toggle="modal"
							data-target="#registerModal">RegisterMe</a>
					</h3>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<a
								href="https://accounts.google.com/o/oauth2/auth?scope=https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email&redirect_uri=http://localhost:8081/CHEWME2/googlelogin.do&response_type=code&state=/profile&client_id=237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
								<img
								src="<%=request.getContextPath()%>/image/google_sign_in.png"
								style="width: 350px; height: 70px;" />
							</a>
						</div>
					</div>
					<div class="login-or">
						<hr class="hr-or">
						<span class="span-or">or</span>
					</div>

					<form role="form"
						action="<%=request.getContextPath()%>/member/login.do"
						method="post" name="loginForm">
						<div class="form-group">
							<label>帳號:</label> <input type="text" class="form-control"
								id="userId" name="userId" value="${sessionScope.user}">
						</div>
						<div class="form-group">
							<a class="pull-right" data-toggle="modal"
								data-target="#gridSystemModal">忘記密碼?</a> <label>密碼:</label> <input
								type="password" class="form-control" id="password" name="pswd"
								value="${sessionScope.password}">
						</div>

<!-- 						<div class="g-recaptcha" -->
<!-- 							data-sitekey="6LfFkTYUAAAAAMK1w_K82sMGOy-BWkq-YBYMn5-J"></div> -->
						<div class="checkbox pull-right">
							<label> <input type="checkbox" name="rememberMe"
								class="recaptcha"
								<c:if test='${sessionScope.rememberMe==true}'>checked='checked'</c:if>
								value="true"> 記住密碼
							</label>
						</div>

						<div align="center">
							<button type="submit" class="btn btn btn-primary">登入</button>
						</div>
						<div>
							<small><Font color='red' size="-3">&nbsp;${ErrorMsgKey.LoginError}</Font></small>
						</div>
					</form>

					<div id="gridSystemModal" class="modal fade" tabindex="-1"
						role="dialog" aria-labelledby="gridModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="gridModalLabel">忘記密碼?</h4>
								</div>
								<form action="forgetPwd.do" method="post">
									<div class="modal-body">
										<div class="row">
											<div class="col-md-3 col-md-offset-3">
												<br>&nbsp;您的帳號：<input type="text" name="userId" /><br>
												<br> &nbsp;您的信箱：<input type="text" name="userMail" /><br>
											</div>
											<br />
										</div>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">登入</h4>
			</div>
			<div class="modal-body">


				<div class="main">
					<div class="row main">
						<div class="panel-heading">
							<div class="panel-title text-center">
								<h3>
									<a class="nav-link" href="#" data-toggle="modal"
										data-target="#loginModal">LoginMe</a>,or RegisterMe
								</h3>
							</div>
						</div>
						<div class="main-login main-center">
							<form class="form-horizontal" method="post" action="register.do"
								name="memform" id="memform" enctype="multipart/form-data">
								<img id="img"
									src="<%=request.getContextPath()%>/image/nophoto.png"
									class="img-responsive" width="300" height="300">
								<div class="form-group">
									<label class="btn btn-info" for="inputfile"> <input
										id="memPhoto" name="memPhoto" style="display: none;"
										type="file" value="${param.memPhoto}"> <i
										class="fa fa-folder-open-o"></i> 上傳圖片
									</label>
								</div>
								<div class="form-group">
									<label>帳號:</label> <input type="text" class="form-control"
										id="memberId" name="memberId" value="${param.memberId}"><span
										id="idsp" style="color: red;"></span>
								</div>
								<div class="form-group">
									<label>真實姓名:</label> <input type="text" class="form-control"
										id="memName" name="memName" value="${param.memName}"><span
										id="name" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>暱稱:</label> <input type="text" class="form-control"
										id="memNickN" name="memNickN" value="${param.memNickN}"><span
										id="nickn" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>密碼:</label> <input type="password" class="form-control"
										id="memPwd" name="memPwd" value="${param.memPwd}"><span
										id="pwd" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>生日:</label> <input type="date" class="form-control"
										id="memBirthday" name="memBirthday"
										value="${param.memBirthday}"><span id="bd"
										style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>信箱:</label> <input type="text" class="form-control"
										id="memMail" name="memMail" value="${param.memMail}"><span
										id="mail" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>地址:</label> <input type="text" class="form-control"
										id="memAddr" name="memAddr" value="${param.memAddr}"><span
										id="addr" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>電話:</label> <input type="text" class="form-control"
										id="memPhone" name="memPhone" value="${param.memPhone}"><span
										id="phone" style="color: red;"></span>
								</div>

								<div class="form-group">
									<label>自我介紹:</label>
									<textarea class="form-control" name="memIntr" id="memIntr"
										style="resize: none;">${param.memIntr}</textarea>
									<span id="intr" style="color: red;"></span>
								</div>

								<div align="center">
									<input type="hidden" name="action" value="insert">
									<button type="submit" class="btn btn btn-primary">送出</button>
									<button type="reset" class="btn btn btn-primary">重填</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script> --%>

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
	 		$.each(array,function(i,activity){
	 			var img ="data:image/png;base64,"+activity.act_photo;
	 			var div_out=$("<div></div>").addClass('cartrow');
	 		
	 			var cell1=$("<div></div>").css("float","left");
	 			var img =$('<img width=50px height=50px >').attr('src',img);
	 			
	 			
	 			var span1=$('<span></span>').text(activity.act_name)
	 			var button = $('<button id="opop"></button>').css('color','red').addClass('close glyphicon glyphicon-remove').attr({'type':'button','name':activity.actID});
	 			var span2=$('<span></span>').append(button)			
	 			var cell2=$("<div></div>").append([span1,span2])	
	 			var cell3=$("<div></div>").text("$5888")
	 			
	 			cell1.append(img);
	 			div_out.append([cell1,cell2,cell3]);
	 			fg.append(div_out);
	 			count++;
	 		})
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
		
		alert(id)
		
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

				readImage(this);
			});

			function readImage(input) {
				if (input.files && input.files[0]) {
					var file = input.files[0];
					var FR = new FileReader();
					FR.onload = function(e) {
						// e.target.result = base64 format picture
						$('#img ').attr("src", e.target.result);
						var url = e.target.result;

					};
					FR.readAsDataURL(input.files[0]);
				}
			} // 預覽圖片結束
		})		
</script>
