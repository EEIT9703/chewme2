 $(function(){
	
	loadActivity();

	function loadActivity(){		
		$.getJSON('<%=request.getContextPath()%>/ShoppingCar?action=getMyCars',{},function(array){
        var fg = $(document.createDocumentFragment());
	 		var opt = $(".cartrows");
	 			opt.empty();
			var count=0;
	 		$.each(array,function(i,activity){
	 			var img ="data:image/png;base64,"+activity.act_photo;
	 			var div_out=$("<div></div>").addClass('cartrow');
	 		
	 			var cell1=$("<div></div>").css("float","left");
	 			var img =$('<img width=50px height=50px >').attr('src',img);
	 			
	 			
	 			var span1=$('<span></span>').text(activity.act_name)
	 			var button = $('<button id="opop"></button>').css('color','red').addClass('close glyphicon glyphicon-remove').attr({'type':'button','name':activity.actID});
	 			var span2=$('<span></span>').append(button)			
	 			var cell2=$("<div></div>").append([span1,span2])	
	 			var cell3=$("<div></div>").text("$5888")
	 			
	 			cell1.append(img);
	 			div_out.append([cell1,cell2,cell3]);
	 			fg.append(div_out);
	 			count++;
	 		})
	 		$('.aaa').text(count);
	 		$('.cartrows').append(fg);
	 		
		})
			
			
	}
		

	
	$('.cartrows').on('click','button',function(){
		var actID=$(this).attr('name');
	
		$.post('<%=request.getContextPath()%>/ShoppingCar?action=deleteCar',{"actID":actID},loadActivity);
	
	
	})
	

	
	$('#div1').on('click','button',function(){
		var id = $(this).parent().parent().parent().parent().parent().find('input').attr('id')
		$.getJSON('<%=request.getContextPath()%>/ShoppingCar?action=inputCar',{'ID' : id}, result);
	})
		function result(array) {
			$.each(array, function(i, result) {
				if (result.existColl == "已加入購物車") {
					alert(result.existColl)
				} else {
					alert(result.inputOK)
					loadActivity();
				}
			})

		}



	})