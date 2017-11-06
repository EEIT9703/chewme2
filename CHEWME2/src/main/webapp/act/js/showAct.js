$(document).ready(function() {
	setAllImg();
	function setAllImg() {
		var thsImg;
		var idString;
		thsImg = $('#sch img');
		idString = $('#sch img').attr("id");

		console.log(idString);
		$.get('/CHEWME2/getImageInChewme.do', {
			"type" : "sch_photo",
			"id" : idString,
			"queryMethod":"charQuery"
		}, function(data) {
			console.log(data);
			console.log(thsImg);
			thsImg.attr("src", data);
			
		})

	}

})