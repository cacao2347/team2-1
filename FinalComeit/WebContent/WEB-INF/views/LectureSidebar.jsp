<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String args = (String) request.getAttribute("args");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */

/* 사이드바 */
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 100%;
	margin-left: -30px;
	margin-top: 50px
}
/* 본문 */
.page {
	margin-top: 50px;
	margin-left: 250px;
}

/* footer */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
</style>
</head>
<body>

	<div class="container-fluid">

		<!-- 사이드바 -->
		<nav class="col-sm-3 sidenav">
			<h4>
				<img class="img-fluid img-square myimg" src="assets/images/IU.jpg"
					alt="myimg" style="width: 180px; height: 200px;">
			</h4>
			<ul class="nav nav-pills nav-stacked">
				<li class="active" style="text-align: center;">${profInfo.name } 님의 프로필</li>
				<li style="text-align: center;">◎85cm</li>
				<li><textarea name="" id="" cols="20" rows="5">강사이력
						${profInfo.career }
				</textarea></li>
				<li>강사소개</li>
				<li><textarea name="" id="" cols="20" rows="10">
						${profInfo.prof_intro }
  						</textarea>
  				</li>
			</ul>
		</nav>
	</div>

</body>
</html>