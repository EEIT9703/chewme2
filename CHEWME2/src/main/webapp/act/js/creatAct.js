$(function() {

	// 結束
	$("#EDate").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yy-mm-dd"
	});

	// 出發
	$("#BDate").datepicker({
		changeMonth : true,
		changeYear : true,
		dateFormat : "yy-mm-dd"
	});

	// 選擇上架
	$("#activity_state").selectmenu();

	// 觸發actID,帶入資料到<input>
	$("#actID").change(function() {
		var actID = $(this).val();
		console.log(actID);
		$.getJSON('/CHEWME2/activityServlet.do?action=getOne_For_Update', {'actID' : actID
		}, function(data) {
			// actID = JSON.parse(data);
			console.log(data);
			$('#act_name').val(data.act_name);
			$('#act_groups').val(data.act_groups);
			$('#act_current').val(data.act_current);
			$('#BDate').val(data.BDate);
			$('#EDate').val(data.EDate);
			$('#activity_state').val(data.activity_state);

		});
	});

	$('#act_name').blur(function() {
		var act_name = $(this).val();
		console.log(act_name);
		if (act_name == null) {
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
	$('#act_groups').blur(function(){
		var act_groups = $(this).val();
		var re = act_groups.match(/^[0-9]+$/);
			if(act_groups == ""){
				console.log(act_groups);
				$('#act_groups+font').text('請輸入旅行人數');
			}else if(re == null){
				console.log(act_groups);
				$('#act_groups+font').text('旅行人數只能為數字');
			}
	})

	// 送出更新資料
	$('#submit').click(function() {
		var formData = new FormData($('form')[0])
		$.ajax({
			type : "POST",
			url : "/CHEWME2/activityServlet.do?action=Updata",
			success : function(data) {

				// swal('更新成功', 'Hello World!', 'success');
				// alert(3345678);
				if (data.trim == 'ok') {
					$('#act_name').val(data.act_name);
					$('#act_groups').val(data.act_groups);
					$('#BDate').val(data.BDate);
					$('#EDate').val(data.EDate);
					$('#activity_state').val(data.activity_state);
				}

			},
			error : function(data) {
				alert(data);
			},
			data : formData,
			contentType : false,
			processData : false
		});
	})
});
// 送出更新資料
// $('#submit').click(
// function() {
// var afrm = $('form[name="actForm"]');
// //console.log(afrm)
// $.post('/CHEWME2/activityServlet.do?action=Updata',
// afrm.serialize(), function(data) {
// swal('更新成功', 'Hello World!', 'success');

// $('#act_name').val(data.act_name);
// $('#act_groups').val(data.act_groups);
// $('#BDate').val(data.BDate);
// $('#EDate').val(data.EDate);
// $('#activity_state').val(data.activity_state);
// });
// });
