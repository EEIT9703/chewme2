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
                <div class="col-lg-12">
                    <div class="panel panel-default">
                      
                         <div class="panel-heading"> 
						                        
             <table id="member" class="table table-bordered">
                       <thead>
                          <tr>
                             <th>會員ID</th>
                             <th>會員帳號</th>
                             <th>姓名</th>                         
                          	 <th>會員密碼</th>
                             <th>生日</th>
                             <th>信箱</th>
<!--                              <th>地址</th> -->
                             <th>電話</th>                            
<!--                         <th>圖片</th> -->
                             <th>狀態</th>
                             <th>角色</th>
                                
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
  		$.getJSON('<%=request.getContextPath()%>/activity?action=getAllmember',{},sendmembers);
  		
  		function sendmembers(array){
  			
  			//var docFrag = $(document.createDocumentFragment()); 	
  			var status=["正常","黑名單"];
  			var roles=["一般會員","社團管理員","系統管理員"];		
  			var opt = $('#member>tbody');
  			opt.empty(); 
  			$.each(array,function(i,member){
  				
  	         var cell1 = $('<td></td>').text(member.memId); 	 
  	       	 var cell2 = $('<td></td>').text(member.memberId);
	         var cell3 = $('<td></td>').text(member.memName);        
	         var cell4 = $('<td></td>').text(member.memPwd);  
	         var cell5 = $('<td></td>').text(member.memBirthday);
	         var cell6 = $('<td></td>').text(member.memMail);
// 	         var cell7 = $('<td></td>').text(member.memAddr);
	         var cell8 = $('<td></td>').text(member.memPhone);	      
	        // var cell11 = $('<td></td>	').text(member.memPhoto);  
	         var select1 =$('<select id="select1"></select');
	         var select2 =$('<select id="select2"></select');

         
	      $.each(status,function(i){
	    	  var sel1=$('<option></option>').text(status[i])
	    	  		sel1.attr("value",i)  	  		
	    	  		if(member.memStatus==status[i]){
	    	  			sel1.attr("selected","selected")	
	    	  		}
	        		select1.append(sel1)
	        	
	        })
	      var cell9 = $('<td></td>').html(select1)
	       $.each(roles,function(i){
	    	  var sel2=$('<option></option>').text(roles[i])
	    	  		sel2.attr("value",i)
	    	  		if(member.memRole==roles[i]){
	    	  			sel2.attr("selected","selected")	
	    	  		}
	        		select2.append(sel2)        		 
	        })
	        var cell10= $('<td></td>').html(select2)             
	        var row = $('<tr></tr>').append([cell1, cell2,cell3,cell4,cell5,cell6,cell8,cell9,cell10]); 
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
  			
  			$("#member>tbody>tr:nth-child(even)").css("background-color","#f1f7fe");
						$("#member").dataTable(opt);
  	
  		}
  		
		 
			$('#member>tbody').on('change','td:nth-child(9) select',function(){
				 var id = $(this).parents('tr').find('td:nth-child(1)').text();
				 //var opt =$(this).attr("selected","selected");
				  var opt =$('#select1>:selected');
				 $.post('<%=request.getContextPath()%>/activity',{'id':id,'action':'upDateMemberStatus','opt':opt.text()},function(){
					
					 alert("更新status成功")
					 
					 
				 })
		
	 })

  		
 			$('#member>tbody').on('change','td:nth-child(10) select',function(){
 				 var id = $(this).parents('tr').find('td:nth-child(1)').text();
 				// var opt =$(this).attr("selected","selected");
 				 var opt =$('#select2>:selected');				
 				 $.post('<%=request.getContextPath()%>/activity',{'id':id,'action':'upDateMemberRole','opt':opt.text()},function(){
 					
 					 alert("更新Role成功")
 					 
 					 
 				 })
			
		 })


  		
  		
 				
	   })
	   
	
    </script>

</body>
</html>