<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊會員</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery.min.js"></script>

</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>
	<div class="container">
		<div class="row main">
			<div class="panel-heading">
				<div class="panel-title text-center">
						<h3>
					<a href="<%=request.getContextPath()%>/member/login.jsp">LoginMe</a>,or RegisterMe
				</h3>
				</div>
			</div>
			<div class="main-login main-center">
				<form class="form-horizontal" method="post" action="register.do"
					name="memform" id="memform" enctype="multipart/form-data">


					<div class="form-group">
						<label>帳號:</label> <input type="text" class="form-control"
							name="memberId" value="${param.memberId}"><small><font
							size="-1" color="#FF0000">${MsgMap.IDEmpty}${MsgMap.errorIDDup}</font></small>
					</div>
					<div class="form-group">
						<label>真實姓名:</label> <input type="text" class="form-control"
							name="memName" value="${param.memName}"><small><font
							size="-1" color="#FF0000">${MsgMap.NameEmpty}${MsgMap.NameFormatError}</font></small>
					</div>
					
					<div class="form-group">
						<label>暱稱:</label> <input type="text" class="form-control"
							name="memNickN" value="${param.memNickN}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.NickNEmpty}</Font></small>
					</div>
					
										<div class="form-group">
						<label>密碼:</label> <input type="password" class="form-control"
							name="memPwd" value="${param.memPwd}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.PswdEmpty}</Font></small>
					</div>

					<div class="form-group">
						<label>生日:</label> <input type="date" class="form-control"
							name="memBirthday" value="${param.memBirthday}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.BirthdayEmpty}</Font></small>
					</div>

					<div class="form-group">
						<label>信箱:</label> <input type="text" class="form-control"
							name="memMail" value="${param.memMail}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.MailEmpty}${MsgMap.MailFormatError}</Font></small>
					</div>

					<div class="form-group">
						<label>地址:</label> <input type="text" class="form-control"
							name="memAddr" value="${param.memAddr}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.AddrEmpty}</Font></small>
					</div>

					<div class="form-group">
						<label>電話:</label> <input type="text" class="form-control"
							name="memPhone" value="${param.memPhone}"><small><Font
							color='red' size="-3">&nbsp;${MsgMap.PhonerEmpty}</Font></small>
					</div>

					<div class="form-group">
						<label>自我介紹:</label>
						<textarea class="form-control" name="memIntr"
							style="resize: none;">${param.memIntr}</textarea>
						<small><Font color='red' size="-3">&nbsp;${MsgMap.IntrEmpty}</Font></small>
					</div>
					<div class="form-group">
						<label class="btn btn-info" for="inputfile"> <input
							id="inputfile" name="memPhoto" style="display: none;" type="file"
							value="${param.memPhoto}"> <i class="fa fa-folder-open-o"></i>
							上傳圖片
						</label>
					</div>
					<div align="center">
						<input type="hidden" name="action" value="insert">
						<button type="submit" class="btn btn btn-primary">送出</button>
						<button type="reset" class="btn btn btn-primary">重填</button>
					</div>
				</form>
			</div>
			<img id="img" src="" class="img-responsive" width="300" height="300">
		</div>
	</div>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script src="js/dialog.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/js/jquery.imgareaselect.pack.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/club/js/createClub.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/com-resource/js/imgSelAndUpload.js"></script>
	<script>
		$(function() {
			// 預覽圖片
			$("#inputfile").change(function() {

				readImage(this);
			});

			function readImage(input) {
				if (input.files && input.files[0]) {
					var file = input.files[0];
					var FR = new FileReader();
					FR.onload = function(e) {
						// e.target.result = base64 format picture
						$('#img ').attr("src", e.target.result);
						var url = e.target.result;

					};
					FR.readAsDataURL(input.files[0]);
				}
			} // 預覽圖片結束
		})
	</script>


</body>
</html>