/**
 * 
 */
var template1;
var template2;
var template3;
var template4;
var template5;

<<<<<<< HEAD

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
=======
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
>>>>>>> branch 'master' of https://github.com/EEIT9703/chewme2.git

})
function startToBuildTemplate() {
<<<<<<< HEAD
	console.log("start to build tmeplate");
	console.log(template1);
	console.log(template2);
	console.log(template3);
	createTemplate();
	
=======
	console.log(template);
	createTemplate();
	createTemplate();
	createTemplate();
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
	$('#test').prepend(template);
>>>>>>> branch 'master' of https://github.com/EEIT9703/chewme2.git
}

function createTemplate() {
	console.log("in the createTemplate");
	$('#test').append(template1).append(template2).append(template3);
}
