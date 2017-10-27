<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

    <link href="backage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="backage/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <link href="backage/dist/css/sb-admin-2.css" rel="stylesheet">

    <link href="backage/vendor/morrisjs/morris.css" rel="stylesheet">

    <link href="backage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>


<body>
	<header> <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand " href="#"><img src="image/letter-c.png" width="30" height="30" alt=""></a>	
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
  		<div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> 首頁</a>
                        </li>
                        <li>
                            <a href="ad.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>廣告輪播</a>
                            
                        </li>
                        <li>
                            <a href="report.jsp"><i class="fa fa-table fa-fw"></i>檢舉名單</a>
                        </li>
                        <li>
                            <a href="backage_activity.jsp"><i class="fa fa-edit fa-fw"></i>活動管理</a>
                        </li>                      
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Blank Page</a>
                                </li>
                                <li>
                                    <a href="#">Login Page</a>
                                </li>
                            </ul>                       
                        </li>
                    </ul>
                </div>           
            </div> 
            
            
            <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                
                    <h1 class="page-header">內容區標頭</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
               
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                      
                         <div class="panel-heading"> 
						                        
             <table id="activity" class="table table-bordered">
                       <thead>
                          <tr>
                             <th>活動編號</th>
                             <th>活動名稱</th>
                             <th>揪團人數</th>
                             <th>目前人數</th>
                          	 <th>活動開始時間</th>
                             <th>活動結束時間</th>
                             <th>活動狀態</th>
                          </tr>
                       </thead>
                       <tbody>
                      
                       </tbody>
                       <tfoot>
                       <tr>
<!--                        <form name="myForm"> -->
<!--                         <td><input type="hidden" id="ProductID" name="ProductID"><span></span></td> -->
<!--                         <td><input type="text" class="form-control" id="ProductName" name="ProductName" placeholder="產品名稱"></td> -->
<!--                         <td><input type="text" style="width:100px" class="form-control" id="UnitPrice" name="UnitPrice" placeholder="價格"></td> -->
<!--                         <td><input type="text" style="width:100px" class="form-control" id="UnitsInStock" name="UnitsInStock" placeholder="庫存量"></td> -->
<!--                         <td><button id="buttonAdd" type="button" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span></button> -->
<!--                         <button id="buttonUpdate" type="button" class="btn btn-success"><span class="glyphicon glyphicon-edit"></span></button></td> -->
<!--                        </tr> -->
<!--                        </form> -->
                       </tfoot>
                   </table>     
                       	
                       	
                       	</div>       
                        
                                      
                    </div>              
                </div>
                
<!--                 右邊預留空間 -->
                <div class="col-lg-4">

                    <div class="panel panel-default">
                      			 預留空間	
                      			 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="btn-group">
				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
				<ul class="dropdown-menu">
					<li>
						 <a href="#">操作</a>
					</li>
					<li class="disabled">
						 <a href="#">另一操作</a>
					</li>
					<li class="divider">
					</li>
					<li>
						 <a href="#">其它</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
                    </div>
                
                    <div class="chat-panel panel panel-default">
                   			預留空間
                    </div>               
                </div>            
            </div>      
        </div>     
    </div>
    </div>
  
 	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.min.js"></script>
  	<script>
  	$(function(){
  		$.getJSON('activity?action=getAllactivity',{},sendCounty);
  		
  		function sendCounty(array){
  			//var docFrag = $(document.createDocumentFragment());
  			var status=["上架","下架","待審核"];
  			
  			var opt = $('#activity>tbody');
  			opt.empty();
  			$.each(array,function(i,activity){
  	         var cell1 = $('<td></td>').text(activity.actID); 	 
  	       	 var cell2 = $('<td></td>').text(activity.act_name);
	         var cell3 = $('<td></td>').text(activity.act_groups);
	         var cell4 = $('<td></td>').text(activity.act_current);  
	         var cell5 = $('<td></td>').text(activity.BDate);  
	         var cell6 = $('<td></td>').text(activity.EDate);  
	         var cell7 = $('<td></td>').text(activity.activity_state);
	
  	         var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5,cell6,cell7]);
  	         opt.append(row);
  			
  			})
  		
  		}
 				
	   })
    </script>
    	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.min.js"></script>
</body>
</html>