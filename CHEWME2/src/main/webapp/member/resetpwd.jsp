<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="resetPassword.do" method="post">
		帳號：<input type="text" name="userName" value="${param.userName}"
			readonly="readonly" /><br /> 新密碼：<input type="password"
			name="newPassword" /><span class="error">${errors.newPassword }</span><br />
		確認新密碼：<input type="password" name="newPassword2" /><span
			class="error">${errors.newPassword2 }</span><br /> <input
			type="submit" value="修改" />
	</form>
</body>
</html>