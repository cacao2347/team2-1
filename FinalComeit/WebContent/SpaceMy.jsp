<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceMy.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/space-manage.css">


</head>
<body>
<c:import url="header.jsp"></c:import>

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-6">

		<div class="form-inline">
				<h1 class="title">Mypage</h1>
		</div>
		
		<br />
		<c:import url="SpaceMytab.jsp"></c:import>
		
		
		</div>
		<div class="col-md-2">
			<div>
				<div class="col-md-12">
				<h4 class="sub-title member">내 정보</h4><hr>
				<div class="form-inline">
					<div class="memName">
					<h5>이름</h5>
					<p class="content">김길동</p>
					<h5>아이디</h5>
					<p class="content">길동12</p>
					<h5>전화번호</h5>
					<p class="content">010-1111-1111</p>
					<h5>이메일</h5>
					<p class="content">hhh@test.com</p>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">정보수정</button>
			
				</div>
			</div>
		</div>
		
		
	</div>
</div>

<div class="row">
	<div class="col-md-12">
	</div>
</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>