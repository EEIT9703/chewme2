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
<script
	src="<%=request.getContextPath()%>/com-resource/js/mychatroom.js"></script>
<script
	src="<%=request.getContextPath() %>/chatroom/js/openWebSocket.js"></script>
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%>
	</header>

	<p hidden id="requestContextPath"><%=request.getContextPath() %></p>
	<div class="container">
		<div class="row col-md-6 col-md-offset-2 custyle">
			<div class="col-md-9">
				<div>
					<div class="page-header">
						<h3>我的資料</h3>
					</div>
					<div>
						<form action="memEditor.do">
							<table>
								<tr>
									<td><c:choose>
											<c:when test="${  empty LoginOK.memPhoto && empty picUri}">
												<img src='<%=request.getContextPath()%>/image/nophoto.png'
													style="border-radius: 50%" width=50px height=50px>
											</c:when>
											<c:when test="${ ! empty LoginOK.memPhoto }">
												<img src='data:image/png;base64,${LoginOK.memPhoto}'
													style="border-radius: 50%" width=50px height=50px>
											</c:when>
											<c:otherwise>
												<img src='${picUri}' style="border-radius: 50%" width=100px
													height=100px>
											</c:otherwise>
										</c:choose></td>
								</tr>
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
									<td>自我介紹:${LoginOK.memIntr }</td>
								</tr>
							</table>
							<input type="hidden" name="memId" value="${LoginOK.memId }">
							<input type="hidden" name="action" value="update">
							<button
								onclick="location.href='<%=request.getContextPath()%>/member/memeditor.jsp'">修改</button>
						</form>
					</div>
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
			</div>
		</div>
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
	    		  var cell2 = $('<td></td>').html("<a href='<%=request.getContextPath()%>/club/clubClientView.do?action=chooseClub&clubId="
																				+ smc.clubId
																				+ "'>"
																				+ smc.clubName
																				+ "</a>")
														var row = $('<tr></tr>')
																.append(
																		[
																				cell1,
																				cell2 ]);

														fragment.append(row);
													});
									$('#memClubTable>tbody').html(fragment);
								})
			}
		})
	</script>
</body>
</html>