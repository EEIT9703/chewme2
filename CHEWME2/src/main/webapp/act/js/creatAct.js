	$(function() {

			//結束
			$("#EDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "yy-mm-dd"
			});

			//出發
			$("#BDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "yy-mm-dd"
			});
			
			//選擇上架
			$("#activity_state").selectmenu();

			//觸發actID,帶入資料到<input>
			$("#actID").change(function() {
                var actID = $(this).val();
                console.log(actID);
                $.getJSON('/CHEWME2/activityServlet.do?action=getOne_For_Update',{'actID' : actID},function(data) {
			    //actID = JSON.parse(data);
			    console.log(data);
			    $('#act_name').val(data.act_name);
			    $('#act_groups').val(data.act_groups);
			    $('#act_current').val(data.act_current);
				$('#BDate').val(data.BDate);
				$('#EDate').val(data.EDate);
				$('#activity_state').val(data.activity_state);
				
                });
			});
			//送出更新資料
			$('#submit').click(function(){
				var formData= new FormData($('form')[0])
				 $.ajax({
				        type: "POST",
				        url: "/CHEWME2/activityServlet.do?action=Updata",
				        
				        success: function (data) {
				        	swal({
				        		  title: 'Are you sure?',
				        		  text: "You won't be able to revert this!",
				        		  type: 'warning',
				        		  showCancelButton: true,
				        		  confirmButtonColor: '#3085d6',
				        		  cancelButtonColor: '#d33',
				        		  confirmButtonText: 'Yes, delete it!',
				        		  cancelButtonText: 'No, cancel!',
				        		  confirmButtonClass: 'btn btn-success',
				        		  cancelButtonClass: 'btn btn-danger',
				        		  buttonsStyling: false
				        		}).then(function(isConfirm) {
				        		  if (isConfirm === true) {
				        		    swal(
				        		      'Deleted!',
				        		      'Your file has been deleted.',
				        		      'success'
				        		    );
				        		  } else if (isConfirm === false) {
				        		    swal(
				        		      'Cancelled',
				        		      'Your imaginary file is safe :)',
				        		      'error'
				        		    );
				        		  } 
				        		})
								$('#act_name').val(data.act_name);
								$('#act_groups').val(data.act_groups);
								$('#BDate').val(data.BDate);
								$('#EDate').val(data.EDate);
								$('#activity_state').val(data.activity_state);
				        },
				        error:function(){
				        	swal(
				        			  'Good job!',
				        			  'You clicked the button!',
				        			  'error'
				        			)
				        },
				        data: formData,
				        contentType: false,
				        processData: false
				    });
			})
		});
			//送出更新資料
// 			$('#submit').click(
// 					function() {
// 						var afrm = $('form[name="actForm"]');
// 						//console.log(afrm)
// 						$.post('/CHEWME2/activityServlet.do?action=Updata',
// 								afrm.serialize(), function(data) {
// 									swal('更新成功', 'Hello World!', 'success');

// 									$('#act_name').val(data.act_name);
// 									$('#act_groups').val(data.act_groups);
// 									$('#BDate').val(data.BDate);
// 									$('#EDate').val(data.EDate);
// 									$('#activity_state').val(data.activity_state);
// 									});
// 						});