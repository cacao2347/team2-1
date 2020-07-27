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
<meta charset="UTF-8">
<title>StudyFileAdd.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyfileadd.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container-fluid">

	<!-- 상세내용 영역 -->
	<div class="row">
		
		<div class="col-md-12">
			<table class="table detail">
				<tr>
					<th>제목 *</th>
					<td colspan="4">
					<input type="text" class="form-control ntcTitle" id="ntcTitle" value="">
					</td>
				</tr>
				<tr class="tit">
					<th>작성자</th>
					<td>홍길동</td>
					<th>작성일</th>
					<td><input type="text" readonly="readonly" value="현재 날짜"
					style="border: none;"/></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="4">
					<input type="file" class="">
					</td>
				</tr>
				<tr class="content">
					<th>내용 *</th>
					<td colspan="4">
					<textarea class="form-control ntcContent" rows="20"></textarea>
					</td>
				</tr>
			</table>
		</div>
	
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
	
		<div class="col-md-12">
		
			<div class="bottom">
				<div class="errMsg">
					필수 입력항목이 누락되었습니다.
				</div>
				
				<button type="button" class="btn btn-primary btn-lg btm">
					등록
				</button>
			<!-- 	<button type="reset" class="btn btn-lg btm">
					리셋
				</button> -->
			<!-- 	<input type="reset" value="리셋" class="btn btn-lg btm"/> -->
				<button type="button" class="btn btn-lg btm file-cancel">
					취소
				</button>
			
			</div>
		</div>
		
		
	</div><!-- 버튼 영역 끝-->
	
	
</div>

</body>
</html>