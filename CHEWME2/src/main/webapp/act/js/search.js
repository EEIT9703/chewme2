var template;

$(document).ready(function() {


	$('#search').click(function() {
		var search = $("#text").val();
		$('#div1').empty();
		console.log(search);
		
		function getTemp() {
			$.get("searchR.jsp", {}, function(data) {			
				template = data;												
			})
		}
		
		$.when(getTemp());
		
		$.getJSON('/CHEWME2/act/ActivitySearch?action=Search', {'search' : search},	function(data) {
			var temp;
			console.log(data);
			$.each(data, function(i, datas) {
				console.log(datas.act_photo);
				$('#div1').append(template);
				$(".img-responsive:last").attr("id","act_photo"+i);
				console.log($("#act_photo"+i));
				$("#act_photo"+i).attr("src",'data:image/png;base64,'+datas.act_photo);
				$(".act_name:last").attr("id","act_name"+i);
				$("#act_name"+i).text(datas.act_name);
				
			})

		})

	})

})