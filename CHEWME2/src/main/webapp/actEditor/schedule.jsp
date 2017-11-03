<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
		String SactID = (String) request.getAttribute("actID");
		Integer actID = Integer.parseInt(SactID);
		
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.min.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.min.css">
<link rel="stylesheet" href="/CHEWME2/css/vertical-timeline.css">
<script src="/CHEWME2/js/jquery-3.2.1.min.js"></script>
<script src="/CHEWME2/js/jquery-ui.min.js"></script>
<script src="/CHEWME2/js/bootstrap.min.js"></script>
<script src="/CHEWME2/js/vertical-timeline.js"></script>
<script src="/CHEWME2/js/canvas2image.js"></script>
<script src="/CHEWME2/js/html2canvas.js"></script>


<!-- <script src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js "></script> -->
<script src="/CHEWME2/js/html2canvas.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>行程表  ${actID}</title>
</head>
<style>
h1{text-align: center;font-family: 'Arial','Microsoft JhengHei';}
h2{text-align: center;font-family: 'Arial','Microsoft JhengHei';}
span{color: #004B97;font-family: 'Arial','Microsoft JhengHei';font-size:25px;font-weight:bold;p}
#name{font-family: 'Arial','Microsoft JhengHei';font-size:25px;font-weight:bold;padding-left:10px;}
#tel{color: #9F5000;font-family: 'Arial','Microsoft JhengHei';font-size:20px;font-weight:bold;padding-left:10px;}
#addr{font-family: 'Arial','Microsoft JhengHei';font-size:20px;font-weight:bold;padding-left:10px;}
#intro{font-family: 'Arial','Microsoft JhengHei';font-size:15px;padding-left:10px;}
#photo{padding:10px;vertical-align : middle;}
</style>
<body>

<header><%@include file="../header.jsp"%></header>
<br>
<br>
<button id=save><i class="glyphicon glyphicon-picture"></i>儲存行程</button>
<div id=showSchedule></div>
<div id=schedule>
	<h1 id="name"></h1>
	<h2 id="day1"></h2>
	<div id="vt1"></div>
	<h2 id="day2"></h2>
	<div id="vt2" ></div>
	<h2 id="day3"></h2>
	<div id="vt3" ></div>
</div>
<script>
	var actID=${actID};
	var name=null;
 	$('#vt1').verticalTimeline();
 	$('#vt2').verticalTimeline();
 	$('#vt3').verticalTimeline();

window.onload = function(){
	
	$.get("/CHEWME2/Schedule.do?mission=getActName",{'actID':actID},function(actName){
		console.log(actName);
		$('#name').html(actName+"的行程明細");
		name=actName;
	});
	
 	$.getJSON("/CHEWME2/Schedule.do?mission=getTrip",{'actID':actID},showTimeLine);

	function showTimeLine(array){

		console.log(array.length);
		var maxDay = array[array.length-1].scheduleData.dayNo;
		var k=0;
			
		switch(maxDay){
		
		case 1:
			$("#vt2").hide();
			$("#vt3").hide();
			break;
		case 2:
			$("#vt3").hide();
			break;
			
		}
		
		for (var i = k; i < array.length; i++) {			
				
			var name = $("<p id='name'></p>").append(array[i].name);
			var tel = $("<p id='tel'></p>").append(array[i].tel);
			var addr = $("<p id='addr'></p>").append(array[i].address);
			var intro = $("<p id='intro'></p>").append(array[i].intro);
			var photo = $("<p></p>").html("<img src='data:image/png;base64,"+array[i].img64+"'height=200px>");
					photo.attr("id", "photo");
			var period = $(	"<span id='period' class='vtimeline-date'></span>").append(array[i].scheduleData.period);
			var attrpoint = $(	"<div id='period' class='vtimeline-content'></div>").append([ name, tel, addr, intro, photo ]);
					attrpoint.attr("data-vtdate", period);
			var block = $("<div class='vtimeline-block'></div>").append([ period, attrpoint ]);
			var icon = $("<div class='vtimeline-icon'><i class='glyphicon glyphicon-heart'></i></div>");
			
			var point = $("<div class='vtimeline-point'></div>").append([icon,block]);
					point.attr("id", array[i].attractionID);
			
			switch(array[i].scheduleData.dayNo){
			
			case 1:
				$("#day1").replaceWith("<h2 id='day1'>DAY - 1</h2>");
				$("#vt1").append(point);
				break;
			case 2:
				$("#day2").replaceWith("<h2 id='day2'>DAY - 2</h2>");
				$("#vt2").append(point);
				break;
			case 3:
				$("#day3").replaceWith("<h2 id='day3'>DAY - 3</h2>");
				$("#vt3").append(point);
				break;
			
			}
			if (i % 2 == 0) {
						block.attr("class", "vtimeline-block vtimeline-left");
			} else {
						block.attr("class", "vtimeline-block vtimeline-right");
			}
		}

		}
	
		$('#save').click(function() {
			
			//var pic="";
			
			html2canvas($("#schedule"), {
	        	onrendered: function(canvas) {
	         		$("<img />", { src: canvas.toDataURL("image/png") }).appendTo($("#showSchedule"));
	         	//document.body.appendChild(canvas); 
	        	 var pic = canvas.toDataURL("image/png");
	        	 console.log(pic);
	        	 $.get("/CHEWME2/Schedule.do?mission=savePic",{'actID':actID,'pic':pic},function(){
	        			console.log(name);
	        			alert(name+"儲存成功!!\n請前往「揪新團」進行揪團功能");
	        		});
	        	}
	      	});

			
/*	      matches = pic.match(/^data:([A-Za-z-+\/]+);base64,(.+)$/), imageBuffer = {};
	      if (matches.length !== 3) {
	  			return new Error('無效的影像編碼');
	  			}
	   
	      imageBuffer.type = matches[1];
	      imageBuffer.data = new Buffer(matches[2], 'base64');
	      
	      require('fs').writeFile('/CHEWME2/src/main/webapp/image/'+actID, imageBuffer.data, function(err) {
	  		if(err){
	  			console.error(err);
	  		}
	  		console.log('file '+actID+' saved.')
	  	});
*/
	    });
	}
</script>
</body>
</html>