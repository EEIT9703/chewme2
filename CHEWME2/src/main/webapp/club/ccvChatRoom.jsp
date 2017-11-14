<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/clubwebSocket.js"></script>

<div id="messageDisplay" style="width: 80%; height: 400px;border=solid:1px:black;overflow:scroll;"></div>


<div>
	<form id="chatRoomForm" onsubmit="return false;">
		
	<!-- 	<input type="text" id="userNameInput" /> <input type="button"
			id="loginBtn" value="登入" /> --> 
			<span id="infoWindow"></span> <input
			type="text" id="userinput" /> <input type="submit" value="送出訊息" />
	</form>
</div>