<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>search</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="../js/bootstrap.min.js"></script>  
</head>
<body>
 <div class="container">
	<div class="row">		
    	<div id="custom-search-input">
        	<div class="input-group col-md-12">
            	<input type="text" class="search-query form-control" placeholder="Search" id="tags"/>
                	<span class="input-group-btn">
                		<button class="btn btn-info" type="submit" id="button1">
                	<span class=" glyphicon glyphicon-search"></span>
                		</button>
                	</span>
           </div>
       </div>
	</div>
</div>
 <script>
  $( function() {    
	  
    var datas = [];
	$.getJSON("/CHEWME2/DataServlet", {}, function(data){
		for(i = 0; i < data.length; i ++){			
			datas.push(data[i].name);
		}		
	})    
    console.log(datas);
    $( "#tags" ).autocomplete({
      source: datas
    });
    
  	$("#button1").click(function(){
  		var i = $("#tags").val();
  		console.log(i);
  		
  		$.getJSON("/CHEWME2/SearchServlet?action=getonesearch", {"searchone":i}, function(data){
  			console.log("123");
  			console.log(data);
  		})
  	})
  });
  </script>
</body>
</html>