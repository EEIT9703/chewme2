/**
 * 
 */
var template1;
var template2;
var template3;
var template4;


$(document).ready(function() {
	var fun1 = $.get("testFile.jsp", {})
	var fun2 = $.get("_commentTemplate.jsp", {})
	var fun3 = $.get("_issueTemplate.jsp", {})

	$.when(fun1,fun2,fun3).then( function(data1,data2,data3) {
		template1 = data1;
		template2 = data2;
		template3 = data3;
		startToBuildTemplate();
	})
})

function startToBuildTemplate() {
	console.log("start to build tmeplate");
	console.log(template1);
	console.log(template2);
	console.log(template3);
	createTemplate();
	
}

function createTemplate() {
	console.log("in the createTemplate");
	$('#test').append(template1).append(template2).append(template3);
}
