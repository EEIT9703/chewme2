<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.min.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.min.css">
<link rel="stylesheet" href="/CHEWME2/css/vertical-timeline.css">
<script src="/CHEWME2/js/jquery-3.2.1.min.js"></script>
<script src="/CHEWME2/js/jquery-ui.min.js"></script>
<script src="/CHEWME2/js/bootstrap.min.js"></script>
<script src="/CHEWME2/js/vertical-timeline.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">

    <!-- Page header -->
    <div class="page-header">
        <h2>Timeline <small>using Bootstrap's <code>.panel</code>.</small></h2>
    </div>
    <!-- /Page header -->

    <!-- Timeline -->
    <div class="timeline">
    
        <!-- Line component -->
        <div class="line text-muted"></div>

        <!-- Separator -->
        <div class="separator text-muted">
            <time>09:00</time>
        </div>
        <!-- /Separator -->
    
        <!-- Panel -->
        <article class="panel panel-danger panel-outline">
    
            <!-- Icon -->
            <div class="panel-heading icon">
                <i class="glyphicon glyphicon-heart"></i>
            </div>
            <!-- /Icon -->
    
            <!-- Body -->
            <div class="panel-body">
                <strong>景點名稱</strong>
            </div>
            <!-- /Body -->
    
        </article>
        <!-- /Panel -->
        
         <!-- Panel -->
        <article class="panel panel-info panel-outline">
    
            <!-- Icon -->
            <div class="panel-heading icon">
                <i class="glyphicon glyphicon-info-sign"></i>
            </div>
            <!-- /Icon -->
    
            <!-- Body -->
            <div class="panel-body">
                <p>電話</p>
                <p>地址</p>
                <p>簡介</p>
            </div>
            <!-- /Body -->
    
        </article>
        <!-- /Panel -->
    
        <!-- Panel -->
        <article class="panel panel-default panel-outline">
    
            <!-- Icon -->
            <div class="panel-heading icon">
                <i class="glyphicon glyphicon-picture"></i>
            </div>
            <!-- /Icon -->
    
            <!-- Body -->
            <div class="panel-body">
                <img class="img-responsive img-rounded" src="//placehold.it/350x150" />
            </div>
            <!-- /Body -->
    
        </article>
        <!-- /Panel -->
    
       
    
    </div>
    <!-- /Timeline -->

</div>


</body>
</html>