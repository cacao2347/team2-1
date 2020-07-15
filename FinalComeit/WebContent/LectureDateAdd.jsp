<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureDateAdd.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp%>/assets/css/blog-post.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/studyCreate.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<!-- 헤더 -->
<div class="row">
	<div class="col-md-12"></div>
</div>
<!-- row -->

<div class="container-fluid">

	<!-- 스터디 개설 문구 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="boardName">
				<h1>모임 날짜 등록</h1>
				<hr />
			</div>
		</div>
		<div class="col-md-2"></div>
	</div>

<!-- 리스트 -->
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	
	<div class="boardName">
		<h2>날짜를 선택하세요.</h2>
		<hr>
	</div>
	
	<div>
		<c:import url="Calendar.jsp"></c:import>
	</div>
	
	
	<br><br>
	
	
	<div class="boardName">
		<h2>장소와 시간을 선택하세요.</h2>
		<hr>
	</div>
	
	
	
	<!-- 모임지역 -->
		<div class="areaMemNum">
			<h4>모임지역</h4>
			<select name="area" id="area" class="area form-control">
				<option value="0">지역</option>
				<option value="seoul">서울</option>
				<option value="incheon">인천</option>
			</select> <select name="spcArea" id="spcArea" class="spcArea form-control">
				<option value="0">상세 지역</option>
				<option value="mapogu">마포구</option>
				<option value="seogu">서구</option>
			</select>


			<div class="period">
				<h4>장소명</h4>
				<input type="text"
					class="keyInput form-control" id="keyInput"
					placeholder="ex) 직접 입력..." />
			</div>
			<!-- end . period -->

			<div class="period">
				<h4>주소</h4>
				<input type="text"
					class="keyInput form-control" id="keyInput"
					placeholder="ex) 직접 입력..." />
			</div>
			<!-- end . period -->

			<div class="meetTime">
				<h4>모임시간</h4>
			</div>
			<!-- end .weekTitle -->
			<div class="weekDay">
				<select name="week" id="week" class="weekSel form-control">
					<option>선택</option>
					<option value="moring">오전</option>
					<option value="afternoon">오후</option>
				</select> <select name="hour" id="hour" class="weekSel form-control">
					<option>선택</option>
					<option value="1">1시</option>
					<option value="2">2시</option>
					<option value="3">3시</option>
				</select> <select name="min" id="min" class="weekSel form-control">
					<option>선택</option>
					<option value="10">10분</option>
					<option value="20">20분</option>
					<option value="30">30분</option>
				</select> <input type="button" value="추가" class="weekBtn btn btn-primary" />

			</div>
		</div>
			<!-- end .weekDay -->
		<br><br>	
			<!-- end .col-md-8 -->
		<div class="col-md-4">
			<div class="button">
				<div class="upload">
					<input type="submit" value="모임날짜 등록하기" class="btn btn-primary" />
				</div>
				<!-- end .upload -->
			</div>
			<!-- end .button -->

		</div>
		
	</div>

</div>
<!-- end .container-fluid -->

<!-- 푸터 -->
<div class="row">
	<div class="col-md-12"></div>
</div>
</body>
</html>