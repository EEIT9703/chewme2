var cell1;
var template;

function getTemp(){
	$.get("cube.jsp", {}, function(data){
		template = data;
		console.log(template);		
	})
}
$(function(){
	$.when(getTemp()).then(startToBuildTemplate);
	
})
function startToBuildTemplate(){		
	$('#div1').prepend(template);
	
}
$("#button1").click(function(){
	loadempty();
	var name = $("#tags").val();
	var opt = $("#div1");
	$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(array){		
		$.each(array, function(i, attr_val){
			
			var cell1 = $('<span></span>').addClass("text1").text(attr_val.name);
			//console.log(attr_val.name);
			var row = $("<td></td>").addClass("span1");
			
			row.append(cell1);
			
			opt.append(row);
		})
	})
})
function loadempty(){
	var opt = $("#div1");
	opt.empty();
}
