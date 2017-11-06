/**
 * 
 */
var template;
$(document).ready(function(){
	getTemp();

})

function getTemp(){
	$.get("testFile.jsp",{},function(data){
		console.log("in the get function");
		template = data;
		console.log(data);
		console.log(template);
		$('#test').prepend(template);
	})

	
}