<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>	
	<script src="<%=request.getContextPath()%>/js/moment.min.js"></script>	
	
	<script src="<%=request.getContextPath()%>/js/fullcalendar.min.js"></script>
	<link href="<%=request.getContextPath()%>/css/full/fullcalendar.print.min.css" rel="stylesheet" media='print'>
	<link href="<%=request.getContextPath()%>/css/full/fullcalendar.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  	<link href="<%=request.getContextPath()%>/css/morrisjs/morris.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/dist/css/sb-admin-2.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/js/headShop.js">	</script>
  	
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    
    
 <style>
 
 
 </style>  
</head>

<body>
	<header><%@ include file="/header.jsp"%></header>
  		<div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                     <ul class="nav" id="side-menu">
                       
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_index.jsp"><i class="fa fa-dashboard fa-fw"></i>後台首頁</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/ad.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>廣告輪播</a>
                            
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/report.jsp"><i class="fa fa-table fa-fw"></i>檢舉名單</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_activity.jsp"><i class="fa fa-edit fa-fw"></i>活動管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_member.jsp"><i class="fa fa-edit fa-fw"></i>會員管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_attraction.jsp"><i class="fa fa-edit fa-fw"></i>景點管理</a>
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
                
                    <h4 >內容區標頭</h4>
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

                
<!--                 右邊預留空間 -->
                <div class="col-lg-4">

<!--                     <div class="panel panel-default"> -->
                  
							<div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        檢舉詳細內容</h3>
                </div>
                <div class="panel-body" >        
                    <table class="table" id="table1">
                    	 <tr class="active">
                            <th>被檢舉對象</th>
                        </tr>
                         <td id="act_name" style="color:#DDDDDD"><h1><span class="subscript">活動名稱</span></h1> </td>
                             
                        <tr class="active">
                             <th>檢舉人</th>
                        </tr>
                         <td id="reporter" style="color:#DDDDDD">檢舉人姓名</td>
                   
                        <tr class="active">
                           	<th>時間</th>
                        </tr>
                         <td id="reportime" style="color:#DDDDDD">檢舉時間</td>
                  
                        <tr class="active">
                            <th>檢舉內容</th>
                        </tr>
                        	 <td id="reportcontext" height=200px style="color:#DDDDDD">詳細內容</td>
                      
                    </table>
                </div>
                <div class="panel-footer">
                	<a href="http://www.jquery2dotnet.com" class="btn btn-success" role="button">前往確認</a>
                </div>
            </div>	

						
<!--                     </div> -->
                
<!--                     <div class="chat-panel panel panel-default"> -->
<!--                    			預留空間 -->
<!--                     </div>                -->
                </div>            
            </div>      
        </div>     
    </div>
    </div>



	<script>
	var cell=new Array();
	//context:report.reportContext
	$(function() {	
	
			$.getJSON('<%=request.getContextPath()%>/activity?action=getAllReport',{},function(data){
				$.each(data, function(i,report) {
					var name =report.memName;
					cell.push({ title:name, start: report.reportTime,  eventSources: [report.reportContext,report.act_name,report,report.memName] });	
				});
				loadReport(cell);			
			});

			   function loadReport(cell){	 
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
							droppable: true,
							events:cell,
							//slotLabelFormat:"YYYY-MM-DD",				
							timeFormat: "YYYY-MM-DD",				
							dragRevertDuration: 0,
							eventClick: function(id){
								$("#myModal").modal('show')
														
							},					
							eventDragStop: function( event, jsEvent, ui, view ) {
								  if(isEventOverDiv(jsEvent.clientX, jsEvent.clientY)) {
									 $("#reporter").text(event.title).css("color","	#000000")
		  							$("#reportime").text(event.start).css("color","	#000000")					
		  							$("#reportcontext").text(event.eventSources[0]).css("color","	#000000")
		  							$("#act_name span").text(event.eventSources[1]).css("color","	#000000")		  
								  }
							},
		   
						});

					});
					}
			   
					var isEventOverDiv = function(x, y) {
		            var external_events = $( '#table1' );
		            var offset = external_events.offset();
		            offset.right = external_events.width() + offset.left;
		            offset.bottom = external_events.height() + offset.top;
		            // Compare
		            if (x >= offset.left
		                && y >= offset.top
		                && x <= offset.right
		                && y <= offset .bottom) { return true; }
		            return false;

		        }	
						
					
						   
			   
			   $('#go').on('click',function(){
					//正是時候 會click 得到他檢舉的那筆資料的id
						$('#myModal').modal('show')
							
					$("#confirm").on('click',function (){
					//	這裡連同id 跟檢舉內容 送到servlet, servlet 得到 登入會員的sesseion資料  活動id 跟 檢舉內容				
					//	alert($("#text").val())		
						$.get("<%=request.getContextPath()%>/report",{"text":$("#text").val(),"id":"1"},function(data){
// 							$("#show").html("<h2>"+data+"</h2>");
						});
					
						})
				  })
			
			
	})
	
	
	
	</script>


</body>
</html>