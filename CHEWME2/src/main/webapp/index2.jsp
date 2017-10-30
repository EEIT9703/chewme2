<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta charset="utf-8" />
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="advanced.css"/>
<style>
body { font-family:'Roboto';}
h1 { color:#fff;}
</style>
</head>

<body>

<div class="max-width">
	<h1>jQuery Wrecker Plugin Example</h1>
	
	<div id="container">

	</div>
</div>
<script>
$(function(){
		$.getJSON('<%=request.getContextPath()%>/activity?action=getAllactivity',{},snedActivity);
		
		function snedActivity(array){	
			//var docFrag = $(document.createDocumentFragment()); 			
			var status=["上架","下架","待審核"];
			var opt = $('#container');
			opt.empty();
			$.each(array,function(i,activity){
				alert(activity.act_name)
	         var cell1 = $('<img>').attr("src","image/101.jpg")	       
	       	 var cell2 = $('<p></p>').text(activity.act_name);
			 var cell3 ='<input type="button" value="購買">';
         	 var row = $('<div class="item"></div>').append([cell1, cell2,cell3]); 
  	         opt.append(row);
        		
			})
		
		}
				
   })






</script>






</body>

</html>