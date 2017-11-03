

window.onload = function(){
 	$('#vt1').verticalTimeline();
 	$('#vt2').verticalTimeline();
 	$('#vt3').verticalTimeline();
	
	if($("title").text() == "Create_Activity"){		
		actID = $("activityVO").text(); 
	}else{		
		//var actID=${actID}
	}
	
	console.log(acID);
	$.get("/CHEWME2/Schedule.do?mission=getActName",{'actID':actID},function(actName){
		console.log(actName);
		$('#name').html(actName+"的行程明細");
	});
	
 	$.getJSON("/CHEWME2/Schedule.do?mission=getTrip",{'actID':actID},showTimeLine);

	function showTimeLine(array){

		console.log(array.length);
		var maxDay = array[array.length-1].scheduleData.dayNo;
		var k=0;
	
		for (var i = k; i < array.length; i++) {			
				
			var name = $("<p id='name'></p>").append(array[i].name);
			var tel = $("<p id='tel'></p>").append(array[i].tel);
			var addr = $("<p id='addr'></p>").append(array[i].address);
			var intro = $("<p id='intro'></p>").append(array[i].intro);
			var photo = $("<p></p>").html("<img src='data:image/png;base64,"+array[i].img64+"'height=200px>")
					photo.attr("id", "photo");
			var period = $(	"<span id='period' class='vtimeline-date'></span>").append(array[i].scheduleData.period);
			var attrpoint = $(	"<div id='period' class='vtimeline-content'></div>").append([ name, tel, addr, intro, photo ]);
					attrpoint.attr("data-vtdate", period);
			var block = $("<div class='vtimeline-block'></div>").append([ period, attrpoint ])
			var point = $("<div class='vtimeline-point'></div>").append(block);
					point.attr("id", array[i].attractionID);
			
			switch(array[i].scheduleData.dayNo){
			
			case 1:
				var day = $("#day1").append("DAY - 1");
				$("#vt1").append(point);
				break;
			case 2:
				var day = $("#day2").append("DAY - 2");
				$("#vt2").append(point);
				break;
			case 3:
				var day = $("#day3").append("DAY - 3");
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
	}
