
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- jQuery CSS & JS -->
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.min.css">
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.theme.min.css">
<script src="/CHEWME2/js/jquery-3.2.1.min.js"></script>
<script src="/CHEWME2/js/jquery-ui.min.js"></script>

<!-- Bootstrap CSS & JS -->
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.min.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap-responsive.css">
<link rel="stylesheet" href="/CHEWME2/css/bootstrap-responsive.min.css">
<script src="/CHEWME2/js/popper.min.js"></script>
<script src="/CHEWME2/js/bootstrap.js"></script>
<script src="/CHEWME2/js/bootstrap.min.js"></script>

<!-- Fullcalendar scheduler -->
<link href='/CHEWME2/css/fullcalendar.css' rel='stylesheet' />
<link href='/CHEWME2/css/scheduler.css' rel='stylesheet' />
<script src='/CHEWME2/js/moment.min.js'></script>
<!-- <script src='/CHEWME2/js/jquery.js'></script> -->
<script src='/CHEWME2/js/fullcalendar.min.js'></script>
<script src='/CHEWME2/js/scheduler.js'></script>


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

<!-- calendar顯示div處 -->
	<div id='calendar' class='span6' ></div>
	
<jsp:useBean id="dao" scope="page" class="com.iii.eeit9703.actEditor.CountryDAO"/>
<FORM METHOD="post" ACTION="/AreaServlet.do">
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

window.onload = function(){

//		document.getElementById("county").addEventListener("change",function (){
//			var county = document.getElementById("county");
		
//		});
	$("#country").change(function (){
		var country = document.getElementById("country");
//		alert("選擇縣市："+country.value);
		$.getJSON('/CHEWME2/AreaServlet.do?mission=getCountry',{'country':country.value},sendCounty);
		$.getJSON('/CHEWME2/AreaServlet.do?mission=getCountryAttr',{'country':country.value},sendAttraction);		
	});
	
	$("#county").change(function (){
		var county = document.getElementById("county");
//		alert("選擇區域："+county.value);
		$.getJSON('/CHEWME2/AreaServlet.do?mission=getCounty',{'county':county.value},sendAttraction);
	});	
	
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

	function sendAttraction(array){
			var attr = $("#attr");
			var rest = $("#rest");
			var stay = $("#stay");
			attr.empty();
			rest.empty();
			stay.empty();
			var type=new Array("景點","餐廳","住宿");
			for(var k=0;k<array.length;k++){
//			$.each(array,function(i,attraction){
//				alert(attraction.type);
//				console.log(array.length);
				var dataName = array[k].name;
				var dataID = array[k].attractionID
				var name = $("<p></p>").text(dataName);
				var item = $("<div class='item'></div>").append(name);
				item.attr("id",dataID);
				
				if(type[0].match(array[k].type)){
					attr.append(item);
					console.log(array[k].name);
					$('#attr>div').css("background-color","#4EFEB3");
					$('#attr>div').draggable();
					$('#attr>div').draggable({
						zIndex: 999,
						revert: true,		// will cause the event to go back to its
					    revertDuration: 0 	// original position after the drag
					});
					
				
				}
				else if(type[1].match(array[k].type)){
					rest.append(item);
					$('#rest>div').css("background-color","#FFA042");
//					$('#rest>div').data('event', { id:item.attr("id"), title:item.text() });
					$('#rest>div').draggable();
					$('#rest>div').draggable({
						zIndex: 999,
						revert: true,      
					    revertDuration: 0  
					});
					
				}
				else if(type[2].match(array[k].type)){
					stay.append(item);
					$('#stay>div').css("background-color","#6A6AFF");
//					$('#stay>div').data('event', { id:item.attr("id"), title:item.text() });
					$('#stay>div').draggable();
					$('#stay>div').draggable({
						zIndex: 999,
						revert: true,      
					    revertDuration: 0  
					});
											
				}
				for(var item of  $('.item')){
					$(item).data('event', { id:$(item).attr("id"), title:$(item).text() });
				}
				
				
}	
//			});
		}
		


$(function() {
				$("#tabs").tabs({event: "mouseover"});
	  		 });	

}

$(function() {
			
//initialize the calendar
	$('#calendar').fullCalendar({
    	height: 680,
    	allDaySlot: false,
    	slotLabelInterval:"01:00",
    	slotDuration:"01:00",
    	slotLabelFormat:"HH:mm",
    	minTime:"01:00",
    	editable: true,
    	droppable: true,
    	//dropAccept:".item",
    	drop: function(date,jsEven,ui,resourceId) {
    			console.log('drop', date.format(), resourceId);

    			// retrieve the dropped element's stored Event Object
    			var originalEventObject = $(this).data('eventObject');
//    			alert(originalEventObject.id);
    			// we need to copy it, so that multiple events don't have a reference to the same object
    			var copiedEventObject = $.extend({}, originalEventObject);
    			// assign it the date that was reported
    			copiedEventObject.start = date;
    			// render the event on the calendar
    			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
    			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
    			// is the "remove after drop" checkbox checked?
    			if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
    	    },
    	    eventReceive: function(event) { // called when a proper external event is dropped
				console.log('eventReceive', event);
			},
			eventDrop: function(event) { // called when an event (already on the calendar) is moved
				console.log('eventDrop', event);
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
	
})


</script>
</body>

</html>