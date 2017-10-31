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
		  <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="237459292600-4nc82k5o9iq1caepr82fsukrcpsflah0.apps.googleusercontent.com">
	
</head>
<body onload="myFunction()">
<!-- 先將使用者名稱取出 -->
<c:set var="memName" value="${ LoginOK.memName }" />
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="LoginOK" scope="session" />
<c:remove var="SysManager" scope="session" />
<!-- <!-- 下列六行敘述設定登出後要顯示的感謝訊息 --> -->
<%-- <c:set var="logoutMessage" scope="request"> --%>
<!-- <font color='blue' ><BR> -->
<%-- 訪客${ memName }，感謝您使用本系統。<BR> --%>
<!-- 您已經登出<BR> -->
<!-- </font> -->
<%-- </c:set> --%>
<%
  session.invalidate();
%>
<script src="https://apis.google.com/js/platform.js" async defer></script>
   <script>
      function myFunction() {
      gapi.auth2.getAuthInstance().disconnect();
      location.reload();
   }
   </script>
<jsp:forward page="/index.jsp"/>
</body>
</html>