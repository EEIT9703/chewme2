<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="com.iii.eeit9703.crawler.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                <div class="col-lg-12">
                    <div class="panel panel-default">
                      
                         <div
                         > 
<%--       						<jsp:include page="/attractions/manageList.jsp"></jsp:include> --%>
<%--                     		 <%@ include file="/attractions/manageList.jsp"%> --%>
								<table class="table table-bordered" id="attraction">
									<thead>
										<tr>
											<th>編號</th>
											<th>名稱</th>
											<th>縣市</th>
											<th>類型</th>
											<th>地址</th>
											<th>聯絡電話</th>					
											<th>刪除</th>
											<th>管理</th>
											
										</tr>
									</thead>
									<tbody>

									</tbody>

								</table>




							</div>       
                        
                                      
                    </div>              
                </div>
                
          
            </div>      
        </div>     
    </div>
    </div>
  
 		<script>
  	$(function(){
  		
  		snedAttraction();	
  		function snedAttraction(){
  			$.getJSON('<%=request.getContextPath()%>/activity?action=getAllattraction',{},function(array){
  				var status=["上架","下架","待審核"];
  	  			var opt = $('#attraction>tbody');
  	  			opt.empty();
  	  			$.each(array,function(i,attraction){				
  	  	         var cell1 = $('<td></td>').text(attraction.attractionID); 	 
  	  	       	 var cell2 = $('<td></td>').text(attraction.name);
  		         var cell3 = $('<td></td>').text(attraction.county);
  		         var cell4 = $('<td></td>').text(attraction.type);  
  		         var cell5 = $('<td></td>').text(attraction.address);  
  		         var cell6 = $('<td></td>').text(attraction.tel); 
  				 var button1=$('<button></button').addClass('btn btn-danger')
  				 var span1=$('<span></span>').addClass('glyphicon glyphicon-remove')
  				 button1.append(span1)
  				 
  				 var form =$('<form></form>').attr({'method':'post','action':'<%=request.getContextPath()%>/attractions/Attraction.do'})
  				 var input1 =$('<input></input>').attr({'type':'hidden','name':'attractionID','value':attraction.attractionID})
  				 var input2 =$('<input></input>').attr({'type':'hidden','name':'action','value':'one_info_edit'})
  				
  				 
  				 var button2=$('<button></button').addClass('btn btn-success')
  				 var span2=$('<span></span>').addClass('glyphicon glyphicon-info-sign')  	 
  				 button2.append(span2)
  				  form.append([input1,input2,button2])
  				 var cell7 = $('<td></td>').append(button1)
  				  var cell8 = $('<td></td>').append(form)
  		          var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5,cell6,cell7,cell8]); 
  		         	
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
  	  		 $("#attraction>tbody>tr:nth-child(even)").css("background-color","#f1f7fe");
  							$("#attraction").dataTable(opt);
  							
		
  			});
  			//var docFrag = $(document.createDocumentFragment()); 			
  		}
  		
  		$('#attraction>tbody').on('click','td:nth-child(7) button:nth-child(1)',function(){
  	    	
  	    	 var id = $(this).parents('tr').find('td:nth-child(1)').text();
  		    	
  					$.getJSON('<%=request.getContextPath()%>/activity?action=deleteAttr',{'id':id},function(){
  						
  						snedAttraction();
  					})	
  			
  		 	 })
  		
  		
//   		 	$('#attraction>tbody').on('click','td:nth-child(8) button:nth-child(1)',function(){
  	  	    	
//   	  	    	 var id = $(this).parents('tr').find('td:nth-child(1)').text();
  	  		    	
<%--   	  					$.post('<%=request.getContextPath()%>/attractions/Attraction.do',{'action':'one_info_edit','attractionID':id},function(attrVO){ --%>
  	  						
  	  						
<%--   	  					window.location.href="<%=request.getContextPath()%>/attractions/showView.jsp"; --%>
  	  						
  	  						
//   	  					});	
  	  					
  	  		
//   		 	})
  		
  		
  		
  		
				})
			</script>
  
</body>
</html>