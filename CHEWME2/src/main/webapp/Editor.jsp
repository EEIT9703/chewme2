<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- jQuery CSS & JS -->
<link rel="stylesheet" href="/actEditor/css/jquery-ui.min.css">
<link rel="stylesheet" href="/actEditor/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="/actEditor/css/jquery-ui.theme.min.css">
<script src="/actEditor/js/jquery-3.2.1.min.js"></script>
<script src="/actEditor/js/jquery-ui.min.js"></script>

<!-- Bootstrap CSS & JS -->
<link rel="stylesheet" href="/actEditor/css/bootstrap.css">
<link rel="stylesheet" href="/actEditor/css/bootstrap.min.css">
<link rel="stylesheet" href="/actEditor/css/bootstrap-responsive.css">
<link rel="stylesheet" href="/actEditor/css/bootstrap-responsive.min.css">
<script src="/actEditor/js/popper.min.js"></script>
<script src="/actEditor/js/bootstrap.js"></script>
<script src="/actEditor/js/bootstrap.min.js"></script>

<!-- Fullcalendar scheduler -->
<link href='/actEditor/css/fullcalendar.css' rel='stylesheet' />
<link href='/actEditor/css/scheduler.css' rel='stylesheet' />
<script src='/actEditor/js/moment.min.js'></script>
<!-- <script src='/actEditor/js/jquery.js'></script> -->
<script src='/actEditor/js/fullcalendar.min.js'></script>
<script src='/actEditor/js/scheduler.js'></script>


<style type="text/css">
b{font-family: 'Arial','Microsoft JhengHei';font-size:20px;}
p{font-family: 'Arial','Microsoft JhengHei';font-size:20px;font-weight:bolder}
select{width:120px;height:40px;}
.item{line-height:30px;border-radius:20px;width:240px;padding-left:20px}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>編輯行程</title>

</head>
<body>
<div id="draggable" class="ui-widget-content" style="width:100px;height:100px;">
  <b>Drag me around</b>
</div>
<!-- calendar顯示div處 -->
	<div id='calendar' class='span6' ></div>
	
<jsp:useBean id="dao" scope="page" class="com.iii.eeit9703.actEditor.CountryDAO"/>
<FORM METHOD="post" ACTION="/actEditor/AreaServlet.do">
<div class="row">
	<div class="span6">
		<b>(1) 選擇縣市：</b>
		<select id="country" name="country">
			<c:forEach var="countryVO" items="${dao.country}">
				<option value="${countryVO.countryID}">${countryVO.countryName}
			</c:forEach>
		</select>
		<br>
		<b>(2) 選擇區域：</b>
		<select id="county" name="county"><option>請選擇縣市</option></select>
		<div id="tabs">
		  <ul>
	    	<li><a href="#attr">景　點</a></li>
			<li><a href="#rest">餐　聽</a></li>
  			<li><a href="#stay">住　宿</a></li>
		  </ul>
		  <div id="attr"></div>
		  <div id="rest"></div>
		  <div id="stay"></div>
		</div>
	</div>
	<div ></div>
</div>		



</FORM>


<script>
	var i=1;
	$('#calendar').fullCalendar({
    	height: 680,
    	allDaySlot: false,
    	slotLabelInterval:"01:00",
    	slotDuration:"01:00",
    	slotLabelFormat:"HH:mm",
    	minTime:"01:00",
    	droppable: true,
    	dropAccept:"#draggable",
    	drop: function(date,jsEven,ui,resourceId) {
    	        alert("Dropped on " + date.format()+" id= "+this.id);
    	    },
    	//columnHeader:false,
		defaultView: 'agendaDay',
		header:{
		    left:   'newDay',
		    center: '',
		    right:  ''
		},
		eventClick: function(id){
			alert("id=" + id.id);
		},
		customButtons:{
			newDay: {
		            text: '新增一天',
		            click: function(){
		            	var I=null;
		            	var T=null;
		            	i=i+1;
		            	I='day'+i;
		            	T='DAY '+i;
		            	$('#calendar').fullCalendar('addResource', { id:I, title:T});
		            }
		        }
		    },
    	events: [
        // events go here
    	],
    	resources: [
        {id: 'day1', title: 'DAY 1',}
    	]
    	// other options go here...
	});
//draggable 相關	
	$('#draggable').draggable({
	    revert: true,      // immediately snap back to original position
	    revertDuration: 0  //
	});
	$('#draggable').data('event', { id:'415', title: 'my event' });
	$( function() {
	    $( "#draggable" ).draggable();
	  } );

	window.onload = function(){

// 		document.getElementById("county").addEventListener("change",function (){
// 			var county = document.getElementById("county");
			
// 		});
		$("#country").change(function (){
			var country = document.getElementById("country");
//			alert("選擇縣市："+country.value);
			$.getJSON('/actEditor/AreaServlet.do?mission=getCountry',{'country':country.value},sendCounty);
			function sendCounty(array){
				var opt = $('#county');
				opt.empty();
				$.each(array,function(i,county){
					var cell = $("<option></option>");
					cell.text(county.countyName);
					cell.val(county.countyID);
					opt.append(cell);
				})
			}
		});
		$("#county").change(function (){
			var county = document.getElementById("county");
//			alert("選擇區域："+county.value);
			$.getJSON('/actEditor/AreaServlet.do?mission=getCounty',{'county':county.value},sendAttraction);
			function sendAttraction(array){
				var attr = $("#attr");
				var rest = $("#rest");
				var stay = $("#stay");
				attr.empty();
				rest.empty();
				stay.empty();
				var type=new Array("景點","餐廳","住宿");
				$.each(array,function(i,attraction){
//					alert(attraction.type);
					if(type[0].match(attraction.type)){
						var name = $("<p></p>").text(attraction.name);
						var item = $("<div class='item' style='background-color:#AAAAFF'></div>").append(name);
						item.attr("id",attraction.attractionID);
						attr.append(item);
					}
					else if(type[1].match(attraction.type)){
						var name = $("<p></p>").text(attraction.name);
						var item = $("<div class='item' style='background-color:#96FED1'></div>").append(name);
						item.attr("id",attraction.attractionID);
						rest.append(item);
					}
					else if(type[2].match(attraction.type)){
						var name = $("<p></p>").text(attraction.name);
						var item = $("<div class='item' style='background-color:#FFBD9D'></div>").append(name);
						item.attr("id",attraction.attractionID);
						stay.append(item);
					}
					
				})
			}
			
		});
	$(function() {
					$("#tabs").tabs({event: "mouseover"});
		  		 });	
	$( function() {
	    			$( "#draggable" ).draggable();
	  			  });
	
	}
</script>
</body>

</html>