<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/com-resource/css/scrollbar2.css"/>
	
<nav id="nav-friendlist" class="navbar navbar-default sidebar" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">friend1<span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">friend2 <span class="caret"></span><span
						style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="{{URL::to('createusuario')}}">friend1</a></li>
						<li><a href="#">friend2</a></li>
						<li><a href="#">friend3</a></li>
						<li class="divider"></li>
						<li><a href="#">friend4</a></li>
						<li class="divider"></li>
						<li><a href="#">friend5</a></li>
					</ul></li>
				<li><a href="#">friend3<span style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
				<li><a href="#">friend4<span style="font-size: 16px;"
						class="pull-right hidden-xs showopacity glyphicon glyphicon-tags"></span></a></li>

			</ul>
		</div>
	</div>
</nav>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/chatroom.css">
	
<script src="<%=request.getContextPath()%>/js/chatroom.js"></script>