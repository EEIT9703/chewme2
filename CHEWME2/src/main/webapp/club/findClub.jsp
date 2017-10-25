<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CHEWME_找社團</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/mybootstrap.css">
<link rel="stylesheet" href="css/mystyle.css">
</head>
<body>
	<header>
		<%@ include file="../header.jsp"%></header>
	<%-- <jsp:getProperty name="clubList"/> --%>
	<div class="container">

		<div class="row">
			<div class="col-md-3">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true">
						Dropdown <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-9">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" type="button"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true">
						Dropdown <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">社團名單</div>
			<div class="panel-body">
				<p>...</p>
			</div>

			<!-- List group -->

			<div>
				<form id="findClubForm" action="findClub.do" method="POST">
					<ul class="list-group">
						<c:forEach var="club" items="${club_list}">
							<div class="row">
								<div class="col-md-12">${club.clubName}</div>
								<div class="col-md-2">pic</div>
								<div class="col-md-8">${club.brief}</div>
								<div class="col-md-2">
									<button type="submit" class="btn btn-primary btn-sm"
										name="cchosen" value="The ClubId ${club.clubId} is chosen">點入觀看</button>
								</div>
							</div>
						</c:forEach>
					</ul>
				</form>
			</div>



		</div>
	</div>

	<script src="../js/jquery-3.2.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="js/findClubScript.js"></script>
</body>
</html>