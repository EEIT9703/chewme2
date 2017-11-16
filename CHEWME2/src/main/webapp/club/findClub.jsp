<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHEWME 揪社團</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="css/mystyle.css">

<script src="../js/jquery-3.2.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="js/findClubScript.js"></script>
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%></header>
	<%-- <jsp:getProperty name="clubList"/> --%>
	<div class="container">
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">社團名單</div>
			<div class="panel-body" style="padding: 0;">
			

				<div class="container">
					<form id="findClubForm"
						action="clubClientView.do?action=chooseClub" method="POST">
						<ul class="list-group">
							<c:forEach var="club" items="${club_list}">
								<div class="row">
									<div class="col-sm-12 col-md-12">${club.clubName}</div>
									<div class="col-sm-6 col-md-2">
										<img id="img_${club.clubId}" src="" class="img-responsive">
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

			<!-- List group -->




		</div>
	</div>


</body>
</html>