<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>StudyDateAdd.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyDateAdd.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container-fluid">
	<!-- 회차 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<h1>2020년 6월 7회차</h1>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 회차 영역 -->
	
	<!-- 박스 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="box">
				<div class="meetDate">
					<h3>날짜를 선택하세요<span class="ePoint">*</span></h3>
				</div>
				<div class="meetDateSel">
				<select name="" id="" class="form-control meetYear">
					<option value="year1">java</option>
					<option value="year2">oracle</option>
					<option value="year3">jsp</option>
					<option value="year4">spring</option>
				</select>
				
				</div>
				
			</div><!-- end .box -->
		
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 박스 영역 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 버튼 영역 -->
</div><!-- end .container-fluid -->

</body>
</html>