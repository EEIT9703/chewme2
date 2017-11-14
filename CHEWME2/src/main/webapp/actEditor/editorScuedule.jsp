<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html lang="en">
<head>
<!-- jQuery CSS & JS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.theme.min.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>

<!-- <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->


<!-- Fullcalendar scheduler -->
<link href='<%=request.getContextPath()%>/css/fullcalendar.css' rel='stylesheet' />
<link href='<%=request.getContextPath()%>/css/scheduler.css' rel='stylesheet' />
<script src='<%=request.getContextPath()%>/js/moment.min.js'></script>
<!-- <script src='<%=request.getContextPath()%>/js/jquery.js'></script> -->
<script src='<%=request.getContextPath()%>/js/fullcalendar.min.js'></script>
<script src='<%=request.getContextPath()%>/js/scheduler.js'></script>

<!-- Bootstrap CSS & JS -->
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap-responsive.min.css">
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<!-- <script src="<%=request.getContextPath()%>/js/bootstrap.js"></script> -->
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>



<style type="text/css">
b{font-family: 'Arial','Microsoft JhengHei';font-size:20px;margin-top:10px;}
#attr,#rest,#stay{font-family: 'Arial','Microsoft JhengHei';font-size:20px;}
p{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
select{width:150px;height:40px;font-family: 'Arial','Microsoft JhengHei';font-size:20px;}
option{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}
.item{font-family: 'Arial','Microsoft JhengHei';font-size:20px;font-weight:bold;line-height:300%;padding-left:10px;height:60px;background-repeat:no-repeat;}
.detailItem{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding-left:10px;width:80px;}
#detailName,#detailTel,#detailAdd,#detailType{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding:10px;}
#detailIntro{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding:10px;}
#actName{font-family: 'Arial','Microsoft JhengHei';font-size:17px;padding-left:10px;height:35px;width:180px;}
#calendar{font-family: 'Arial','Microsoft JhengHei';font-size:17px;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>編輯行程</title>

</head>
<body>
<jsp:useBean id="dao" scope="page" class="com.iii.eeit9703.actEditor.model.CountryDAO"/>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Calendar.do">

<header><%@include file="../header.jsp"%></header>
<br>
<br>
<div class="container-fluid" style="width:100%;margin:0px 30px">
	<div class="row">
		<!-- calendar顯示div處 -->
		<div id='calendar' class='col-xs-6 col-sm-7 col-lg-6' style="padding:0px 10px;"></div>
		<div class='col-xs-1 col-sm-0 col-lg-1'></div>
		<!-- 選擇器區塊 -->
		<div class="col-xs-5 col-sm-5 col-lg-5" style="padding-left:5px;">
		
			<br>
			<img src="../image/mapping.png" height="40px"><b style="color:#005AB5">行程名稱：</b> <input id="actName"><br><br>
			<img src="../image/pattern (1).png" height="40px"><b style="color:#005AB5">選擇縣市：</b>
			<select id="country" name="country">
				<c:forEach var="countryVO" items="${dao.country}">
					<option value="${countryVO.countryID}">${countryVO.countryName}
				</c:forEach>
			</select>
			<br><br>
			<img src="../image/pattern (1).png" height="40px"><b style="color:#005AB5">選擇區域：</b>
			<select id="county" name="county"><option>請選擇縣市</option></select>
			<br><br><br>
			<div id="tabs" style="width:550px">
			  <ul>
		    	<li><a href="#attr">景　點</a></li>
				<li><a href="#rest">餐　廳</a></li>
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

<!-- 轉換頁面框 -->
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Calendar.do" name="form1">
<div class="modal fade" id="pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body"><h3>行程建立成功!!</h3><h4>將前往行程預覽頁面</h4></div>
			<div class="modal-footer">
				<input type="hidden" name="mission" value="goPass">
				<input type="hidden" id="activityID" name="activityID" >
				<button type="submit" class="btn btn-primary">確認</button>
			</div>
		</div>
	</div>
</div>
</FORM>


</FORM>


<script>
var i=1;
var dataArray ;
var item ;
var activityID;

window.onload = function(){

//		document.getElementById("county").addEventListener("change",function (){
//			var county = document.getElementById("county");
		
//		});
	$("#country").change(function (){
		var country = document.getElementById("country");
//		alert("選擇縣市："+country.value);
		$.getJSON("<%=request.getContextPath()%>/AreaServlet.do?mission=getCountry",{'country':country.value},sendCounty);
		$.getJSON("<%=request.getContextPath()%>/AreaServlet.do?mission=getCountryAttr",{'country':country.value},sendAttraction);		
	});
	
	$("#county").change(function (){
		var county = document.getElementById("county");
//		alert("選擇區域："+county.value);
		$.getJSON("<%=request.getContextPath()%>/AreaServlet.do?mission=getCounty",{'county':county.value},sendAttraction);
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
				var dataImg=$("<b class=dataImg></b>").html("<img src='data:image/png;base64,"+dataArray[k].img64+"'height=45px width=60px>");				
				var name = $("<b style='padding-left:10px;font-size:20px;'></b>").text(dataName);
				item = $("<div class='item'></div>").append([dataImg,name]);
				item.attr("id",dataID);
				
				if(type[0].match(dataArray[k].type)){
					attr.append(item);
					console.log(array[k].name);
					$('#attr>div').css("background-image","url('../image/trip1.png')");
					$('#attr>div').css("color","#007500");
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
					$('#rest>div').css("background-image","url('../image/rest1.png')");
					$('#rest>div').css("color","#0000C6");
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
					$('#stay>div').css("background-image","url('../image/stay1.png')");
					$('#stay>div').css("color","#EAC100");
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


	$(function() {	$("#tabs").tabs({event: "mouseover"});	});

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
    	eventOverlap:true,												//設定事件可否重疊
    	eventBackgroundColor: "	#FFE153",			//設定日曆上所有事件的背景色
    	eventBorderColor:"	#FFE153",						//設定日曆上所有事件的框線色
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
    			
    				$.post('<%=request.getContextPath()%>/Calendar.do?mission=insertSCH',{"events":JSON.stringify(eventObject)},function(scheduleID){
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
        			
    		$.post('<%=request.getContextPath()%>/Calendar.do?mission=updateSCH',{"events":JSON.stringify(eventObject)},function(scheduleID){
        			console.log(period);
        	});
				
			},

    	//columnHeader:false,
		defaultView: 'agendaDay',
		header:{
		    left:   'newDay,removeDay',
		    center: '',
		    right:  'reset,check'
		},
		eventClick: function(id){
			var eventID=id.id
			console.log(schID);
			$('#calendar').fullCalendar('removeEvents',eventID);
			//alert("id=" + eventID);
			$.post('<%=request.getContextPath()%>/Calendar.do?mission=deleteSCH',{"eventID":eventID});		

			
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
		        removeDay: {
		            text: '刪除一天',
		            click: function(){
			            var I=null;
			            var T=null;
			            I='day'+i;
			            T='DAY '+i;
			            $('#calendar').fullCalendar('removeResource', { id:I, title:T});
			           	i=i-1;           		
		            }
		        },
		        reset: {
		            text: '重新排程',
		            click: function(){
		            	$('#calendar').fullCalendar('removeEvents');
		            	for(var i=0;i<schID.length;i++){
		            		$.post('<%=request.getContextPath()%>/Calendar.do?mission=deleteAll',{"eventID":schID[i]},function(scheduleID){
		    				schID.splice(i,1);
		    				});
		    				console.log("已刪除此項行程");				    				
		            	}
		            }
		        },
		        check:{
			    	text:'預覽行程',
			    	click:function(){
			    		if($('#actName').val()==""){
			    			alert("請輸入行程名稱!!");
			    		}else{
			    			var actName = $('#actName').val();
			    			$.post('<%=request.getContextPath()%>/Calendar.do?mission=insertACT',{actName:actName},function(actID){
			    				activityID = actID
			    				for(var i=0;i<schID.length;i++){
			    					console.log(actID+";"+schID[i]);
			    					$.post('<%=request.getContextPath()%>/Calendar.do?mission=updateSCH2',{"actID":actID,"schID":schID[i]},function(){
			    						console.log(schID+"歸入"+actID);
			    					});
			    						$('#activityID').attr("value",actID);
			    						$('#pass').modal();
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
	
	
	//設定日期最多3日，最少1日
	$('#calendar button').eq(1).attr('disabled',"true");
	$('#calendar button').eq(0).click(function(){
		if(i>=3){
			$('#calendar button').eq(0).attr('disabled',"true");
		}
		});
	$('#calendar button').eq(1).click(function(){
		if(i<3){
			$('#calendar button').eq(0).removeAttr('disabled');
		}
		});
	$('#calendar button').eq(1).click(function(){
		if(i==1){
			$('#calendar button').eq(1).attr('disabled',"true");
		}
		});
	$('#calendar button').eq(0).click(function(){
		if(i!=1){
			$('#calendar button').eq(1).removeAttr('disabled');
		}
		});
})


</script>
</body>

</html>