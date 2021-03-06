<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	
	<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/datatables.min.js" type="text/javascript"></script>
	
	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/morrisjs/morris.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/dist/css/sb-admin-2.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/datatables.min.css" rel="stylesheet"  type="text/css">
  	
  	
</head>


<body>
	<header><%@ include file="/header.jsp"%></header>
  		<div id="wrapper">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                     <ul class="nav" id="side-menu" style="background-color:#D9FFFF">
                       
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_index.jsp"><img src="<%=request.getContextPath()%>/image/house.png" width=32px height=32px>後台首頁</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/ad.jsp"><img src="<%=request.getContextPath()%>/image/billboard.png" width=30px height=30px>廣告輪播</a>
                            
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/report.jsp"><img src="<%=request.getContextPath()%>/image/analytics.png" width=30px height=30px>檢舉名單</a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_activity.jsp"><img src="<%=request.getContextPath()%>/image/actvity.png" width=30px height=30px>活動管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_member.jsp"><img src="<%=request.getContextPath()%>/image/team.png" width=30px height=30px>會員管理</a>
                        </li> 
                         <li>
                            <a href="<%=request.getContextPath()%>/backage/backage_attraction.jsp"><img src="<%=request.getContextPath()%>/image/map.png" width=30px height=30px>景點管理</a>
                        </li>                          
<!--                         <li> -->
<!--                             <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a> -->
<!--                             <ul class="nav nav-second-level"> -->
<!--                                 <li> -->
<!--                                     <a href="#">Blank Page</a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a href="#">Login Page</a> -->
<!--                                 </li> -->
<!--                             </ul>                        -->
<!--                         </li> -->
                    </ul>
                </div>           
            </div> 
            
            
            <div id="page-wrapper">
            <div class="row">
<!--                 <div class="col-lg-12"> -->
                
<!--                     <h4 >內容區標頭</h4> -->
<!--                 </div> -->
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
               
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-10">
                    <div class="panel panel-default">
                      
                         <div class="panel-heading"> 
						                        
             <table id="activity" class="table table-hover">
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
                      
                   </table>     
                       	
                       	
                       	</div>       
                        
                                      
                    </div>              
                </div>
                
<!--                 右邊預留空間 -->
<!--                 <div class="col-lg-4"> -->

<!--                     <div class="panel panel-default"> -->
<!--                       			 預留空間	 -->
<!--                       			 <div class="container"> -->
<!-- 	<div class="row clearfix"> -->
<!-- 		<div class="col-md-12 column"> -->
<!-- 			<div class="btn-group"> -->
<!-- 				 <button class="btn btn-default">Action</button> <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button> -->
<!-- 				<ul class="dropdown-menu"> -->
<!-- 					<li> -->
<!-- 						 <a href="#">操作</a> -->
<!-- 					</li> -->
<!-- 					<li class="disabled"> -->
<!-- 						 <a href="#">另一操作</a> -->
<!-- 					</li> -->
<!-- 					<li class="divider"> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						 <a href="#">其它</a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
<!--                     </div> -->
                
<!--                     <div class="chat-panel panel panel-default"> -->
<!--                    			預留空間 -->
<!--                     </div>                -->
<!--                 </div>             -->
            </div>      
        </div>     
    </div>
    </div>
  
 	
  	<script>
  	$(function(){
  		$.getJSON('<%=request.getContextPath()%>/activity?action=getAllactivity',{},snedActivity);
  		
  		function snedActivity(array){
  			
  			//var docFrag = $(document.createDocumentFragment()); 			
  			var status=["建構","上架","下架"];
  			var opt = $('#activity>tbody');
  			opt.empty();
  			$.each(array,function(i,activity){				
  	         var cell1 = $('<td></td>').text(activity.actID); 	 
  	       	 var cell2 = $('<td></td>').text(activity.act_name);
	         var cell3 = $('<td></td>').text(activity.act_groups);
	         var cell4 = $('<td></td>').text(activity.act_current);  
	         var cell5 = $('<td></td>').text(activity.BDate);  
	         var cell6 = $('<td></td>').text(activity.EDate); 
	         
	         var select =$('<select id="selectID"></select');
	        
	      $.each(status,function(i){
	    	  var sel=$('<option></option>').text(status[i])
	    	  		sel.attr("value",i)
	    	  		if(activity.activity_state==i){
	    	  			sel.attr("selected","selected")	
	    	  		}
	        		select.append(sel)
	        })
	     	  var cell7 = $('<td></td>').html(select)
	          var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5,cell6,cell7]); 
	  	         opt.append(row);
	        		
  			})
  			
  			
				var opt = {
							"oLanguage" : {
								"sProcessing" : "處理中...",
								"sLengthMenu" : "顯示 _MENU_ 項結果",
								"sZeroRecords" : "沒有匹配結果",
								"sInfo" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
								"sInfoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
								"sInfoFiltered" : "(從 _MAX_ 項結果過濾)",
								"sSearch" : "搜索:",
								"oPaginate" : {
									"sFirst" : "首頁",
									"sPrevious" : "上頁",
									"sNext" : "下頁",
									"sLast" : "尾頁"
									
								}
							}
						};
  			 $("#activity>tbody>tr:nth-child(even)").css("background-color","#f1f7fe");
						$("#activity").dataTable(opt);

					}
  		
  		$('#activity>tbody').on('change','td:nth-child(7) select',function(){
			 var id = $(this).parents('tr').find('td:nth-child(1)').text();
			 //var opt =$(this).attr("selected","selected");
			  var opt =$(this).attr("selected","selected");
			 $.post('<%=request.getContextPath()%>/activity',{'id':id,'action':'upDateActivityStatus','opt':opt.val()},function(){
				
				 alert("行程已下架")
				 
				 
			 })
			

	
})
  		

				})
			</script>
  	
</body>
</html>