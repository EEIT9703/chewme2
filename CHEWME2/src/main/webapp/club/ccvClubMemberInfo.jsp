<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">社員資訊</div>
	<div class="panel-body" style="padding: 0;">
		<p>...</p>

		<div>
			<form id="findClubForm" action="clubClientView.do?action=chooseClub"
				method="POST">
				<table class="table table-hover">
					<thead>
						<tr>	
							<td></td>
							<td>社員名稱</td>
							<td>社員暱稱</td>
							<td>社員生日</td>
							<td>社員興趣</td>
							<td>社員信箱</td>
							<td>加好友</td>
							<c:if test="${identity == 'club_manager'}">
								<td>社員參加過的活動</td>
							</c:if>
					</thead>
					<tbody>
						<c:forEach var="memVO" items="${MemVOList}">
							<tr>

								<td>${memVO.memId}</td>
								<td>${memVO.memName}</td>
								<td>${memVO.memNickN}</td>
								<td>${memVO.memBirthday}</td>
								<td>${memVO.memIntr}</td>
								<td>${memVO.memMail}</td>
								<td><button type="submit" class="btn btn-primary btn-sm"
										name="addfriend" value="$">加入</button></td>
								<c:if test="${identity == 'club_manager'}">
									<td><button type="submit" class="btn btn-primary btn-sm"
											name="memActs" value="$">參加過之本社活動</button></td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>
								<%-- 
							<th scope="row"></tr>
								
								<%=if((MemberSession)session.getAttribute("LoginOK_MS").get.contain()) --%>