<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
		String SactID = (String) request.getAttribute("actID");
		Integer actID = Integer.parseInt(SactID);		
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>行程表  ${actID}</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/jquery-ui.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/vertical-timeline.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/actEditor/css/schedule-style.css">


</head>
<body>
	<header><%@include file="../header.jsp"%></header>
	
	<%@include file="schedule3-byhungyu.jsp"%>	
	
	<script src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/vertical-timeline.js"></script>
	<script><%@include file="js/schedulejs-byhungyu.js"%></script>
	
</body>
</html>