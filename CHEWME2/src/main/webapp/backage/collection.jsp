<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 	<link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/css/metisMenu/metisMenu.min.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  	<link href="<%=request.getContextPath()%>/css/morrisjs/morris.css" rel="stylesheet">
  	<link href="<%=request.getContextPath()%>/css/dist/css/sb-admin-2.css" rel="stylesheet">
  	
  	
  	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/js/advanced.css"/>
  	<style>
  	body { font-family:'Roboto';}
h1 { color:#fff;}
  	
ul, ol {
    margin-top: 0;
    margin-bottom: 10px;
}
ul.list___3xuJM {
    list-style-type: none;
    padding: 0;
}
.img-circle {
    border-radius: 50%;
    border-top-left-radius: 50%;
    border-top-right-radius: 50%;
    border-bottom-right-radius: 50%;
    border-bottom-left-radius: 50%;
}

.user-photo___7yyZ6 {
    width: 98px;
    height: 98px;
    background-repeat: no-repeat;
    background-repeat-x: no-repeat;
    background-repeat-y: no-repeat;
    background-size: cover;
    background-position: 50%;
    background-position-x: 50%;
    background-position-y: center;
}

.myPhoto___3FFnp {
    background-color: #006c8f;
    padding: 20px 0 16px;
    padding-top: 20px;
    padding-right: 0px;
    
    padding-bottom: 16px;
    padding-left: 0px;
    display: -webkit-flex;
    display: flex;
    -webkit-flex-direction: column;
    flex-direction: column;
    -webkit-justify-content: center;
    justify-content: center;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w {
    background-color: #fff;
}

.sidebar___2Ft5w {
	margin-top:20px; 
    width: 340px;
    min-height: 650px;
    height: inherit;
    border-right: 1px solid #a4a3a4;
    -webkit-box-shadow: 2px 5px 10px #909090;
    -moz-box-shadow: 2px 5px 10px #909090;
    box-shadow: 2px 5px 10px #909090;
    
}

.sidebar___2Ft6w {
	margin:20px 0px 0px 100px;
    width: 1150px;
    max-height:650px;
    min-height:650px;
/*     height: inherit; */
    border-right: 1px solid #a4a3a4;
    -webkit-box-shadow: 2px 5px 10px #909090;
    -moz-box-shadow: 2px 5px 10px #909090;
    box-shadow: 2px 5px 10px #909090;
    overflow-x: hide; 
 	overflow: auto; 
 		
  
}



.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze {
    padding: 16px 0 16px 26px;
    font-size: 16px;
    color: #3d3a39;
    position: relative;
    height: 50px;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze .types___3m74H {
    margin: 0 0 0 8px;
}


.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze {
    padding: 16px 0 16px 26px;
    font-size: 16px;
    color: #3d3a39;
    position: relative;
    height: 50px;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center;
    align-items: center;
}

.sidebar___2Ft5w ul.list___3xuJM li.item___2dDze.selected___2Hy4k, .sidebar___2Ft5w ul.list___3xuJM li.item___2dDze:hover {
    background-color: #c44980;
    color: #fff;
    cursor: pointer;
}
.myPhoto___3FFnp .shortText___3j1uo {
    display: inline-block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 185px;
    width: auto;
    color: #FFFFFF;
    
}
.inder_price{
margin-left:120px;
margin-right:10px


}
.allpay_button{
 margin:10px 0px 20px 0px; 
 


}
.item{
/* margin-left:0px; */
/* margin-right:80px; */
margin:0px 80px 30px 0px;
}
</style>


</head>


<body>
	<header><%@ include file="../header.jsp"%></header>
	<article>
 
	<div class="row">
		<div class="col-md-2 column ">
			<div class="sidebar___2Ft5w">
				<div class="myPhoto___3FFnp">
			   	<div style="background-image:url('<%=request.getContextPath()%>/image/101.jpg')" class="img-circle user-photo___7yyZ6"></div>	
				<p class="shortText___3j1uo" title="黃彥坤">黃彥坤</p>
				</div>
				<div>
					<ul class="list___3xuJM">
						<li class="item___2dDze  selected___2Hy4k" id="collection">
						
						<span><img src="<%=request.getContextPath()%>/image/car.gif" width=10px height=10px></span>
						<span class="types___3m74H">購物清單</span>
						</li>
						<li class="item___2dDze" id="Order">
						<span><img src="<%=request.getContextPath()%>/image/car.gif" width=10px height=10px></span>
						<span class="types___3m74H">我的活動</span>
						</li>
						<li class="item___2dDze" id="list">
						<span><img src="<%=request.getContextPath()%>/image/car.gif" width=10px height=10px></span>
						<span class="types___3m74H">我的訂單</span> 
						</li>
						
					</ul>
				</div>
			</div>
		</div>
						
				<div id="cc" class="sidebar___2Ft6w col-md-8 column ">
				
				
				
				</div>		
  				
		
	
</div>
	
</article>
  	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.wrecker.js"></script>	
 <script>
 
$(function(){
		$.getJSON('<%=request.getContextPath()%>/activity?action=getMyCollection',{},snedActivity);
		
		function snedActivity(array){	
			//var docFrag = $(document.createDocumentFragment()); 			
			var status=["上架","下架","待審核"];
			var opt = $('.sidebar___2Ft6w');
			opt.empty();
			var cell5=$('<div class="allpay_button"></div>').html("<input type='button' value='前往歐付寶付款'>")
			opt.append(cell5);
			$.each(array,function(i,activity){			
	         var cell1 = $('<img>').attr("src","<%=request.getContextPath()%>/image/101.jpg")	       
	       	 var cell2 = $('<p></p>').text(activity.act_name);
	         
	         
	         var span =$('<span></span>')
	         var select =$('<select id="selectID"></select');
	      		for(var a=1;a<=8;a++){
	      			var sel=$('<option></option>').text(a)
	      			sel.attr("value",a)
	      			select.append(sel)
	      		}
	      		span.append(select)
	        	span.append("人")
	         
	         var cell3=$('<span class="inder_price"></span>').text("2580$");
	         var input="<input type='button' class='delete' value='刪除'>" ;
			 var cell4 = input;			
         	 var row = $("<div class='item' id="+activity.actID+ "></div>").append([cell1, cell2,span,cell3,cell4]); 
  	         opt.append(row);
        		
			})	
			
		}
		
		$('#collection').click(function (event){
			$(this).attr("class","item___2dDze  selected___2Hy4k")
			$('#Order').attr("class","item___2dDze")
			$('#list').attr("class","item___2dDze")
			$.getJSON('<%=request.getContextPath()%>/activity?action=getMyCollection',{},snedActivity);
		})
		
		$('#Order').click(function (event){
			$(this).attr("class","item___2dDze  selected___2Hy4k")
			$('#collection').attr("class","item___2dDze")
			$('#list').attr("class","item___2dDze")
			$("#container").empty();
			
		})
		$('#list').click(function (event){
			$(this).attr("class","item___2dDze  selected___2Hy4k")
			$('#Order').attr("class","item___2dDze")
			$('#collection').attr("class","item___2dDze")
			$("#container").empty();
			
		})
		
		
		
		
		
// 		$("#cc").wrecker({
// 			  itemSelector : ".item",
// 			  maxColumns : 4
// 			});
// 		$("#cc").wrecker({
// 			  itemSelector : ".item",
// 			  maxColumns : 4,
// 			  responsiveColumns : [
// 			    // windowMaxWidth : columns
// 			    // windowMaxWidth order and values should match those in your responsive CSS
// 			    {1024 : 3},
// 			    {800  : 2},
// 			    {640  : 1}
// 			  ]
// 			});
				
   })
</script>
  	

</body>
</html>