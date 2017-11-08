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

<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<!-- Summernote  -->
<link href="<%=request.getContextPath()%>/css/summernote.css" rel="stylesheet">
<!-- Font Awesome  -->
<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- SweetAlert  -->
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>
<link href="<%=request.getContextPath()%>/css/sweetalert2.min.css" rel="stylesheet" type="text/css">



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
   <input type="hidden" value="${actVO.actID}">
	<div class="container">
		<div class="jumbotron">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<h1 style="text-align: center;">${actVO.act_name}</h1>
						<!-- 預覽內容 -->
    <div class="container">
        <div class="row">
            <div class="col-md-6">
               
                <div class="heading">
                    <h2>行程介紹</h2>
                </div>
                <div class="item-desc">
                    <p class="text-muted">${actVO.act_news}</p>
                </div>
            </div>
            <div style="height:40px"></div>
            <form class="col-md-6" method="post" role="form" enctype="multipart/form-data">               
                <div class="date-time row">

                    <div class="form-group col-md-6">
                 <div class="form-group">
                    <label for="destination">成團人數:${actVO.act_groups}</label>
                </div>
              
                <div class="form-group">
                    <label for="destination">參與人數:${actVO.act_current}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">旅程時間:${actVO.BDate}-${activityVO.EDate}</label>
                </div>
                
                <div class="form-group">
                    <label for="destination">價格:${actVO.act_price}</label>
                </div>
                    </div>
                    </div>
                <div class="btn-group btn-group-justified" >
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

                <textarea id="summernote" name="act_news" >請輸入行程</textarea>
                
                
                <div class="img"><img  id="img" src="" class="img-responsive"></div>
						<div class="form-group">					    
							<label class="btn btn-info" for="upload"> 
							<input id="upload" name="upload" style="display: none;" type="file">
							<i class="fa fa-folder-open-o"></i> 上傳圖片								
							</label>
						</div>
                        <div class="form-group" style="float:right;"></div>
						<button type="submit" class="btn btn-lg btn-primary" id="submit">送出</button>
						<input type="hidden" value="${actVO.actID}" name="actID">
						<input type="hidden" name="action" value="Final">          
            </form>
        </div>
    </div>
    <!-- /.container -->
       </div>
			</div>
		</div>
	</div>

	
	
	
    <script src="<%=request.getContextPath()%>/js/summernote.js"></script>	
	<script src="<%=request.getContextPath()%>/act/js/creatAct2.js"></script>
</body>
</html>