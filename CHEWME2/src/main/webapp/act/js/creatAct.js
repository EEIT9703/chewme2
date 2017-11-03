$(document).ready(function() {

	// 結束
	$("#EDate").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yy-mm-dd",
		minDate: new Date()
	});

	// 出發
	$("#BDate").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yy-mm-dd",
		minDate: new Date()
	});

	// 選擇上架
	$("#activity_state").selectmenu();
	
	//判斷旅行名稱
	$('#act_name').blur(function() {
		var act_name = $(this).val();
		console.log(act_name);
		if (act_name.trim() == "") {
			console.log(act_name);
			$('#act_name+font').text('請輸入旅行名稱');
		}
		
		//^[0-9]{4}/(((0[13578]|(10|12))/(0[1-9]|[1-2][0-9]|3[0-1]))|
		//(02/(0[1-9]|[1-2][0-9]))|((0[469]|11)/(0[1-9]|[1-2][0-9]|30)))$

/*		$.get('/CHEWME2/activityServlet.do?action=Updata', {'act_name' : $(this).val()}, 
				function(data) {
			// data會收到server回傳的結果
			// alert(data);
			console.log(data);
			$('#act_name+font').after(data);

		});*/
	});
	
	//判斷旅行人數
	$('#act_groups').blur(function(){
		var act_groups = $(this).val();
		var re = new RegExp(/^[\d]+$/);
			if(act_groups.trim() == ""){
				console.log(act_groups);
				$('#act_groups+font').text('旅行人數不能為空');
			}else if(!re.test(act_groups)){
				console.log(act_groups);
				$('#act_groups+font').text('旅行人數只能為數字');
			}
	});
	
	//判斷日期
	$('#BDate').change(function(){
		var BD = $(this).datepicker('getDate');
		//var BDate = $(this).val();
		BD = $.datepicker.formatDate('yy-mm-dd',BD)
		console.log(BD);
		var nowDate = new Date();
		console.log(nowDate);
		var re = new RegExp(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
		if(BD == ""){
			console.log(BD);
			$('#BDate+font').text('出發日期不能為空');
		}else if(!re.test(BD)){			
			$('#BDate+font').text('日期格式為yyyy-MM-dd');
		}
	});
	
	//判斷日期
	$('#EDate').change(function(){
		var ED = $(this).datepicker('getDate');
		//var BDate = $(this).val();
		ED = $.datepicker.formatDate('yy-mm-dd',ED)
		console.log(ED);
		var nowDate = new Date();
		console.log(nowDate);
		var re = new RegExp(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
		if(ED == ""){
			console.log(ED);
			$('#BDate+font').text('出發日期不能為空');
		}else if(!re.test(ED)){			
			$('#BDate+font').text('日期格式為yyyy-MM-dd');
		}
	});
	
	//判斷旅行人數
	$('#act_price').blur(function(){
		var act_groups = $(this).val();
		var re = new RegExp(/^[\d]+$/);
			if(act_groups.trim() == ""){
				console.log(act_groups);
				$('#act_price+font').text('價格不能為空');
			}else if(!re.test(act_groups)){
				console.log(act_groups);
				$('#act_price+font').text('價格只能為數字');
			}
	});

	// 觸發actID,帶入資料到<input>
	$("#actID").change(function() {
		var actID = $(this).val();
		console.log(actID);
		$.getJSON('/CHEWME2/act/actServlet?action=getOne_For_Update', {'actID' : actID
		}, function(data) {
			// actID = JSON.parse(data);
			console.log(data);
			$('#act_name').val(data.act_name);
			$('#act_groups').val(data.act_groups);
			$('#act_current').val(data.act_current);
			$('#BDate').val(data.BDate);
			$('#EDate').val(data.EDate);
			$('#act_price').val(data.act_price)
			$('#activity_state').val(data.activity_state);

		});
	});

	// 送出更新資料
	/*$('#submit').click(function() {
		console.log("3345678");
		var formData = new FormData($('form')[0])
		$.ajax({
			type : "POST",
			url : "/CHEWME2/activityServlet.do?action=Next",
			success : function(data) {
				// swal('更新成功', 'Hello World!', 'success');
				alert(3345678);				
					$('#act_name').val(data.act_name);
					$('#act_groups').val(data.act_groups);
					$('#BDate').val(data.BDate);
					$('#EDate').val(data.EDate);
					$('#activity_state').val(data.activity_state);
				

			},
			error : function(data) {
				alert(data);
			},
			data : formData,
			contentType : false,
			processData : false
		});
	});*/
	
});
// 送出更新資料
// $('#submit').click(function() {
// var afrm = $('form[name="actForm"]');
// //console.log(afrm)
// $.post('/CHEWME2/activityServlet.do?action=Updata',afrm.serialize(), function(data) {
// swal('更新成功', 'Hello World!', 'success');

// $('#act_name').val(data.act_name);
// $('#act_groups').val(data.act_groups);
// $('#BDate').val(data.BDate);
// $('#EDate').val(data.EDate);
// $('#activity_state').val(data.activity_state);
// });
// });
