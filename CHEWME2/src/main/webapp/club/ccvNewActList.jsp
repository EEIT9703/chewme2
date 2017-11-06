<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">推薦行程</div>
		<div class="panel-body" style="padding: 0;">
			<p>...</p>

			<div class="container">
				<form id="findClubForm" action="clubClientView.do?action=chooseClub"
					method="POST">
					<ul class="list-group">
						<c:forEach var="club" items="${club_list}">
							<div class="row">
								<div class="col-sm-12 col-md-12">${club.clubName}</div>
								<div class="col-sm-6 col-md-2">
									<img id="img_${club.clubId}" src="132" class="img-responsive">
								</div>
								<div class="col-sm-6 col-md-8">${club.brief}</div>
								<div class="col-sm-6 col-md-2">
									<button type="submit" class="btn btn-primary btn-sm"
										name="clubId" value="${club.clubId}">點入觀看</button>
								</div>
							</div>
						</c:forEach>
					</ul>
				</form>
			</div>
		</div>