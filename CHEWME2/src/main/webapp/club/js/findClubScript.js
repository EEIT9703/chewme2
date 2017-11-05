$(document).ready(function() {

	var form = $("#findClubForm");
	// $("form img").each(function();
	// );
	// attr("src",function(){
	// $.get('/getImageInChewme.do',{"type":"clubPic","id":})
	// <%=request.getContextPath()
	// %>/getImageInChewme.do?type=clubPic&id=${club.clubId}"
	// class="img-responsive">
	// }
	setAllImg();
	function setAllImg(){
		var thsImg;
		$.each($("form img"), function() {
			console.log(this.id.substring(4));
			thsImg = this;
			$.get('/CHEWME2/getImageInChewme.do', {
				"type" : "clubPic",
				"id" : this.id.substring(4)
			}, function(data) {
				//console.log(data);
				console.log(this);
				$(thsImg).attr("src",data);
			})
		})	
	}
})
