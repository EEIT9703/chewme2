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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/vertical-timeline.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/vertical-timeline.js"></script>
<script src="<%=request.getContextPath()%>/js/canvas2image.js"></script>
<script src="<%=request.getContextPath()%>/js/html2canvas.js"></script>


<!-- <script src="http://ajax.aspnetcdn.com/ajax/knockout/knockout-3.0.0.js "></script> -->
<script src="<%=request.getContextPath()%>/js/html2canvas.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>行程表  ${actID}</title>
</head>
<style>
h1{text-align: center;font-family: 'Arial','Microsoft JhengHei';}
h2{text-align: center;font-family: 'Arial','Microsoft JhengHei';}
span{color: #004B97;font-family: 'Arial','Microsoft JhengHei';font-size:27px;font-weight:bold;}
#name{color:	#003D79;font-family: 'Arial','Microsoft JhengHei';font-size:32px;font-weight:bold;padding-left:10px;}
#tel{color: #9F5000;font-family: 'Arial','Microsoft JhengHei';font-size:27px;font-weight:bold;padding-left:10px;}
#addr{font-family: 'Arial','Microsoft JhengHei';font-size:27px;font-weight:bold;padding-left:10px;}
#intro{font-family: 'Arial','Microsoft JhengHei';font-size:22px;padding-left:10px;}
#photo{padding:10px;vertical-align : middle;}
#downLoad,#save{width:150px;height:40px;text-align: center;font-family: 'Arial','Microsoft JhengHei';font-weight:bold;font-size:22px;}
</style>
<body>

<header><%@include file="../header.jsp"%></header>
<br>
<br>
<button id=save class="btn btn-info" style="margin-left:35px;"><i class="glyphicon glyphicon-picture"></i> 儲存行程</button>
<button id=downLoad class="btn btn-warning" style="margin-left:5px;"><i class="glyphicon glyphicon-download-alt"></i><a id=auto style="display:none;" ></a> 下載行程</button>

<div id=showSchedule><img id='photo' /></div>
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
	var ACTname=null;
 	$('#vt1').verticalTimeline();
 	$('#vt2').verticalTimeline();
 	$('#vt3').verticalTimeline();

window.onload = function(){
	
	$.get("<%=request.getContextPath()%>/Schedule.do?mission=getActName",{'actID':actID},function(actName){
		console.log(actName);
		$('#name').html(actName+"的行程明細");
		ACTname=actName;
		console.log(ACTname);
	});
	
 	$.getJSON("<%=request.getContextPath()%>/Schedule.do?mission=getTrip",{'actID':actID},showTimeLine);

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
			
			html2canvas($("#schedule"), {
	        	onrendered: function(canvas) {
 	         	//$("#photo").attr("src",canvas.toDataURL("image/png"));
	         	//document.body.appendChild(canvas); 
	        	 var pic = canvas.toDataURL("image/png");
	        	 console.log(pic);
	        	 $.get("<%=request.getContextPath()%>/Schedule.do?mission=savePic",{'actID':actID,'pic':pic},function(){
	        			console.log(name);
	        			alert(name+"儲存成功!!\n請前往「揪新團」進行揪團功能\n欲將行程設為社團行程請前往社團頁面");
	        		});
	        	}
	      	});
	    });
		
	        var cunt = 0;
		$('#downLoad').click(function() {
			html2canvas($("#schedule"), {
	        	onrendered: function(canvas) {
	        	
	        		 $("#auto").attr('href', canvas.toDataURL("image/png"));
	                 $("#auto").attr('download',ACTname);
	                    lnk = document.getElementById("auto");
	                    if(cunt==0){
	                    	lnk.click();
	                    	cunt++;
	                    }

	        	}
	      	});
	    });
		
		
		
		//var canvas = document.getElementById('photo');
		//var context = canvas.getContext('2d');
		//context.fillStyle = 'rgb(200, 0, 0)';
		//context.fillRect (10, 10, 55, 50);
		//context.fillStyle = 'rgba(0, 0, 200, 0.5)';
		//context.fillRect (30, 30, 55, 50);
		
		//var image = document.getElementById('photo')
		//#('#downLoad>a').eq(0).attr('onclick',"this.href="+pic);	
	}
</script>
</body>
</html>