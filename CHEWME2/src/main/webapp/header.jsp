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
<style>
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

</style>

<nav class="navbar navbar-default navbar-static-top">
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
				<li><a href="/CHEWME2/index.jsp"><img src="<%=request.getContextPath()%>/image/gohome.png" width=40px height=30px >Home</a></li>
				<li ><a class="dropdown-toggle" data-toggle="dropdown" href="#"><img src="<%=request.getContextPath()%>/image/travel.png" width=40px height=30px >揪旅行<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/CHEWME2/actEditor/editorScuedule.jsp">創行程</a></li>
      					<li><a href="/CHEWME2/act/createAct2.jsp">揪新團</a></li>
					</ul>
				</li>
				<li><a href="/CHEWME2/club/createClub.do"><img src="<%=request.getContextPath()%>/image/finclub.png" width=40px height=30px >創社團</a></li>
				<li><a href="/CHEWME2/club/findClub.do"><img src="<%=request.getContextPath()%>/image/createclub.png" width=40px height=30px >找社團</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
			
			
			
				<li class="nav-shopping-cart"><div class="dropdown"><img id="drop" data-toggle="dropdown" 
				src="<%=request.getContextPath()%>/image/car.gif" width=30px
					height=30px /><span class="aaa" data-reactid="65">${all}</span>
						<ul style="width: 465px;" class="dropdown-menu pull-right  role="menu"
							aria-labelledby="drop">
<!-- 						<ul class="dropdown-menu" style="width: 465px;"> -->
<!-- 											<li class="dropdown-header" -->
<!-- 												style="border-bottom: 1px solid #aaaaaa;"><h3>4444</h3></li> -->
							
					<div class="cartrows"> 
								<div width=60px height=60px>
								<div style="text-align:right"><button  type="button" class="close glyphicon glyphicon-remove"></button></div>
								<div style="float:left"><img src='image/101.jpg' width=50px height=50px></div>
<!-- 								<div style="float:left">							 -->
<!-- 										<div> -->
<!-- 											<a role="menuitem" tabindex="-1" href="#"> -->
											
											
											<div>							
												<span style="text-align:left">九份一u日遊</span>
												<span style="text-align:left">2888$</span>											
											</div>	
											
<!-- 										</a> -->
<!-- 										</div> -->
									
<!-- 								</div> -->

									
								</div>
											
								<div height=60px>
								<div style="text-align:right"><button  type="button" class="close glyphicon glyphicon-remove"></button></div>
								<div style="float:left"><img src='image/101.jpg' width=50px height=50px></div>
<!-- 								<div style="float:left">							 -->
<!-- 										<div> -->
<!-- 											<a role="menuitem" tabindex="-1" href="#"> -->
											
											
											<div>							
												<span style="text-align:left">九份一u日遊</span>
												<span style="text-align:left">2888$</span>											
											</div>	
											
<!-- 										</a> -->
<!-- 										</div> -->
									
<!-- 								</div> -->

									
								</div>
								
								<div  height=60px>
								<div style="text-align:right"><button  type="button" class="close glyphicon glyphicon-remove"></button></div>
								<div style="float:left"><img src='image/101.jpg' width=50px height=50px></div>
<!-- 								<div style="float:left">							 -->
<!-- 										<div> -->
<!-- 											<a role="menuitem" tabindex="-1" href="#"> -->
											
											
											<div>							
												<span style="text-align:left">九份一u日遊</span>
												<span style="text-align:left">2888$</span>											
											</div>	
											
<!-- 										</a> -->
<!-- 										</div> -->
									
<!-- 								</div> -->

									
								</div>
									

									</div>
	
<!-- 					<li role="presentation" class="divider"></li> -->
<!-- 					<li role="presentation" class=""><input type="button" value="前往結帳" class="btn btn-primary" style="text-align:center"></li>	 -->
						
				
				
						
						</ul>
					</div>
					
					</li>
					
				<li><c:if test="${  !empty SysManager }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/backage/backage.jsp"><span
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
							class="glyphicon glyphicon-log-in"></span>註冊 </a>
					</c:if></li>
				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/member/mempage.jsp" a>${LoginOK.memberId }</a>
						<%-- 							<img src='${LoginOK.memPhoto}'width=100px height=100px> --%>
					</c:if></li>
			</ul>
			
			
		
			
			
		</div>
	</div>


</nav>


