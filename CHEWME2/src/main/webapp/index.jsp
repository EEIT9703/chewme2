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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/BootSideMenu.css">

<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/slideshow.js">	</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="<%=request.getContextPath()%>/js/BootSideMenu.js"></script>


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
	<header><%@ include file="header.jsp"%></header>
	
		<!-- 	側邊廣告 -->
	<div id="abgne_float_ad" >
		<a href="http://cheng-sing.com/travel/2017/10/19/">
			<img src="image/barAD.gif" title="按我免費取票" />
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
<!-- 							<li style="list-style-type: none" class="prev">&lt;</li> -->
<!-- 							<li style="list-style-type: none" class="next">&gt;</li> -->
							<li style="list-style-type: none" class="prev" width=20px height=20px><img src=image/left.png width=14px height=14px></li>
							<li style="list-style-type: none" class="next"><img src=image/right.png width=14px height=14px></li>
						</ul>
					</div>
				</div>
				


<!-- 				<ul class="nav nav-tabs" id="myTab" role="tablist"> -->
<!-- 					<li class="nav-item"><a class="nav-link active" id="home-tab" -->
<!-- 						data-toggle="tab" href="#home" role="tab" aria-controls="home" -->
<!-- 						aria-expanded="true">Home</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile">有趣經驗</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile">關於我們</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" id="profile-tab" -->
<!-- 						data-toggle="tab" href="#profile" role="tab" -->
<!-- 						aria-controls="profile"></a></li> -->
<!-- 					<li class="nav-item dropdown"><a -->
<!-- 						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" -->
<!-- 						role="button" aria-haspopup="true" aria-expanded="false"> -->
<!-- 							Dropdown </a> -->
<!-- 						<div class="dropdown-menu"> -->
<!-- 							<a class="dropdown-item" id="dropdown1-tab" href="#dropdown1" -->
<!-- 								role="tab" data-toggle="tab" aria-controls="dropdown1">@fat</a> -->
<!-- 							<a class="dropdown-item" id="dropdown2-tab" href="#dropdown2" -->
<!-- 								role="tab" data-toggle="tab" aria-controls="dropdown2">@mdo</a> -->
<!-- 						</div></li> -->
					
<!-- 				</ul> -->

				<%-- 	<c:forEach var="activity" items=""> --%>
				<div><%@ include file="act/search.jsp"%></div>
				<div class="row">
<%-- 					<c:forEach var="x" varStatus="statusX" begin="1" end="3" step="1"> --%>
<!-- 						<div class="col-sm-6 col-md-4"> -->
<!-- 							<div class="thumbnail"> -->
<!-- 								<img src="..." alt="..."> -->
<!-- 								<div class="caption"> -->
<!-- 									<h3>Thumbnail label</h3> -->
<!-- 									<p>...</p> -->
<!-- 									<p> -->
<!-- 										<a href="#" class="btn btn-primary" role="button">Button</a> <a -->
<!-- 											href="#" class="btn btn-default" role="button">Button</a> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
				</div>
				
				
				<%-- </c:forEach>	 --%>

			</div>
		</div>
<!-- 		<div id="1">   -->
<!-- 		<span><input type="button" class="inputCar" value="測試加入購物車"></span> -->
<!-- 		<span><input type="button" class="report" value="檢舉"></span> -->
<!-- 		</div> -->
		
<!-- 		<ul class="dropdown-menu mega-dropdown-menu row"> -->
<!--             <li class="col-sm-3"> -->
<!--               <ul> -->
<!--                 <li class="dropdown-header">New in Stores</li> -->
<!--                 <div id="myCarousel" class="carousel slide" data-ride="carousel"> -->
<!--                   <div class="carousel-inner"> -->
<!--                     <div class="item active left"> -->
<!--                       <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 1"></a> -->
<!--                       <h4><small>Summer dress floral prints</small></h4> -->
<!--                       <button class="btn btn-primary" type="button">49,99 €</button> -->
<!--                       <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button> -->
<!--                     </div> -->
<!--                     End Item -->
<!--                     <div class="item next left"> -->
<!--                       <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 2"></a> -->
<!--                       <h4><small>Gold sandals with shiny touch</small></h4> -->
<!--                       <button class="btn btn-primary" type="button">9,99 €</button> -->
<!--                       <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button> -->
<!--                     </div> -->
<!--                     End Item -->
<!--                     <div class="item"> -->
<!--                       <a href="#"><img src="image/indexAD/101.jpg" class="img-responsive" alt="product 3"></a> -->
<!--                       <h4><small>Denin jacket stamped</small></h4> -->
<!--                       <button class="btn btn-primary" type="button">49,99 €</button> -->
<!--                       <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button> -->
<!--                     </div> -->
<!--                     End Item -->
<!--                   </div> -->
<!--                   End Carousel Inner -->
<!--                 </div> -->
<!--                 /.carousel -->
<!--                 <li class="divider"></li> -->
<!--                 <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li> -->
<!--               </ul> -->
<!--             </li> -->
            
