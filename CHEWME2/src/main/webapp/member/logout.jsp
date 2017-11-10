<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
</head>
<body>
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="LoginOK" scope="session" />
<c:remove var="SysManager" scope="session" />
<%
  session.invalidate();
%>
<c:redirect url="/index.jsp"/>
</body>
</html>