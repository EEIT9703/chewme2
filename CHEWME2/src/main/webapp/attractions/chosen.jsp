<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>search</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>  
</head>
<body>
<div>
	<header><%@include file="../header.jsp"%></header>
</div>
 <div class="container" style="margin-top:50px;">
	<div class="row">		
    	<div id="custom-search-input">
        	<div class="input-group col-md-12">
        	<form method="get" action="SearchServlet">
        	<table>
        	<tr>
        		<td>
            		<input type="text" class="search-query form-control" placeholder="搜尋" id="tags" name="tags" autofocus/> 
            	</td>
            	<td>               	
<!--                 	<span class="input-group-btn"> -->
                		<button class="btn btn-info" type="submit" id="button1">
                			<span class=" glyphicon glyphicon-search"></span>
                		</button>
<!--                 	</span>                	 -->
                	<input type="hidden" name="action" value="search">
            	</td>   
            	<td>
            		<a href="listAll.jsp" class="btn btn-primary">全部列表</a>
            	</td> 	
            </tr>    
            </table>
            </form>
            <div style="margin-left:10px;color:red;" id="errorarea">${error.searcherror}</div>    	
           </div>
       </div>
	</div>
</div>
 <script>
  $( function() {    
	  
    var datas = [];
    // 呼叫servlet的getALL方法，回傳全部資料
	$.getJSON("/CHEWME2/DataServlet", {}, function(data){
		for(i = 0; i < data.length; i ++){			
			datas.push(data[i].name);   // 取得全部資料的name屬性，放入datas陣列			
		}		
		console.log(datas);
		console.log(data);
	})    
    
    $("#tags").autocomplete({
      source: datas
    });
    
  	$("#button1").click(function(){
  		var i = $("#tags").val();
  		console.log(i);  		
  	})
  });
  </script>
</body>
</html>