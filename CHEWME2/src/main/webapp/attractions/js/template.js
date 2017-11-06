
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
	var name = $("#tags").val();
	$.getJSON("/CHEWME2/attractions/SearchServlet?action=search1", {"searchbar": name}, function(data){
		console.log(data);
	})
})
