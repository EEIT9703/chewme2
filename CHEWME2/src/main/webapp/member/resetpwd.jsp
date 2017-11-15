<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.activity.model.*"%>
<%
ActService ser=new ActService();
if(session.getAttribute("record")!=null){
Set<Integer> a=(Set<Integer>)session.getAttribute("record");
ArrayList<ActivityVO> lis = new ArrayList();

Iterator<Integer> iterator=a.iterator();
while(iterator.hasNext()){
	ActivityVO activityVO=ser.getOneAct(iterator.next());
	lis.add(activityVO);
}
pageContext.setAttribute("list1", lis);
}
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>resetMe</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/BootSideMenu.css">

<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/slideshow.js">	</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=request.getContextPath()%>/js/BootSideMenu.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>

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

#abgne_float_ad {
	display: none;
	position: absolute;
}
#abgne_float_ad img {
	border: none;
}

</style>
	
</head>
<body>
	<header><%@ include file="/header.jsp"%></header>
	<div align="center">
			<button type="submit" class="btn btn btn-primary" data-toggle="modal"
				data-target="#resetModal">點此重設密碼</button>
	</div>
	<div class="modal fade" id="resetModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">重設密碼</h4>
				</div>
				<form action="resetPassword.do" method="post">
					<div class="modal-body">
						帳號：<input type="text" name="userName" value="${param.userName}"
							readonly="readonly" /><br /> 新密碼：<input type="password"
							name="newPassword" /><br />
						確認新密碼：<input type="password" name="newPassword2" /><br />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">關閉
						</button>
						<button type="submit" class="btn btn-primary">提交更改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
			<!-- 	側邊廣告 -->
	<div id="abgne_float_ad" >
		<a href="http://cheng-sing.com/travel/2017/10/19/">
			<img src="<%=request.getContextPath()%>/image/barAD.gif" title="按我免費取票" width="125px"/>
		</a>
	</div>
	
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
							<li style="list-style-type: none" class="prev" width=20px height=20px><img src=image/left.png width=14px height=14px></li>
							<li style="list-style-type: none" class="next"><img src=image/right.png width=14px height=14px></li>
						</ul>
					</div>
				</div>
				<div><%@ include file="/act/search.jsp"%></div>
				<div class="row">
				</div>
			</div>
		</div>
	</article>
	
<script>
$(window).load(function(){
	var $win = $(window),
		$ad = $('#abgne_float_ad').css('opacity', 0).show(),	// 讓廣告區塊變透明且顯示出來
		_width = $ad.width(),
		_height = $ad.height(),
		_diffY = 1250, _diffX = 20,	// 距離右及下方邊距
		_moveSpeed = 800;	// 移動的速度
 
	// 先把 #abgne_float_ad 移動到定點
	$ad.css({
		top: $(document).height()*0.7-_diffY,
		left: $win.width() - _width - _diffX,
		opacity: 1
	});
 
	// 幫網頁加上 scroll 及 resize 事件
	$win.bind('scroll resize', function(){
		var $this = $(this);
 
		// 控制 #abgne_float_ad 的移動
		$ad.stop().animate({
			top: $this.scrollTop() + $this.height() - _height - _diffY,
			left: $this.scrollLeft() + $this.width() - _width - _diffX
		}, _moveSpeed);
	}).scroll();	// 觸發一次 scroll()
});

</script>	
</body>
</html>