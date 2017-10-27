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
                            <a href="backage_member.jsp"><i class="fa fa-edit fa-fw"></i>會員管理</a>
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
                <div class="col-lg-12">
                    <div class="panel panel-default">
                      
                         <div class="panel-heading"> 
						                        
             <table id="member" class="table table-bordered">
                       <thead>
                          <tr>
                             <th>會員ID</th>
                             <th>會員帳號</th>
                             <th>姓名</th>
                             <th>暱稱</th>
                          	 <th>會員密碼</th>
                             <th>生日</th>
                             <th>信箱</th>
                             <th>地址</th>
                             <th>電話</th>
                             <th>介紹</th>
<!--                         <th>圖片</th> -->
                             <th>狀態</th>
                             <th>角色</th>
                                
                          </tr>
                       </thead>
                       <tbody>
                      
                       </tbody>
                       <tfoot>
                       <tr>

                       </tfoot>
                   </table>     
                       	                      	
                       	</div>       
                                   
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
  		$.getJSON('activity?action=getAllmember',{},sendCounty);
  		
  		function sendCounty(array){
  			//var docFrag = $(document.createDocumentFragment()); 	
  			var status=["正常","黑名單"];
  			var roles=["一般會員","社團管理員","系統管理員"];
  			
  			var opt = $('#member>tbody');
  			opt.empty();
  			$.each(array,function(i,member){
  	         var cell1 = $('<td></td>').text(member.memId); 	 
  	       	 var cell2 = $('<td></td>').text(member.memberId);
	         var cell3 = $('<td></td>').text(member.memName);
	         var cell4 = $('<td></td>').text(member.memNickN);  
	         var cell5 = $('<td></td>').text(member.memPwd);  
	         var cell6 = $('<td></td>').text(member.memBirthday);
	         var cell7 = $('<td></td>').text(member.memMail);
	         var cell8 = $('<td></td>').text(member.memAddr);
	         var cell9 = $('<td></td>').text(member.memPhone);
	         var cell10 = $('<td></td>').text(member.memIntr);
	        // var cell11 = $('<td></td>').text(member.memPhoto);
	   
	         var select1 =$('<select id="select1"></select');
	         var select2 =$('<select id="select2"></select');

         
	      $.each(status,function(i){
	    	  var sel1=$('<option></option>').text(status[i])
	    	  		sel1.attr("value",i)
	    	  		alert(status[i])
	    	  		if(member.memStatus==status[i]){
	    	  			sel1.attr("selected","selected")	
	    	  		}
	        		select1.append(sel1)
	        	
	        })
	      var cell12 = $('<td></td>').html(select1)
	       $.each(roles,function(i){
	    	  var sel2=$('<option></option>').text(roles[i])
	    	  		sel2.attr("value",i)
	    	  		if(member.memRole==roles[i]){
	    	  			sel2.attr("selected","selected")	
	    	  		}
	        		select2.append(sel2)
	        		 
	        })
	        var cell13= $('<td></td>').html(select2)
	        
	      
	          var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5,cell6,cell7,cell8,cell9,cell10,cell12,cell13]); 
	  	         opt.append(row);
	        		
  			})
  		
  		}
 				
	   })
    </script>
    	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.min.js"></script>
</body>
</html>