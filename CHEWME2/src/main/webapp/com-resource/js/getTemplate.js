/**
 * 
 */
var template;
var template2;
var template3;
var template4;
var template5;
function getTemp(){
	$.get("testFile.jsp",{},function(data){
		console.log("in the get function");
		template = data;
	})
		$.get("testFile.jsp",{},function(data){
		console.log("in the get function");
		template = data;
	})
		$.get("testFile.jsp",{},function(data){
		console.log("in the get function");
		template = data;
	})
}



$(document).ready(function(){
	$.when(getTemp()).then(startToBuildTemplate);

	console.log(template);

})
function startToBuildTemplate(){
	 createTemplate();
	 createTemplate();
	 createTemplate();
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
}

function createTemplate(){
	console.log("in the createTemplate");
	$('#test').prepend(template);
}

