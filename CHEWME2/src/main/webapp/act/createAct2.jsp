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

<body>
<%-- 	<header><%@ include file="../header.jsp"%></header> --%>

	
	<jsp:useBean id="actSvc" scope="page" class="com.iii.eeit9703.activity.model.ActService" />

	<div class="container">
		<div class="jumbotron">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h1>${activityVO.act_name}</h1>
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
                                    <img class="slide-image" src="" id="" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="" alt="">
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
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quasi eum cupiditate alias, accusantium necessitatibus sequi, labore soluta iste, repellendus ratione a! Fugiat, dolore placeat est, non iste ab repudiandae assumenda.</p>
                </div>
            </div>
            <div style="height:40px"></div>
            <form class="col-md-6" method="post" role="form" enctype="multipart/form-data">               
               <a type="hidden">${activityVO.actID}</a> 
                <div class="date-time row">
                    <!-- <div class="co-md-12">-->
                    <div class="form-group col-md-6">
                 <div class="form-group">
                    <label for="destination">成團人數:${activityVO.act_groups}</label>
                </div>
              
                <div class="form-group">
                    <label for="destination">參與人數:${activityVO.act_current}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">旅程時間:${activityVO.BDate}-${activityVO.EDate}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">價格:${activityVO.act_price}</label>
                </div>
                    </div>
                    </div>
                <div class="btn-group btn-group-justified">
                    <a href="#" class="btn btn-default">參加行程</a>
                    <a href="#" class="btn btn-default"><i class="fa fa-heart-o" aria-hidden="true" style="color:red;"></i> 加入我的收藏</a>
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
                <div id="summernote" name="act_news"><p>行程特點</p></div>
                
						<div class="form-group">
							<label class="btn btn-info" for="upload"> 
							<input id="upload" name="upload" style="display: none;" type="file">
							<img id="blah" src="#" alt="" />
							<i class="fa fa-folder-open-o"></i> 上傳圖片
							</label>
							<font color="red" size="-1"></font>
						</div>
                        <div class="form-group"></div>
						<button type="submit" class="btn btn-lg btn-primary" id="submit">送出</button>
						<input type="hidden" value="${activityVO.actID}" name="actID">
						<input type="hidden" name="action" value="Final">          
            </form>
        </div>
    </div>
    <!-- /.container -->
						
						
						
						
						
						


						<div>
						
	<%-- 			<jsp:include page="/CHEWME2/actEditor/schedule.jsp" /> --%>
 	<%-- 						<%@ include file="../actEditor/schedule.jsp"%> --%>
						</div>
						
						


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

	
	<script src="../act/js/creatAct2.js"></script>
</body>
</html>