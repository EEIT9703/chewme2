<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
    <link href= "backage/full/fullcalendar.min.css" rel='stylesheet' />
	<link href= "backage/full/fullcalendar.print.min.css"rel='stylesheet' media='print' />

<!--     <link href="backage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

    <link href="backage/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <link href="backage/dist/css/sb-admin-2.css" rel="stylesheet">

    <link href="backage/vendor/morrisjs/morris.css" rel="stylesheet">

    <link href="backage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>



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
							內容區
							<div class="panel-heading">

								<form id="fileUploadForm">
									<input type="file" id="1" name="photo"> 
                                      
									<input type="submit" value="上傳" id="btnSubmit" />
									<div id="result"></div>
								</form>
							
								<table id="productTable" class="table table-bordered">
									<thead>
										<tr>
											<th>產品編號</th>
											<th>產品名稱</th>
											<th>產品名稱</th>
											<th>修改</th>
											<th>刪除</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
									<tfoot>

									</tfoot>
								</table>
								
								
								
								
							</div>
						</div>
					</div>



				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">歡迎來到揪ME</h4>
						</div>
						<div class="modal-body">
						<div class="form-group">
						<form id="fileUpDate">					
					<input type="file" id="2" name="photo"> 
						</form>
							<img alt=" " id="previewer" height="250px" width="250px">
						</div>
						<div class="form-group">
													
						</div>
	
					</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
							<button type="button" class="btn btn-primary" id="confirm" >go</button>
<!-- 							<button type="submit" class="btn btn-primary"  id="confirm">確認</button> -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal -->
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
    
    
    
    
    
    

<!--  	 <script src="js/bootstrap.min.js"></script> -->
<!-- 	 <script src="js/jquery.min.js"></script> -->

	<script>
	

// 		$('#send').click(function(){
// 			var data =$('form[name="myForm"]').serialize();			
//  			$.post("upload",data,function(){
// 				$('#result').text("success");
//  			});
// 		});
var i=1;
$(document).ready(function () {
	search();
// 	 $.getJSON('activity?action=getAll', {}, function (datas) {			          
//           var docFrag = $(document.createDocumentFragment());
//           var tb = $('#productTable>tbody');
//           tb.empty();
//           $.each(datas, function (i,photo) {
//               var cell1 = $('<td></td>').text(photo.photo_no);
//               var cell2 = $('<td></td>').text(photo.name);
//               var row = $('<tr></tr>').append([cell1, cell2]);

//               docFrag.append(row);
//           })
//            tb.append(docFrag);

//       })	

  
   	
function search(){
	$.getJSON('activity?action=getAllphoto',{},sendCounty);

	function sendCounty(array){
		//var docFrag = $(document.createDocumentFragment());
		var opt = $('#productTable>tbody');
		opt.empty();
		$.each(array,function(i,photo){
         var cell1 = $('<td></td>').text(photo.photo_no);
         var cell2 = $('<td></td>').text(photo.name);
         var cell3 = $('<td></td>').html("<img src='data:image/png;base64,"+photo.photo+"'width=100px height=100px>");
//          var cell4 = $('<td></td>').html('<button id="update">修改</button>');
//          var cell5 = $('<td></td>').html('<button id="delete">刪除</button>'); 
         var cell4 = $('<td></td>').html('<button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></button> '); 
         var cell5 = $('<td></td>').html('<button class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button>');
       // var cell5= $('<td></td>').html('<li class="dropdown"><a class="dropdown-toggle" data-toggle="modal" data-target="#myModal"><button class="btn btn-info"><span class="glyphicon glyphicon-pencil"></span></button></a></li>');
        var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5]);
         opt.append(row);
		
		})
	
	}
	
}

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
            timeout: 1000000,
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
        search();
    });
    
    
    $('#delete').on('click',{},function(){
    	
	    	  var id = $(this).parents('tr').find('td:nth-child(1)').text();
	    	  alert(id);
				$.getJSON('activity?action=delete',{'ID':id},function(){
					
					search();
				})	
	 	 })
    
    $('#productTable>tbody').on('click','td:nth-child(4) button:nth-child(1)',function(){
    	
    	 var id = $(this).parents('tr').find('td:nth-child(1)').text();
	    	
				$.getJSON('activity?action=delete',{'ID':id},function(){
					
					search();
				})	
				
	 	 })
    
    $('#productTable>tbody').on('click','td:nth-child(5) button:nth-child(1)',function(){
    	

     var id = $(this).parents('tr').find('td:nth-child(1)').text();
  
    	$('#myModal').modal('show')
 
 	
	 	 
	 
		var filechooser = document.getElementById('2');
    	var previewer = document.getElementById('previewer');
  		 filechooser.onchange = function() {
        var files = this.files;
        var file = files[0];

        // 接受 jpeg, jpg, png 类型的图片
        if (!/\/(?:jpeg|jpg|png)/i.test(file.type)) return;

        var reader = new FileReader();

        reader.onload = function() {
            var result = this.result;

            previewer.src = result;

            // 清空图片上传框的值
//             filechooser.value = '';
        };

        reader.readAsDataURL(file);
    };
    
	 $("#confirm").on('click',function () { 
		 var url="upload?action=upload&id=";
				 
         var form = $('#fileUpDate')[0];
         var data = new FormData(form);
 		//上傳秀的圖片
         $.ajax({
             type: "POST",
             enctype: 'multipart/form-data',
              url:url+id,
 //            url:"upload?action=upload&id=1",		 
             data: data,
             processData: false,
             contentType: false,
             cache: false,
             timeout: 10000000,
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
   
         $('#myModal').modal('hide')
   
    	  search();
    
    	 });//end confirm
  
	 	 })	//end nth-child(5)
	 	 

});//end jquery
	</script>
	<script src='backage/full/moment.min.js'></script>
    <script src='backage/full/fullcalendar.min.js'></script>
    
    

</body>
</html>