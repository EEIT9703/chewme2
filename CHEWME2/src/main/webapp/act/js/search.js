$(document).ready(function() {

	

	$('#search').click(function() {
		var search = $("#text").val();
		console.log(search);
		// var div1 = document.querySelector('#div1');
		$('#div1').empty();
		
		getTemp();
		function getTemp() {
			$.get("searchR.jsp", {}, function(data) {
				console.log("in the get function");
				template = data;
				console.log(data);				
				$('#div1').prepend(template);
			})
		}
		$.getJSON('/CHEWME2/act/actServlet?action=Search', {
			'search' : search
		}, function(data) {
			console.log(data);
			$.each(data, function(i, data) {
				getTemp();
				var cell1 = $('#act_name').val(data.act_name);
				var cell2 = $('#act_groups').val(data.act_groups);
				var cell3 = $('#act_photo').html(data.act_photo);
				var row = $('#div1').append([ cell1, cell2 ,cell3 ]);
				$('#div1').prepend(row);

			})

		})

	})

})