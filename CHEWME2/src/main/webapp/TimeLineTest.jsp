<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="css/timeline.css">


<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
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
            <time>26. 3. 2015</time>
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
                <strong>Someone</strong> favourited your photo.
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
    
        <!-- Panel -->
        <article class="panel panel-primary">
    
            <!-- Icon -->
            <div class="panel-heading icon">
                <i class="glyphicon glyphicon-plus"></i>
            </div>
            <!-- /Icon -->
    
            <!-- Heading -->
            <div class="panel-heading">
                <h2 class="panel-title">New content added</h2>
            </div>
            <!-- /Heading -->
    
            <!-- Body -->
            <div class="panel-body">
                Some new content has been added.
            </div>
            <!-- /Body -->
    
            <!-- Footer -->
            <div class="panel-footer">
                <small>Footer is also supported!</small>
            </div>
            <!-- /Footer -->
    
        </article>
        <!-- /Panel -->

        <!-- Separator -->
        <div class="separator text-muted">
            <time>25. 3. 2015</time>
        </div>
        <!-- /Separator -->
    
        <!-- Panel -->
        <article class="panel panel-success">
    
            <!-- Icon -->
            <div class="panel-heading icon">
                <i class="glyphicon glyphicon-plus"></i>
            </div>
            <!-- /Icon -->
    
            <!-- Heading -->
            <div class="panel-heading">
                <h2 class="panel-title">New content added</h2>
            </div>
            <!-- /Heading -->
    
            <!-- Body -->
            <div class="panel-body">
                Anything you can do with <code>.panel</code>, can be done in timeline too!
            </div>
            <!-- /Body -->
    
            <!-- List group -->
            <ul class="list-group">
                <li class="list-group-item">Like</li>
                <li class="list-group-item">list</li>
                <li class="list-group-item">groups</li>
                <li class="list-group-item">and</li>
                <li class="list-group-item">tables</li>
            </ul>
    
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
                That is all.
            </div>
            <!-- /Body -->
    
        </article>
        <!-- /Panel -->
    
    </div>
    <!-- /Timeline -->

</div>
</div>
	<script type="text/javascript">
	
	</script>
</body>
</html>