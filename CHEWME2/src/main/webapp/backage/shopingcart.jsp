<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  	<link href="<%=request.getContextPath()%>/css/morrisjs/morris.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/dist/css/sb-admin-2.css" rel="stylesheet">
  	
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/advanced.css"/>
  	<style>
  	body { font-family:'Roboto';}
h1 { color:#fff;}
  	
ul, ol {
    margin-top: 0;
    margin-bottom: 10px;
}
ul.list___3xuJM {
    list-style-type: none;
    padding: 0;
}
.img-circle {
    border-radius: 50%;
    border-top-left-radius: 50%;
    border-top-right-radius: 50%;
    border-bottom-right-radius: 50%;
    border-bottom-left-radius: 50%;
}

.user-photo___7yyZ6 {
    width: 98px;
    height: 98px;
    background-repeat: no-repeat;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-size: cover;
    background-position: 50%;
    background-position-x: 50%;
    background-position-y: center;
}

.myPhoto___3FFnp {
    background-color: #006c8f;
    padding: 20px 0 16px;
    padding-top: 20px;
    padding-right: 0px;
    padding-bottom: 16px;
    padding-left: 0px;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w {
    background-color: #fff;
}

.sidebar___2Ft5w {
    width: 340px;
    min-height: 600px;
    height: inherit;
    border-right: 1px solid #a4a3a4;
    -webkit-box-shadow: 2px 5px 10px #909090;
    -moz-box-shadow: 2px 5px 10px #909090;
    box-shadow: 2px 5px 10px #909090;
}

.sidebar___2Ft6w {

    width: 1150px;
    min-height: 600px;
    height: inherit;
    border-right: 1px solid #a4a3a4;
    -webkit-box-shadow: 2px 5px 10px #909090;
    -moz-box-shadow: 2px 5px 10px #909090;
    box-shadow: 2px 5px 10px #909090;
  
}

.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze {
    padding: 16px 0 16px 26px;
    font-size: 16px;
    color: #3d3a39;
    position: relative;
    height: 50px;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze .types___3m74H {
    margin: 0 0 0 8px;
}


.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze {
    padding: 16px 0 16px 26px;
    font-size: 16px;
    color: #3d3a39;
    position: relative;
    height: 50px;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze.selected___2Hy4k, .sidebar___2Ft5w ul.list___3xuJM li.item___2dDze:hover {
    background-color: #c44980;
    color: #fff;
    cursor: pointer;
}
.myPhoto___3FFnp .shortText___3j1uo {
    display: inline-block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 185px;
    width: auto;
    color: #FFFFFF;
    
}
.btnShop{
margin-top:150px;
margin-left:500px;
}



</style>


</head>


<body>
	<header> <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand " href="#"><img src="<%=request.getContextPath()%>/image/letter-c.png" width="30" height="30" alt=""></a>	
		</div>
		<div class="navbar-header">
		<a class="navbar-brand " href="#">CHEWME</a>
		</div>
		<ul class="nav navbar-nav" style="margin-left:50px" >
			<li><a href="#">Home</a></li>
			<li><a href="#">揪人玩</a></li>
			<li><a href="#">創行程</a></li>
			<li><a href="#">創社團</a></li>

		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-log-in"></span> 登入</a></li>
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-registration-mark"></span> 註冊</a></li>
		</ul>
	</div>
	</nav> <nav class="navbar navbar-expand-lg">
	<div class="container-fluid"></div>

	</nav> </header>
	<article>
  	<div>
	<div class="row clearfix">
		<div class="col-md-3 column">
			<div class=sidebar___2Ft5w>
				<div class="myPhoto___3FFnp">
			   	<div style="background-image:url('<%=request.getContextPath()%>/image/101.jpg')" class="img-circle user-photo___7yyZ6"></div>	
				<p class="shortText___3j1uo" title="黃彥坤">黃彥坤</p>
				</div>
				<div>
					<ul class="list___3xuJM">
						<li class="item___2dDze  selected___2Hy4k" id="collection">
						
						<span><img src="<%=request.getContextPath()%>/image/car.gif" width=10px height=10px></span>
						<span class="types___3m74H">購物車清單</span>
						</li>
						<li class="item___2dDze" id="Order">
						<span><img src="<%=request.getContextPath()%>/image/car.gif" width=10px height=10px></span>
						<span class="types___3m74H">我的訂單</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-9 column">
			<div class="row clearfix">
				
				<div id="container" class=sidebar___2Ft6w>
					
					<div>
					
					
					</div>
					
			
				</div>
		
  			</div>
			
		</div>
	
</div>
</div>	
</article>
  	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.wrecker.js"></script>	
 <script>
//  var cell4 ='<button type="button" class="btnShop">前往課程庫購買課程</button>';

</script>
  	

</body>
</html>