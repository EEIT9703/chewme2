<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#all{
	margin:0;
	margin:auto;
}
.items{
		border-radius:5px;
		background-color:#ade5a4;
	}
.span1{
	border:1px solid red;
	width:180px;
	height:150px;
	margin-right:50px;
	}
.text1{
	margin:50px;
	}
.col-sm-6.col-md-4{	
	margin:10px;
	width:300px;
	}
.items{
	margin:20px;
	width:500px;
}
.buy{
	margin-left:15px;
	border-radius:5px;
}
.text2{
	color:green;
}
body { background-color:#ddd; }
.blog-row {margin-top:50px; }
.margin_bottom30 { margin-bottom:30px; }
.margin_left10 {margin-left:10px; }
.blog-content {padding:10px; }
.bg-white {background-color:#fff;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<script src="https://use.fontawesome.com/1dec14be15.js"></script>
</head>
<body>
	<div id="all">
	<table>
        	<tr>
        		<td>
        			<select name="county" class="selectpicker" style="width:20px;" id="select1">
        				<option>景點</option>
						<option>行程</option>
        			</select>
        		</td>
        		<td>
            		<input type="text" class="search-query form-control" placeholder="搜尋" id="tags" name="tags" autofocus/> 
            	</td>
            	<td>               
                		<button class="btn btn-info" type="submit" id="button1">
                			<span class=" glyphicon glyphicon-search"></span>
                		</button>
                	<input type="hidden" name="action" value="search">
            	</td>   
            	 	
            </tr>    
            </table>  
            <div class="container">             	
				<div class="row" id="div1"></div>    
			</div>       
	</div>
</body>
<script src="js/template.js"></script>
</html>