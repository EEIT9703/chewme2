<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/sweetalert2.min.js"></script>
<link href="<%=request.getContextPath()%>/css/sweetalert2.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<button type="button" id="test">test</button>
<script type="text/javascript"> 
$(function(){
	$('#test').click(function(){
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
			  } else {
			    // Esc, close button or outside click
			    // isConfirm is undefined
			  }
			})
	})
})

</script>
</body>

</html>