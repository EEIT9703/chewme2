<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="en">
<head>
<!-- jQuery CSS & JS -->
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.min.css">
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="/CHEWME2/css/jquery-ui.theme.min.css">
<script src="/CHEWME2/js/jquery-3.2.1.min.js"></script>
<script src="/CHEWME2/js/jquery-ui.min.js"></script>

<!-- <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->


<!-- Fullcalendar scheduler -->
<link href='/CHEWME2/css/fullcalendar.css' rel='stylesheet' />
<link href='/CHEWME2/css/scheduler.css' rel='stylesheet' />
<script src='/CHEWME2/js/moment.min.js'></script>
<!-- <script src='/CHEWME2/js/jquery.js'></script> -->
<script src='/CHEWME2/js/fullcalendar.min.js'></script>
<script src='/CHEWME2/js/scheduler.js'></script>

<!-- Bootstrap CSS & JS -->
<!-- <link rel="stylesheet" href="/CHEWME2/css/bootstrap.css"> -->
<link rel="stylesheet" href="/CHEWME2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="/CHEWME2/css/bootstrap-responsive.css"> -->
<link rel="stylesheet" href="/CHEWME2/css/bootstrap-responsive.min.css">
<script src="/CHEWME2/js/popper.min.js"></script>
<!-- <script src="/CHEWME2/js/bootstrap.js"></script> -->
<script src="/CHEWME2/js/bootstrap.min.js"></script>



