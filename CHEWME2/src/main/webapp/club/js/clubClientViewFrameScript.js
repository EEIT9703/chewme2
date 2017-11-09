var sel = $();
var reqContextPath;

$(document).ready(function() {
	reqContextPath = $('#reqContextPath').text();
	$("#tabs").tabs();
	getTemplates();
	createForum();
	setClubImg();	
	changePicSet();
	$('#confirmImg').on("click",function(){
		console.log(image);
		$("#carouselExampleControls img:first").attr("src",dataURL);
		console.log($('#clubIdforView').text());
		$.post(reqContextPath+'/club/clubClientView.do',{
			action:"updatePic",
			photo:dataURL,
			clubId:$('#clubIdforView').text(),
		},function(){
			
		})
	})
	
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

function changePicSet(){
	// 選擇我們要的canvas
	mycanvas = $("#myCanvas");
	ctx = mycanvas[0].getContext("2d");
	// 生成一個image空間來儲存我們要的空間
	image = new Image();
	// 創造一個圖形區域選擇器
	imgAreaInit($('#img'));
	inputChangeEventListener($("#uploadImage"));	
	imgAreaSelectAndReadEventListener($('#img'));
	
	
	
}
