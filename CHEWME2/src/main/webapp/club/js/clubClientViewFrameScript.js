var sel = $();


$(document).ready(function() {
	$("#tabs").tabs();
	$("#forum-tab").on("click", loadIssues)
})
function loadIssues(){
	$.getJSON("clubClientView.do?action=loadIssues",
			{"now_list_no":"","number":"","prev_or_next":"","choose_date":""},
			function(data){
			console.log(data);
				
			$.each(data, function(){
				
			})	
		});
	
}

	