<style type="text/css">
b{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
p{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
select{width:150px;height:40px;font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
option{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
.item{color:#FFFFE8;font-family: 'Arial','Microsoft JhengHei';font-weight:bold;padding:20px;height:50px;background-position:left bottom;background-repeat:no-repeat;}
.detailItem{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding-left:10px;width:80px;}
#detailName,#detailTel,#detailAdd,#detailType{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding:10px;}
#detailIntro{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding:10px;}
#actName{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding-left:10px;height:35px;width:180px;}
#calendar{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>編輯行程</title>

</head>
<body>
<jsp:useBean id="dao" scope="page" class="com.iii.eeit9703.actEditor.model.CountryDAO"/>

<FORM METHOD="post" ACTION="/AreaServlet.do">

<header><%@include file="../header.jsp"%></header>

<div class="container-fluid">
	<div class="row">
		<!-- calendar顯示div處 -->
		<div id='calendar' class='col-xs-7 col-sm-8 col-lg-7' style="padding:10"></div>
		<!-- 選擇器區塊 -->
		<div class="col-xs-5 col-sm-4 col-lg-5" style="padding:10">
			<br>
			<b>行程名稱：</b> <input id="actName"><br><br>
			<b>(1) 選擇縣市：</b>
			<select id="country" name="country">
				<c:forEach var="countryVO" items="${dao.country}">
					<option value="${countryVO.countryID}">${countryVO.countryName}
				</c:forEach>
			</select>
			<br><br>
			<b>(2) 選擇區域：</b>
			<select id="county" name="county"><option>請選擇縣市</option></select>
			<br><br><br>
			<div id="tabs" style="width:350px">
			  <ul>
		    	<li><a href="#attr">景　點</a></li>
				<li><a href="#rest">餐　聽</a></li>
 	 			<li><a href="#stay">住　宿</a></li>
			  </ul>
			  <div id="attr"></div>
			  <div id="rest"></div>
			  <div id="stay"></div>
			</div>
<!-- 		單一景點簡介視窗    -->
		<div class="modal fade" id="detail" aria-labelledby="modalLabel" aria-hidden="true">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-body">
			<table border="1"  style="width:570px;">
				<tbody>
					<tr><td class="detailItem">名　稱</td><td id=detailName></td><td rowspan=4 id=detailPhoto style="height:220px;padding:10px;"></td></tr>	
					<tr><td class="detailItem">類　型</td><td id=detailType></td></tr>
					<tr><td class="detailItem">電　話</td><td id=detailTel></td></tr>
					<tr><td class="detailItem">地　址</td><td id=detailAdd></td></tr>
					<tr><td class="detailItem">簡　介</td><td colspan=2 id=detailIntro></td></tr>
						
				</tbody>
			</table>
			</div>
			</div>
			</div>
		</div>
	</div>
</div>		
</div>		


</FORM>


<script>
var i=1;
var dataArray ;
var item ;

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
			dataArray = array;
			var attr = $("#attr");
			var rest = $("#rest");
			var stay = $("#stay");
			attr.empty();
			rest.empty();
			stay.empty();
			var type=new Array("景點","餐廳","住宿");
			for(var k=0;k<dataArray.length;k++){
//				alert(attraction.type);
//				console.log(array.length);
				var dataName = dataArray[k].name;
				var dataID = dataArray[k].attractionID;
				var dataTel=dataArray[k].tel;
				var dataAdd=dataArray[k].address;
				var dataIntro=dataArray[k].intro;
				var name = $("<p></p>").text(dataName);
				item = $("<div class='item'></div>").append(name);
				item.attr("id",dataID);
				
				if(type[0].match(dataArray[k].type)){
					attr.append(item);
					console.log(array[k].name);
					$('#attr>div').css("background-image","url('../image/trip_tab.png')");
					$('#attr>div').draggable();
					$('#attr>div').attr("data-toggle","modal");
					$('#attr>div').attr("data-target","#detail");
					$('#attr>div').click(function(){
						showDetail($(this).attr("id"));
					})
					$('#attr>div').draggable({
						zIndex: 999,
						revert: true,		// will cause the event to go back to its
					    revertDuration: 0 	// original position after the drag
					});
					
				
				}
				else if(type[1].match(dataArray[k].type)){
					rest.append(item);
					$('#rest>div').css("background-image","url('../image/rest_tab.png')");
					$('#rest>div').draggable();
					$('#rest>div').attr("data-toggle","modal");
					$('#rest>div').attr("data-target","#detail");
					$('#rest>div').click(function(){
					
						showDetail($(this).attr("id"));
					})
					$('#rest>div').draggable({
						zIndex: 999,
						revert: true,      
					    revertDuration: 0  
					});
					
				}
				else if(type[2].match(dataArray[k].type)){
					stay.append(item);
					$('#stay>div').css("background-image","url('../image/stay_tab.png')");
					$('#stay>div').draggable();
					$('#stay>div').attr("data-toggle","modal");
					$('#stay>div').attr("data-target","#detail");
					$('#stay>div').click(function(){
						showDetail($(this).attr("id"));
					})
					$('#stay>div').draggable({
						zIndex: 999,
						revert: true,      
					    revertDuration: 0  
					});
											
				}
				for(var item of  $('.item')){
					$(item).data('event', { id:$(item).attr("id"), title:$(item).text() });
				}
				
				function showDetail(id){
					console.log(dataArray);
					console.log(id);
					for(var k=0;k<dataArray.length;k++){
						if(id==dataArray[k].attractionID){
							$('#detailName').text(dataArray[k].name);
							$('#detailType').text(dataArray[k].type);
							$('#detailTel').text(dataArray[k].tel);
							$('#detailAdd').text(dataArray[k].address);
							$('#detailIntro').text(dataArray[k].intro);	
							$('#detailPhoto').html("<img src='data:image/png;base64,"+dataArray[k].img64+"'height=200px>");
						}
					}
					
			}
				  
	}
	

	
		
	}	


$(function() {
				$("#tabs").tabs({event: "mouseover"});
	  		 });	

}

$(function() {
			
    			var schID = new Array();
//initialize the calendar
	$('#calendar').fullCalendar({
    	height: 700,
    	allDaySlot: false,													//是否顯示「allDay」欄位
    	timeFormat: 'HH:mm',										//行程顯示時間為24時制
    	slotLabelInterval:"00:30",								//設定時間軸標是時間的間隔(01:00表示小時)
    	slotDuration:"01:00",											//設定時間軸每格的間格(01:00表示小時)
    	slotLabelFormat:"HH:mm",	 							//設定時間軸顯示為24時制
    	minTime:"01:00",												//設定時間軸從何時開始顯示(maxTime：結束時間)
    	editable: true,														//設定可否手動編輯事件
    	eventOverlap:false,												//設定事件可否重疊
    	eventBackgroundColor: "	#FFE153",			//設定日曆上所有事件的背景色
    	eventBorderColor:"#00A600",						//設定日曆上所有事件的框線色
    	eventTextColor:"#000000",								//設定日曆上所有事件的字體色
    	droppable: true,													//設定可否放置物件
    	//dropAccept:".item",											//設定允許放置的物件類型
		drop: function(date,jsEven,ui,resourceId) {
    			console.log('drop', date.format(), resourceId);

    			// retrieve the dropped element's stored Event Object
    			var originalEventObject = $(this).data('eventObject');
//    			alert(originalEventObject.id);
    			// we need to copy it, so that multiple events don't have a reference to the same object
    			var copiedEventObject = $.extend({}, originalEventObject);		//將選項值與預設合併，但不修改預設
    			// assign it the date that was reported
    			copiedEventObject.start = date;
    			// render the event on the calendar
    			// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
    			$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
    			

    	    },
		eventReceive: function(event) { // called when a proper external event is dropped
				//console.log('eventReceive', event);
    			//將資料寫入資料庫
    			var eventObject=[];
    			
				//console.log(event.id);
    			//console.log(event.resourceId.charAt(3));
    			//console.log(event.start.format("HH:mm"));
    			
    				var attractionID = event.id;
    				var dayNo = event.resourceId.charAt(3);
    				var period = event.start.format("HH:mm");
    				var eventData = {attractionID:attractionID,dayNo:dayNo,period:period};
    				eventObject.push(eventData);
    			
    				$.post('/CHEWME2/Calendar.do?mission=insertSCH',{"events":JSON.stringify(eventObject)},function(scheduleID){
        				console.log(scheduleID);
        				schID.push(scheduleID);
        				console.log(schID);
        			});   			
    			
			},
		eventDrop: function(event) { // called when an event (already on the calendar) is moved
			var eventObject=[];	
			
			console.log('eventDrop', event);
    		console.log(event.id);
        	console.log(event.start.format("HH:mm"));
        			
        	var attractionID = event.id;
        	var period = event.start.format("HH:mm");
        	var eventData = {attractionID:attractionID,period:period};
        	eventObject.push(eventData);
        			
    		$.post('/CHEWME2/Calendar.do?mission=updateSCH',{"events":JSON.stringify(eventObject)},function(scheduleID){
        			console.log(period);
        	});
				
			},

    	//columnHeader:false,
		defaultView: 'agendaDay',
		header:{
		    left:   'newDay,check',
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
		        },
		    check:{
		    	text:'儲存行程',
		    	click:function(){
		    		if($('#actName').val()==""){
		    			alert("請輸入行程名稱!!");
		    		}else{
		    			var actName = $('#actName').val();
		    			$.post('/CHEWME2/Calendar.do?mission=insertACT',{actName:actName},function(actID){
		    				for(var i=0;i<schID.length;i++){
		    					console.log(actID+";"+schID[i]);
		    					$.post('/CHEWME2/Calendar.do?mission=updateSCH2',{"actID":actID,"schID":schID[i]},function(){
		    						console.log(schID+"歸入"+actID);
		    					});
		    				}
		    			});
		    		}
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