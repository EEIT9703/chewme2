<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->
    <link href= "backage/full/fullcalendar.min.css" rel='stylesheet' />
	<link href= "backage/full/fullcalendar.print.min.css"rel='stylesheet' media='print' />

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
			<a class="navbar-brand " href="#"><img src="image/letter-c.png"width="30" height="30" alt="">CHEWME</a>
		</div>
		<ul class="nav navbar-nav">
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
                            <a href="#"><i class="fa fa-edit fa-fw"></i>活動管理</a>
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
                        內容區         <div class="panel-heading"> 
                
			         <form id="fileUploadForm" >
					<input type="file" id="1" name="photo" >
					<input type="file" id="2" name="photo" >
<!-- 					<input type="file" id="picture3" name="photo" > -->
<!-- 					<input type="file" id="picture4" name="photo" > -->
<!-- 					<input type="file" id="picture5" name="photo" >	 -->
<!-- 					<input id="send" type="button" value="上傳" > -->
					 <input type="submit" value="上傳" id="btnSubmit"/>
			       <div id="result"></div>
			         </form>
			        	
			          
                        </div>          
                    </div>              
                </div>
                
<!--                 右邊預留空間 -->
                <div class="col-lg-4">

                    <div class="panel panel-default">
                      			 預留空間	
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
	

// 		$('#send').click(function(){
// 			var data =$('form[name="myForm"]').serialize();			
//  			$.post("upload",data,function(){
// 				$('#result').text("success");
//  			});
// 		});
$(document).ready(function () {

    $("#btnSubmit").click(function (event) {

        //stop submit the form, we will post it manually.
        event.preventDefault();

        // Get form
        var form = $('#fileUploadForm')[0];

		// Create an FormData object
        var data = new FormData(form);

		// If you want to add an extra field for the FormData
      //  data.append("CustomField", "This is some extra data, testing");

		// disabled the submit button
       // $("#btnSubmit").prop("disabled", true);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url:"upload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {

                $("#result").text(data);
                console.log("SUCCESS : ", data);
                $("#btnSubmit").prop("disabled", false);

            },
            error: function (e) {

                $("#result").text(e.responseText);
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);

            }
        });

    });

});
	</script>
	<script src='backage/full/moment.min.js'></script>
    <script src='backage/full/fullcalendar.min.js'></script>

</body>
</html>