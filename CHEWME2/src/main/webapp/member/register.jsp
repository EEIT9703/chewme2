<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page import="com.iii.eeit9703.member.model.*" %>	
<% MemVO memVO=(MemVO) request.getAttribute("memVO");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊會員</title>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>

<script>
	$(function() {
		$("#datepicker").datepicker({
			//可使用下拉式選單 - 月份
			changeMonth : true,
			//可使用下拉式選單 - 年份
			changeYear : true,
			//設定 下拉式選單月份 在 年份的後面
			showMonthAfterYear : true
		});
	});
</script>

</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
		<!--   <nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand " href="#"><img src="/image/letter-c.png" width="30" height="30" alt=""></a>	
		</div>
		<div class="navbar-header">
		<a class="navbar-brand " href="#">CHEWME</a>
		</div>
			
		<ul  class="nav navbar-nav" style="margin-left:50px"  >
			<li><a href="#">Home</a></li>
			<li><a href="#">揪人玩</a></li>
			<li><a href="#">創行程</a></li>
			<li><a href="#">創社團</a></li>

		</ul>

		<ul class="nav navbar-nav navbar-right">
			
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-log-in"></span> 登入</a></li>
			<li><a class="nav-link" href="#"><span
					class="glyphicon glyphicon-registration-mark"></span> 註冊</a></li>
		</ul>
	</div>
	</nav> <nav class="navbar navbar-expand-lg">
	<div class="container-fluid"></div>

	</nav> -->
	</header>
	<c:if test="${not empty errorMsgs }">
	<font>請修正以下錯誤:
	<ul>
	<c:forEach var="message" items="${errorMsgs}">
	<li>${message}</li>
	</c:forEach>
	</ul>
	</font>	
	</c:if>
	<form method="post" action="mem.do" name="memform">
		<table>
			<tr>
				<td>
					<fieldset>
						<legend>個人資料</legend>
						<label>帳號:</label> <input type="text" name="memberId" value="<%=(memVO==null)?"":memVO.getmemberId()%>"><br />
						<label>真實姓名:</label> <input type="text" name="mName" value="<%=(memVO==null)?"":memVO.getmName()%>"><br />
						<label>暱稱:</label> <input type="text" name="mNickN" value="<%=(memVO==null)?"":memVO.getmNickN()%>"><br />
						<label>密碼:</label> <input type="password" name="mPwd" value="<%=(memVO==null)?"":memVO.getmPwd()%>"><br />
						<label>確認:</label> <input type="password" name="mPwdChk" value="<%=(memVO==null)?"":memVO.getmPwd()%>"><br />
					</fieldset>
					<fieldset>
					
						<label>輸入生日:</label> <input type="text" id="datepicker"
							name="mBirthday" value="<%= (memVO==null)?"": memVO.getmBirthday()%>"> <label>輸入信箱:</label> <input
							type="text" name="mMail" value=""><br /> <label>輸入地址:</label>
						<!-- 						<select name="mAddr"> -->
						<!-- 							<option value="台北市">台北市</option> -->
						<!-- 							<option value="新北市">新北市</option> -->
						<!-- 							<option value="桃園市">桃園市</option> -->
						<!-- 							<option value="台中市">台中市</option> -->
						<!-- 							<option value="台南市">台南市</option> -->
						<!-- 							<option value="高雄市">高雄市</option> -->
						<!-- 							<option value="基隆市">基隆市</option> -->
						<!-- 							<option value="新竹市">新竹市</option> -->
						<!-- 							<option value="嘉義市">嘉義市</option> -->
						<!-- 							<option value="新竹縣">新竹縣</option> -->
						<!-- 							<option value="苗栗縣">苗栗縣</option> -->
						<!-- 							<option value="彰化縣">彰化縣</option> -->
						<!-- 							<option value="南投縣">南投縣</option> -->
						<!-- 							<option value="雲林縣">雲林縣</option> -->
						<!-- 							<option value="嘉義縣">嘉義縣</option> -->
						<!-- 							<option value="屏東縣">屏東縣</option> -->
						<!-- 							<option value="宜蘭縣">宜蘭縣</option> -->
						<!-- 							<option value="花蓮縣">花蓮縣</option> -->
						<!-- 							<option value="台東縣">台東縣</option> -->
						<!-- 							<option value="澎湖縣">澎湖縣</option> -->
						<!-- 						</select> -->
						<input type="text" name="mAddr" value="<%=(memVO==null)?"":memVO.getmAddr()%>"><br />
					</fieldset>
					<fieldset>
						<label>輸入電話:</label> <input type="text" name="mPhone" value="<%=(memVO==null)?"":memVO.getmPhone()%>"><br />
						<label>大頭貼:</label> <input type="file" name="mPhoto" value="<%=(memVO==null)?"":memVO.getmPhoto()%>"><br />
						<label>輸入自我介紹:</label>
						<textarea name="mIntr" value="<%=(memVO==null)?"":memVO.getmIntr()%>" cols="40" rows="5"></textarea>
						<br />
					</fieldset>
					<div>
					<tr>
					    <td><input type="hidden" name="action" value="insert">
						<input type="submit" value="送出"></td> 
						<td><input type="reset" value="清除"></td>
						</tr>
					</div>
				</td>
			</tr>
		</table>
	</form>

	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	


</body>
</html>