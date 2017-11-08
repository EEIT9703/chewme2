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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- 置頂  -->
<link href="<%=request.getContextPath()%>/css/navbar-fixed-top.css" rel="stylesheet">

<style>

/*  shopping car start  */
 .cartrows { 
 	overflow-x: hide; 
 	overflow: auto; 
 	max-height: 40vh; 
 	width:298px 
 } 
 .cartrow { 
 	width: 100%; 
 	padding: 20px; 
 	margin: auto; 
 } 
  .close {  
  	text-align:right;  
  }
  
  .goshop{
  	text-align:center;  
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
	height:15px;
	
	}
.nav-shopping-cart {
	position: relative;
	display: inline-block;
	margin-top:8px;
	margin-right:25px;
}
	
	

.navbar-default {
    background-color: #f8f8f8;
    border-color: #e7e7e7;
    margin-top:0px
  	
  	}
.btn-primary {
    color: #fff;
    background-color: #286090;
    border-color: #204d74;
    width:150px;
    height:30px;
}

body { padding-bottom: 100px; }

/* header不要加 50px 以上body裡面的內容為bootstrap網站裡面的解決方法*/

</style>

<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div>
			<div>
				<a class="navbar-brand " href="#"><img
					src="<%=request.getContextPath()%>/image/letter-c.png" width="30"
					height="30" alt=""></a>
			</div>
			<div class="navbar-header">
				<a class="navbar-brand " href="#">CHEWME</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar-right"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
		</div>
		<div id="navbar-right" class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style="margin-left: 50px">
				<li><a href="<%=request.getContextPath() %>/index.jsp"><img src="<%=request.getContextPath()%>/image/gohome.png" width=40px height=30px >Home</a></li>
				<li ><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/image/travel.png" width=40px height=30px >揪旅行<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/actEditor/editorScuedule.jsp">創行程</a></li>
      					<li><a href="<%=request.getContextPath() %>/act/actServlet?action=createAct">揪新團</a></li>
					</ul>
				</li>
				<li ><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/image/finclub.png" width=40px height=30px >社團<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath() %>/club/createClub.do">創社團</a></li>
      					<li><a href="<%=request.getContextPath() %>/club/findClub.do">揪社團</a></li>
					</ul>
				</li>				
				
				<li><a href="<%=request.getContextPath() %>/attractions/listAll.jsp"><img src="<%=request.getContextPath()%>/image/findattraction.png" width=40px height=30px >找景點</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
			
		<c:choose>
			<c:when test="${!empty LoginOK}">
				<li class="nav-shopping-cart"><div class="dropdown"><img id="drop" data-toggle="dropdown" 
				src="<%=request.getContextPath()%>/image/car.gif" width=30px
					height=30px /><span class="aaa" data-reactid="65"></span>
						<ul style="width: 300px;" class="dropdown-menu pull-right  role="menu"
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
					<li role="presentation" class="goshop"><a href="<%= request.getContextPath() %>/backage/collection.jsp"><input type="button" value="前往結帳" class="btn btn-primary" style="text-align:center"></a></li>		
						</ul>
					</div>				
					</li>
				</c:when>
					<c:otherwise>
				<li class="nav-shopping-cart"><div class="dropdown"><img id="drop" data-toggle="dropdown" 
				src="<%=request.getContextPath()%>/image/car.gif" width=30px
					height=30px />
								</c:otherwise>
					
			</c:choose>
			
				<li><c:if test="${  !empty SysManager && ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/backage/backage_index.jsp"><span
							class="glyphicon glyphicon-log-in"></span>維護 </a>
					</c:if></li>
				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span>登入 </a>
					</c:if></li>

				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/logout.jsp"><span
							class="glyphicon glyphicon-log-in"></span>登出 </a>
					</c:if></li>

				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/register.jsp"><span
							class="glyphicon glyphicon-user"></span>註冊 </a>
					</c:if></li>
				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/mempage.jsp" a>${LoginOK.memName }</a>
						<%-- 							<img src='${LoginOK.memPhoto}'width=100px height=100px> --%>
					</c:if></li>
			</ul>
			
			
		
			
			
		</div>
	</div>


</nav>
<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script> --%>

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
	 			var div_out=$("<div></div>").addClass('cartrow');
	 		
	 			var cell1=$("<div></div>").css("float","left");
	 			var img =$('<img>').attr({'src':'<%=request.getContextPath() %>/image/55.jpg','width':'50px','height':'50px'});
	 			
	 			
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
	

	
	$('.inputCar').click(function(){
		 var id = $(this).parents('div').attr('id');
		 $.getJSON('<%=request.getContextPath()%>/ShoppingCar?action=inputCar',{'ID':id},result);
		
			
	})	
	function result(array){	
		$.each(array,function(i,result){				
		if(result.existColl=="已加入購物車"){
				alert(result.existColl)		
		}
		else {		
			alert(result.inputOK)
			loadActivity();
		}
		})	
		
	}
	
	
	
})

</script>
