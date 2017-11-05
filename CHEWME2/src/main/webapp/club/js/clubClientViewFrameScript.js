var sel = $();
var reqContextPath;

$(document).ready(function() {
	reqContextPath = $('#reqContextPath').text();
	$("#tabs").tabs();
	getTemplates();
	createForum();
	setClubImg();
	console.log(reqContextPath);
	console.log($("#clubIdforView").text());

})

function setClubImg() {
	var thsImg;
	$.each($("#carouselExampleControls img"), function() {
		console.log(this.id.substring(4));
		thsImg = this;
		$.get(reqContextPath + '/getImageInChewme.do', {
			"type" : "clubPic",
			"id" : this.id.substring(4)
		}, function(data) {
			// console.log(data);
			console.log(this);
			$(thsImg).attr("src", data);
			
		})
	})
}
