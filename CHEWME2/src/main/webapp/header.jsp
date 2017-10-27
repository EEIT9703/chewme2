
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
				<li><a href="#">Home</a></li>
				<li><a href="#">創行程</a></li>
				<li><a href="club/createClub.do">創社團</a></li>
				<li><a href="club/findClub.do">找社團</a></li>

			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="nav-shopping-cart"><img
					src="<%=request.getContextPath()%>/image/car.gif" width=50px
					height=50px /><span class="aaa" data-reactid="65">2</span></li>
				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="<c:url value='/member/login.jsp' />"><span
							class="glyphicon glyphicon-log-in"></span>登入 </a>
					</c:if></li>

				<li><c:if test="${ ! empty LoginOK }">
						<a class="nav-link" href="<c:url value='/member/logout.jsp' />"><span
							class="glyphicon glyphicon-log-in"></span>登出 </a>
					</c:if></li>

				<li><c:if test="${  empty LoginOK }">
						<a class="nav-link" href="<c:url value='/member/login.jsp' />"><span
							class="glyphicon glyphicon-log-in"></span>註冊 </a>
					</c:if></li>
				<li><c:if test="${ ! empty LoginOK }">
						<a><span class="glyphicon glyphicon-log-in">${LoginOK.memberId }</span></a>
<%-- 							<img src='${LoginOK.memPhoto}'width=100px height=100px> --%>
					</c:if></li>
			</ul>
		</div>
	</div>


</nav>


