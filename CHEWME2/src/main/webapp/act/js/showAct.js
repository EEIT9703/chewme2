$(document).ready(function() {
	setAllImg();
	function setAllImg() {
		var thsImg;
		var idString;
		idString = $('#sch img').attr("id");

		console.log(idString);
		$.get('/CHEWME2/getImageInChewme.do', {
			"type" : "sch_photo",
			"id" : idString
		}, function(data) {
			console.log(data);
			//console.log(this);
			$(thsImg).attr("src", data);
		})

	}

})