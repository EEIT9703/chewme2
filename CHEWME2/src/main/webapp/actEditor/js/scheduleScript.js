
//var actID=${actID};
	$('#vt1').verticalTimeline();

window.onload = function(){
	var actID = $("#activityVO").text();
	$.get("/CHEWME2/Schedule.do?mission=getActName",{'actID':actID},function(actName){
		console.log(actName);
		$('#name').html(actName+"的行程明細");
	});
	
 	$.getJSON("/CHEWME2/Schedule.do?mission=getTrip",{'actID':actID},showTimeLine);
	//這裡有問題
	function showTimeLine(array){
		var dataArray = array;
		console.log(array.length);
		
		for(var i=0;i<array.length;i++){
			
			console.log(dataArray[i].scheduleData.period);
			var name =  $("<p id='name'></p>").append(dataArray[i].name);
			var tel =  $("<p id='tel'></p>").append(dataArray[i].tel);
			var addr =  $("<p id='addr'></p>").append(dataArray[i].address);
			var intro =  $("<p id='intro'></p>").append(dataArray[i].intro);
			var photo = $("<p></p>").html("<img src='data:image/png;base64,"+dataArray[i].img64+"'height=200px>")
					photo.attr("id","photo");
			
			var period =  $("<span id='period' class='vtimeline-date'></span>").append(dataArray[i].scheduleData.period);
			
			var attrpoint = $("<div id='period' class='vtimeline-content'></div>").append([name,tel,addr,intro,photo]);
					attrpoint.attr("data-vtdate",period);
					
			var block=$("<div class='vtimeline-block'></div>").append([period,attrpoint])
			
			var point=$("<div class='vtimeline-point'></div>").append(block);
			point.attr("id",dataArray[i].attractionID);
			$("#vt1").append(point);
			
			if(i%2==0){
				block.attr("class","vtimeline-block vtimeline-left");
			}else{
				block.attr("class","vtimeline-block vtimeline-right");
			}

			
		}
	}
}
	
