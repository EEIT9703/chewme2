<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.iii.eeit9703.member.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/com-resource/css/scrollbar2.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/chatroom.css">



<style>
.custab {
	border: 1px solid #ccc;
	padding: 5px;
	margin: 5% 0;
	box-shadow: 3px 3px 2px #ccc;
	transition: 0.5s;
}

.custab:hover {
	box-shadow: 3px 3px 0px transparent;
	transition: 0.5s;
}
</style>
<script src="../js/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>

<script src="<%=request.getContextPath()%>/js/chatroom.js"></script>
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/com-resource/js/mychatroom.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/chatroom/js/openWebSocket.js"></script> --%>
<script>document.getElementById("memIntr").value =${LoginOK.memIntr};</script>
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>

<%-- 	<p hidden id="requestContextPath"><%=request.getContextPath()%></p> --%>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-6">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">我的資料</h3>
					</div>
					<div class="panel-body">
						<div class="the-price" align="center">
							<c:choose>
								<c:when test="${  empty LoginOK.memPhoto && empty picUri}">
									<img src='<%=request.getContextPath()%>/image/nophoto.png'
										style="border-radius: 50%" width=150px height=150px>
								</c:when>
								<c:when test="${ ! empty LoginOK.memPhoto }">
									<img src='data:image/png;base64,${LoginOK.memPhoto}'
										style="border-radius: 50%" width=150px height=150px>
								</c:when>
								<c:otherwise>
									<img src='${picUri}' style="border-radius: 50%" width=150px
										height=150px>
								</c:otherwise>
							</c:choose>
						</div>
						<table class="table">
							<tr>
								<td>帳號:${LoginOK.memberId }</td>
							</tr>
							<tr>
								<td>姓名:${LoginOK.memName }</td>
							</tr>
							<tr>
								<td>暱稱:${LoginOK.memNickN }</td>
							</tr>
							<tr>
								<td>密碼:${LoginOK.memPwd }</td>
							</tr>
							<tr>
								<td>生日:${LoginOK.memBirthday }</td>
							</tr>
							<tr>
								<td>信箱:${LoginOK.memMail }</td>
							</tr>
							<tr>
								<td>地址:${LoginOK.memAddr }</td>
							</tr>
							<tr>
								<td>電話:${LoginOK.memPhone }</td>
							</tr>
							<tr>
								<td>自我介紹:${LoginOK.memIntr}</td>
							</tr>
						</table>
					</div>
					<div class="panel-footer">
						<input type="hidden" name="memId" value="${LoginOK.memId }">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn btn-primary"
							data-toggle="modal" data-target="#editorModal">修改</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-md-6">
		<div class="page-header">
			<h3>我的社團</h3>
		</div>
		<!-- 每頁不同的內容從這裡開始 -->
		<input type="hidden" id="memId" value="${LoginOK.memId}">
		<table id="memClubTable" class="table table-striped custab">
			<thead>
				<tr>
					<th>社團編號</th>
					<th>社團名稱</th>
				</tr>
			</thead>
			<tbody align="center">
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
	<div class="modal fade" id="editorModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改</h4>
				</div>
				<div class="modal-body">
					<form method="post" action="memEditor.do" name="memform"
						enctype="multipart/form-data">

						<img id="img_memEditor"
							src="data:image/png;base64,${LoginOK.memPhoto}"
							class="img-responsive" width="150" height="150">
						<div class="form-group">
							<label class="btn btn-info" for="memPhoto_editor"> <input
								id="memPhoto_editor" name="memPhoto" style="display: none;"
								type="file" value="${LoginOK.memPhoto}"> <i
								class="fa fa-folder-open-o"></i> 上傳圖片
							</label>
						</div>
						<div>
							<input type="hidden" name="memId" value="${LoginOK.memId}">
							<input type="hidden" name="memberId" value="${LoginOK.memberId}">
						</div>
						<div class="form-group">
							<label>帳號:</label> <input type="text" class="form-control"
								name="memberId" value="${LoginOK.memberId}" readonly="readonly">
						</div>

						<div class="form-group">
							<label>真實姓名:</label> <input type="text" class="form-control"
								name="memName" value="${LoginOK.memName}"><small><font
								size="-1" color="#FF0000">${MsgMap.NameEmpty}${MsgMap.NameFormatError}</font></small>
						</div>

						<div class="form-group">
							<label>暱稱:</label> <input type="text" class="form-control"
								name="memNickN" value="${LoginOK.memNickN}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.NickNEmpty}</Font></small>
						</div>

						<div class="form-group">
							<label>密碼:</label> <input type="password" class="form-control"
								name="memPwd" value="${LoginOK.memPwd}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.PswdEmpty}</Font></small>
						</div>

						<div class="form-group">
							<label>生日:</label> <input type="date" class="form-control"
								name="memBirthday" value="${LoginOK.memBirthday}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.BirthdayEmpty}</Font></small>
						</div>

						<div class="form-group">
							<label>信箱:</label> <input type="text" class="form-control"
								name="memMail" value="${LoginOK.memMail}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.MailEmpty}${MsgMap.MailFormatError}</Font></small>
						</div>

						<div class="form-group">
							<label>地址:</label> <input type="text" class="form-control"
								name="memAddr" value="${LoginOK.memAddr}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.AddrEmpty}</Font></small>
						</div>

						<div class="form-group">
							<label>電話:</label> <input type="text" class="form-control"
								name="memPhone" value="${LoginOK.memPhone}"><small><Font
								color='red' size="-3">&nbsp;${MsgMap.PhonerEmpty}</Font></small>
						</div>

						<div class="form-group">
							<label>自我介紹:</label>
							<textarea class="form-control" name="memIntr" id="memIntr"
								style="resize: none;"></textarea>
							<small><Font color='red' size="-3">&nbsp;${MsgMap.IntrEmpty}</Font></small>
						</div>
						<div align="center" class="modal-footer">
							<input type="hidden" name="action" value="update">
							<button type="submit" class="btn btn btn-primary">送出</button>
							<button type="reset" class="btn btn btn-primary">重填</button>
						</div>
					</form>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<script src="<%=request.getContextPath()%>/js/jquery-1.12.3.min.js"></script>
	<script>
	$(function(){
		var id=document.getElementById("memId").value;
		loadmemClub(id);   
		   function loadmemClub(id){
		    $.getJSON('<%=request.getContextPath()%>/ListMemClub',{'memId':id},function(datas){
		    	  //datas = [] array
		    	  console.log(datas)
		    	  var fragment = $(document.createDocumentFragment());
		    	  $.each(datas,function(idx,smc){
		    		  //product = {}
		    		  var cell1 = $('<td></td>').text(smc.clubId)
		    		  //var cell2 = $('<td></td>').text(smc.clubName)
		    		  var cell2 = $('<td></td>').html("<a href='<%=request.getContextPath()%>/club/clubClientView.do?action=chooseClub&clubId="+ smc.clubId+ "'>"+ smc.clubName+ "</a>")
		    		  var row = $('<tr></tr>').append([cell1,cell2 ]);
		    		  fragment.append(row);});
		    	  $('#memClubTable>tbody').html(fragment);
		    	  })
			}
		})

		$(function() {
			// 預覽圖片
			$("#memPhoto_editor").change(function() {

				readImage_memeditor(this);
			});

			function readImage_memeditor(input) {
				if (input.files && input.files[0]) {
					var file = input.files[0];
					var FR = new FileReader();
					FR.onload = function(e) {
						// e.target.result = base64 format picture
						$('#img_memEditor ').attr("src", e.target.result);
						var url = e.target.result;
					};
					FR.readAsDataURL(input.files[0]);
				}
			} // 預覽圖片結束
		})
	</script>
</body>
</html>