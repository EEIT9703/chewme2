﻿
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
				<li><a href="/CHEWME2/index.jsp">Home</a></li>
				<li><a href="/CHEWME2/act/createAct.jsp">創行程</a></li>
				<li><a href="/CHEWME2/club/createClub.do">創社團</a></li>
				<li><a href="/CHEWME2/club/findClub.do">找社團</a></li>
				<li><a href="/CHEWME2/club/findClub.do">我的社團</a></li>
				<li><a href="/CHEWME2/club/findClub.do">社團管理員</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="nav-shopping-cart"><img
					src="<%=request.getContextPath()%>/image/car.gif" width=50px
					height=50px /><span class="aaa" data-reactid="65">2</span></li>
				<li><c:if test="${  !empty LoginOK }"><c:if test="${  !empty Manager }">
						<a class="nav-link" href="<%=request.getContextPath()%>/backage.jsp"><span
							class="glyphicon glyphicon-log-in"></span>維護 </a>
					</c:if></c:if></li>
				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="<%=request.getContextPath()%>/member/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span>登入 </a>
					</c:if></li>

				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link" href="<%=request.getContextPath()%>/member/logout.jsp"><span
							class="glyphicon glyphicon-log-in"></span>登出 </a>
					</c:if></li>

				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="<%=request.getContextPath()%>/member/login.jsp"><span
							class="glyphicon glyphicon-log-in"></span>註冊 </a>
					</c:if></li>
				<li><c:if test="${ ! empty LoginOK }">
						<a>${LoginOK.memberId }</a>
<%-- 							<img src='${LoginOK.memPhoto}'width=100px height=100px> --%>
					</c:if></li>
			</ul>
		</div>
	</div>


</nav>