<!--           </ul> -->

<div id="test" style="padding:0px">
<div><h1>瀏覽過的行程</h1></div>
<hr color="black" size="20" width="100%"  align="left">
<c:forEach var="ActivityVO" items="${list1}">
  <div class="user">
      <img src="data:image/png;base64,${ActivityVO.act_photo} alt="Esempio" class="img-thumbnail" width=200px height=150px><br>
      <a href="<%=request.getContextPath()%>/act/ActivitySearch?action=searchone&name=${ActivityVO.actID}"  target="_blank" class="navbar-link">${ActivityVO.act_name}</a>
  </div>
</c:forEach>
<!--   <div class="list-group"> -->

<!--       <a href="#item-1" class="list-group-item" data-toggle="collapse">Item 1</a> -->

<!--       <div class="list-group collapse" id="item-1"> -->
<!--           <a href="#" class="list-group-item">Item 1 di 1</a> -->
<!--           <a href="#" class="list-group-item">Item 2 di 1</a> -->
<!--           <a href="#item-1-1" class="list-group-item" data-toggle="collapse">Item 3 di 1</a> -->

<!--           <div class="list-group collapse" id="item-1-1"> -->
<!--               <a href="#" class="list-group-item">Item 1 di 1.3</a> -->
<!--               <a href="#" class="list-group-item">Item 2 di 1.3</a> -->
<!--               <a href="#" class="list-group-item">Item 3 di 1.3</a> -->
<!--           </div> -->

<!--       </div> -->

<!--       <a href="#item-2" class="list-group-item" data-toggle="collapse">Item 2</a> -->

<!--       <div class="list-group collapse" id="item-2"> -->
<!--           <a href="#" class="list-group-item">Item 1 di 2</a> -->
<!--           <a href="#" class="list-group-item">Item 2 di 2</a> -->
<!--           <a href="#" class="list-group-item">Item 3 di 2</a> -->
<!--       </div> -->

<!--       <a href="#item-3" class="list-group-item" data-toggle="collapse">Item 3</a> -->

<!--       <div class="list-group collapse" id="item-3"> -->
<!--           <a href="#" class="list-group-item">Item 1 di 3</a> -->
<!--           <a href="#" class="list-group-item">Item 2 di 3</a> -->
<!--           <a href="#item-3-1" class="list-group-item" data-toggle="collapse">Item 3 di 3</a> -->

<!--           <div class="list-group collapse" id="item-3-1"> -->
<!--               <a href="#" class="list-group-item">Item 1 di 3.3</a> -->
<!--               <a href="#" class="list-group-item">Item 2 di 3.3</a> -->
<!--               <a href="#" class="list-group-item">Item 3 di 3.3</a> -->
<!--           </div> -->

<!--       </div> -->

<!--       <a href="#item-4" class="list-group-item" data-toggle="collapse">Item 4</a> -->

<!--       <div class="list-group collapse" id="item-4"> -->
<!--           <a href="#" class="list-group-item">Item 1 di 4</a> -->
<!--           <a href="#" class="list-group-item">Item 2 di 4</a> -->
<!--           <a href="#" class="list-group-item">Item 3 di 4</a> -->
<!--       </div> -->

<!--   </div> -->

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
		top: $(document).height()-_diffY,
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

$(function(){

	$('#test').BootSideMenu({

		  // 'left' or 'right'
		  side: "left",

		  // animation speed
		  duration: 500,

		  // restore last menu status on page refresh
		  remember: false,

		  // auto close
		  autoClose: true,

		  // push the whole page
		  pushBody: true,

		  // close on click
		  closeOnClick: true,

		  // width
		  width: "15%"
		  
		});



})
</script>
</body>

</html>