$(document).ready(function(){
	
	$('#search').click(function(){
		var search = $("#text").val();
		console.log(search);
		
		$.getJSON('/CHEWME2/act/actServlet?action=Search', {'search' : search},function(data){
			console.log(data);
			$('#act_name').val(data.act_name);
			$('#act_groups').val(data.act_groups);
		})
		
	})
	
})