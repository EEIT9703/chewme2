$(document).ready(function() {
	    
	     //生成一個image空間來儲存我們要的空間
	     var image = new Image();
	
	    //編輯器
        $('#summernote').summernote();
        
        //上傳圖片
        $("#upload").change(function() {
			
			readImage(this);
		});
        
        function readImage(input) {
			if (input.files && input.files[0]) {
				var file = input.files[0];
				var FR = new FileReader();
				FR.onload = function(e) {
					$('#img ').attr("src", e.target.result);
					var url = e.target.result;
					setImageURL(url);
				};
				FR.readAsDataURL(input.files[0]);
			}
		}
        function setImageURL(url) {
			image.src = url;
		}
        
        $('subimt')

    });