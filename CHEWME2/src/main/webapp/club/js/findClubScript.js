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
		$.each($("form img"), function() {
			//console.log(this.id.substring(4));
			//thsImg = this;
			var picId = this.id.substring(4);
			console.log('picId'+picId);
			$.get('/CHEWME2/getImageInChewme.do', {
				"type" : "clubPic",
				"id" : picId,
			}, function(data) {
				//console.log(data);
				console.log(this);
				$('#img_'+picId).attr("src",data);
			})
		})	
	}
})
