/**
 * 
 */
var template;
var template2;
var template3;
var template4;
var template5;

var fun1 = $.get("testFile.jsp", {}, function(data) {
	console.log("in the get function");
	template = data;
})
var fun2 = $.get("testFile.jsp", {}, function(data) {
	console.log("in the get function");
	template2 = data;
})
var fun3 = $.get("testFile.jsp", {}, function(data) {
	console.log("in the get function");
	template3 = data;
})

$(document).ready(function() {
	$.done(fun1,fun2,fun3).then(startToBuildTemplate());
	$.when(fun1,fun2,fun3).then(startToBuildTemplate());

})
function startToBuildTemplate() {
	console.log(template);
	createTemplate();
	createTemplate();
	createTemplate();
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
}

function createTemplate() {
	console.log("in the createTemplate");
	$('#test').prepend(template);
}
