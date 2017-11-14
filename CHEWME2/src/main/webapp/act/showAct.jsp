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

<link href="<%=request.getContextPath()%>/css/bootstrap355.css" rel="stylesheet">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/summernote.css" rel="stylesheet">

<!-- Font Awesome  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css"></link>

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
					<h1 style="text-align: center;">${actVO.act_name}</h1>
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
            </div>
            
            <div class="date-time row">
                    <div class="form-group col-md-6">
                 <div style="height:40px"></div>
                  <div class="btn-group btn-group-justified">
                    <a href="#" class="btn btn-default">參加行程</a>
                    <a href="#" class="btn btn-default"><i class="fa fa-heart-o" aria-hidden="true" style="color:red;"></i> 加入我的收藏</a>
                    <a href="#" class="btn btn-default">檢舉行程</a>
                </div>               

                <div class="card" style="margin-top:20px;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">目前人數</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">旅程時間</a></li>
                        <li role="presentation"><a href="#S" aria-controls="S" role="tab" data-toggle="tab">價格</a></li>                 
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">成團人數:${actVO.act_groups}人<br>參與人數:${actVO.act_current}</div>
                        <div role="tabpanel" class="tab-pane" id="profile">出發日期:${actVO.BDate}<br>回程日期:${activityVO.EDate}</div>
                        <div role="tabpanel" class="tab-pane" id="S">一人費用:${actVO.act_price}元</div>       
                    </div>
                    </div>                    
                    </div>              
                </div>
                <!-- Tabs --->          
        </div>
        <div class="heading">
                    <h2>行程介紹</h2>
                </div>
                <div class="item-desc col-md-12">
                    <p class="text-muted">${activityVO.act_news}</p>
                </div>
    </div>
    <!-- /.container -->
						
					<div id="sch">
					<img id="${activityVO.actID}"  src="" class="img-responsive"></div>

					
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