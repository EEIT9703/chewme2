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
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
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
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        內容區         <div class="panel-heading"> 
                         <div id='calendar'></div>
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
<!-- 						<form id="fileUpDate">					 -->
								<input type="text" id="text" name="text">
								 
<!-- 						</form> -->
							
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
                  <input type="button" id="go" value="檢舉">
                
                
                
<!--                 右邊預留空間 -->
                <div class="col-lg-4">

                    <div class="panel panel-default">
                      			 
                      			 <table id="productTable" class="table table-bordered">
									<thead>
										<tr>
											<th>檢舉人</th>																			
										</tr>
										    <td id="reporter"></td>		
									</thead>
									<tbody>
									<tr>
											<th>檢舉時間</th>																		
									</tr>
									        <td id="reportime"></td>		
									<tr>
											<th>檢舉內容</th>														
									</tr>
											<td id="reportcontext">幹你娘幹你娘幹你娘幹你娘幹你娘幹你娘</td>	
									<tr>
											<th>被檢舉對象</th>														
									</tr>
											<td id ="reported"><input type="button" value="確認"></td>					
									</tbody>
									<tfoot>

									</tfoot>
								</table>
						
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
<!-- 	 <script src="js/jquery.min.js"></script> -->

	<script>
	var cell1=new Array();
	var cell2=new Array();
	var cell3=new Array();
	var obj = new Object;

	$(function() {
					
		var count=0;	
		$.getJSON('./ProductsAll', {}, function(data) {
			count=data.data.length;					
			$.each(data.data, function(i, product) {			
 				cell1.push({ title: product.ProductID, start: '2017-10-05'});				
							
			});			
 			//cell2=JSON.stringify(cell1); 	
			loadProduct(cell1);
		})	
		   function loadProduct(cell1){	 
		$(document).ready(function() {		
			//alert( JSON.stringify(all));
			$('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,agendaWeek,agendaDay,listWeek'
				},
				defaultDate : '2017-10-10',
				navLinks : true, // can click day/week names to navigate views
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events:cell1,
				slotLabelFormat:"YYYY-MM-DD",				
				//timeFormat: "YYYY-MM-DD",
				droppable: false,
				eventClick: function(id){
					
					$("#reporter").text(id.title)
					$("#reportime").text(id.start)					
					$("#reportcontext").text(id.context)
					
				
				},
			   
			});

		});
		}
		
		  $('#go').on('click',function(){
			//正是時候 會click 得到他檢舉的那筆資料的id
				$('#myModal').modal('show')
		
		
			$("#confirm").on('click',function (){
			//	這裡連同id 跟檢舉內容 送到servlet, servlet 得到 登入會員的sesseion資料  活動id 跟 檢舉內容
			
		//	alert($("#text").val())		
				$.get("report",{"text":$("#text").val(),"id":"1"},function(data){
					$("#show").html("<h2>"+data+"</h2>");
				});
			
			
			
				})
		  })
		  
		  
		  
		  
	})
	</script>
	<script src='backage/full/moment.min.js'></script>
    <script src='backage/full/fullcalendar.min.js'></script>

</body>
</html>