/**
 * upload the pic;
 */
// 選擇我們要的canvas
var mycanvas;
var ctx;
var dataURL;
var image;
var ias;
$(document).ready(function() {
	// 選擇我們要的canvas
	mycanvas = $("#myCanvas");
	ctx = mycanvas[0].getContext("2d");
	// 生成一個image空間來儲存我們要的空間
	image = new Image();

	// 此方法為設定我們設定我們image內部值

	// 創造一個圖形區域
	imgAreaInit($('#img'));
	// 設定一個input eventlistener;
	inputChangeEventListener($("#uploadImage"));					
	// img select後把圖片讀到canvas
	imgAreaSelectAndReadEventListener($('#img'));

	$("#submit")
			.on("click",function() {
						$("#uploadImage")
								.after(
										"<textarea type='text' name='uploadImage' id='newImage'></textarea>")
								.remove();
						$('#newImage').val(dataURL);
						$('#createClubForm').submit();
					})

				})

