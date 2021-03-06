/**
 * 
 */
function imgOnload(targetImage) {
	targetImage[0].onload = function() {
		console.log("show img width");
		$('#dialog-img').width($(this).width());
		dialog.dialog({
			draggable: false,
			"width" : $(this).width() + 20
		});
	};
}

function imgAreaInit(targetImage) {
	ias = targetImage.imgAreaSelect({
		instance : true
	});
	ias.setOptions({
		show : true
	});
	ias.update();
}
// 讀取input的Image到img canvas
function readImage(input) {
	if (input.files && input.files[0]) {
		var file = input.files[0];
		var FR = new FileReader();
		FR.onload = function(e) {
			// e.target.result = base64 format picture
			$('#img').attr("src", e.target.result);
			var url = e.target.result;
			setImageURL(url);
		};
		FR.readAsDataURL(input.files[0]);
	}
}
function imgAreaSelectAndReadEventListener(imgAreaS) {
	imgAreaS.imgAreaSelect({	
		handles : true,
		x1 : 0,
		y1 : 0,
		x2 : 0,
		y2 : 0,
		onSelectEnd : function(img, selection) {
			console.log("in imgAreaSelectAndReadEventListener");
			image = $("#img")[0];
			var height = selection.y2 - selection.y1;
			var width = selection.x2 - selection.x1;
			// ctx.clearRect(0, 0, mycanvas.width,
			// mycanvas.height);
			// setWidthHeight(width, height)
			setWidthHeight(width, height);
			canvasDrawImage(img, selection.x1, selection.y1, width, height);
			dataURL = mycanvas[0].toDataURL('image/jpeg');
			// console.log(dataURL);
		}
	});
}
function setWidthHeight(width, height) {
	ctx.canvas.height = height;
	ctx.canvas.width = width;

}
function canvasDrawImage(img, x, y, w, h) {

	ctx.drawImage(img, x, y, w, h, 0, 0, w, h);

}
function setImageURL(url) {
	image.src = url;
}

function inputChangeEventListener(input) {
	input.change(function() {
		readImage(this);
		console.log("upload the image")
		console.log($('#img')[0].clientWidth)
		$('dialog-img').attr("height", $('#img ').attr("clientWidth")).attr(
				"width", $('#img ').attr("clientWidth"))
		$("#img-help-block").text("請截取圖片想要之部分");
	});
}

// var data=mycanvas[0].toDataURL();

// dataURL 的格式为
// “data:image/png;base64,****”,逗号之前都是一些说明性的文字，我们只需要逗号之后的就行了
// data=data.split(',')[1];
// data=window.atob(data);
// var ia = new Uint8Array(data.length);
// for (var i = 0; i < data.length; i++) {
// ia[i] = data.charCodeAt(i);
// };
// canvas.toDataURL 返回的默认格式就是 image/png
// var blob=new Blob([ia], {type:"image/png"});

/*
 * function SaveCropEventHandler() { var x1 = $('input[name="x1"]').val(); var
 * x2 = $('input[name="x2"]').val(); var y1 = $('input[name="y1"]').val(); var
 * y2 = $('input[name="y2"]').val();
 * 
 * if (x1.length == 0 && x2.length == 0 && y1.length == 0 && y2.length == 0) {
 * alert('請選擇裁剪區域'); return false; } else { $.ajax({ type: 'post', url:
 * '@Url.Action("CropImage", "Home")', data: { id: $('#UploadImage_ID').val(),
 * x1: x1, x2: x2, y1: y1, y2: y2 }, dataType: 'json', async: false, cache:
 * false, success: function (result) { if (result) { if (result.result != 'OK') {
 * alert(result.msg); window.location.href = '@Url.Action("Crop", "Home")' +
 * '?id=' + $('#UploadImage_ID').val(); } else { alert('裁剪完成');
 * $('img#Image3').attr('src', result.CropImage); $('img#Image3').show(); }
 * return false; } } }); } }
 */
// $('#ButtonCrop').click(function() {
// SaveCropEventHandler();
// });
