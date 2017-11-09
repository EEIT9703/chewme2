<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.activity.model.*"%>

<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">


<!-- Font Awesome  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"></link>

</head>

<style>
.img {
  position: relative;
  background-position: center;
  background-repeat: no-repeat;
  background-size: contain;
  width: 200px;
  height: 200px;
  background-color: #353535;

  padding: 0;
  margin: 10px;
  border-radius: 3px;
}

.item-desc {
            background: #E8E8E8 none repeat scroll 0% 0%;
            box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
            padding: 20px;
            margin-top: 22px;
            overflow: auto;
        }

.nav-tabs {
            border-bottom: 2px solid #DDD;
        }
        
        .nav-tabs > li.active > a,
        .nav-tabs > li.active > a:focus,
        .nav-tabs > li.active > a:hover {
            border-width: 0px;
        }
        
        .nav-tabs > li > a {
            border: none;
            color: #666;
        }
        
        .nav-tabs > li.active > a,
        .nav-tabs > li > a:hover {
            border: none;
            color: #4285F4 !important;
            background: transparent;
        }
        
        .nav-tabs > li > a::after {
            content: "";
            background: #4285F4;
            height: 2px;
            position: absolute;
            width: 100%;
            left: 0px;
            bottom: -1px;
            transition: all 250ms ease 0s;
            transform: scale(0);
        }
        
        .nav-tabs > li.active > a::after,
        .nav-tabs > li:hover > a::after {
            transform: scale(1);
        }
        
        .tabnav > li > a::after {
            background: #21527d none repeat scroll 0% 0%;
            color: #fff;
        }
        
        .tab-pane {
            padding: 15px 0;
        }
        
        .tab-content {
            padding: 20px
        }
        
        .card {
            background: #FFF none repeat scroll 0% 0%;
            box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3);
            margin-bottom: 30px;
        }

</style>

<body>
<header><%@ include file="../header.jsp"%></header>

	
<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />
<input type="hidden" value="${actVO.actID}" >
<input type="hidden" value="${activityVO.actID}" >
	<div class="container">
		<div class="jumbotron">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h1 style="text-align: center;">${activityVO.act_name}</h1>
						<!-- 預覽內容 -->
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div style="height:40px"></div>
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="data:image/png;base64,${activityVO.act_photo}" id="" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="data:image/png;base64,${activityVO.act_photo}" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="data:image/png;base64,${activityVO.act_photo}" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" style="color:red;"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" style="color:red;"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="heading">
                    <h2>行程介紹</h2>
                </div>
                <div class="item-desc">
                    <p class="text-muted">${activityVO.act_news}</p>
                </div>
            </div>
            <div style="height:40px"></div>
            <form class="col-md-6"  role="form" >               
               
                <div class="date-time row">
                    <div class="form-group col-md-6">
                 <div class="form-group">
                    <label for="destination">成團人數:${activityVO.act_groups}</label>
                </div>
              
                <div class="form-group">
                    <label for="destination">參與人數:${activityVO.act_current}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">旅程時間:${activityVO.BDate}-${actVO.EDate}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">價格:${activityVO.act_price}</label>
                </div>
                    </div>
                    </div>
                <div class="btn-group btn-group-justified">
                    <a href="#" class="btn btn-default">參加行程</a>
                    <a href="#" class="btn btn-default"><i class="fa fa-heart-o" aria-hidden="true" style="color:red;"></i> 加入我的收藏</a>
                    <a href="#" class="btn btn-default">檢舉行程</a>
                </div>               

                <div class="card" style="margin-top:20px;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">景點</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">餐廳</a></li>
                        <li role="presentation"><a href="#S" aria-controls="S" role="tab" data-toggle="tab">住宿</a></li>                 
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">景點</div>
                        <div role="tabpanel" class="tab-pane" id="profile">住宿</div>
                        <div role="tabpanel" class="tab-pane" id="S">餐廳</div>       
                    </div>
                </div>
                <!-- Tabs --->
                                        
            </form>
        </div>
    </div>
    <!-- /.container -->
						
					<div id="sch">
					<img id="${activityVO.actID}"  src='data:image/png;base64,'+${activityVO.sch_photo} class="img-responsive"></div>

					
				</div>
			</div>
		</div>
	</div>

	<script>
		
	</script>

	
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	
	<!-- SweetAlert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

	
	<script src="../act/js/showAct.js"></script>
</body>
<script type="text/javascript">



</script>
</html>