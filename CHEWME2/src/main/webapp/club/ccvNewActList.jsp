<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="panel panel-default">
	<!-- Default panel contents -->
	<div class="panel-heading">推薦行程</div>
	<div class="panel-body" style="padding: 0;">


		<div class="container">
			<form id="findClubForm" action="clubClientView.do?action=chooseClub"
				method="POST">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="row">1</th>
							<td>活動名稱</td>
							<td>預計參加人數</td>
							<td>目前參加人數</td>
							<td>出發日期</td>
							<td>活動截止日期</td>
							<td>活動價格</td>
							<td>活動簡介</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="actVO" items="${clubActList}">
							<tr>
								<td>${actVO.act_name}</td>
								<td>${actVO.act_groups}</td>
								<td>${actVO.act_current}</td>
								<td>${actVO.BDate}</td>
								<td>${actVO.EDate}</td>
								<td>${actVO.act_price}</td>
								<td>${actVO.act_news}</td>
								<td><a type="submit" class="btn btn-primary btn-sm"	name="clubId" value="${actVO.clubId}" role="button">點入觀看</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</div>