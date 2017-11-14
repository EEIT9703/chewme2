<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header><%@ include file="/index.jsp"%></header>
	<div align="center">
			<button type="submit" class="btn btn btn-primary" data-toggle="modal"
				data-target="#myModal">點此重設密碼</button>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">重設密碼</h4>
				</div>
				<form action="resetPassword.do" method="post">
					<div class="modal-body">
						帳號：<input type="text" name="userName" value="${param.userName}"
							readonly="readonly" /><br /> 新密碼：<input type="password"
							name="newPassword" /><br />
						確認新密碼：<input type="password" name="newPassword2" /><br />
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">關閉
						</button>
						<button type="submit" class="btn btn-primary">提交更改</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>