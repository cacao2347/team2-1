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
<title>StudyNoticeDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studynoticedetail.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container-fluid">

	<!-- 상세내용 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table detail">
				<tr>
					<th>제목</th>
					<td colspan="6">공지사항 제목</td>
				</tr>
				<tr class="tit">
					<th>작성자</th>
					<td>홍길동</td>
					<th>작성일</th>
					<td>2020-06-18</td>
					<th>조회수</th>
					<td>22</td>
				</tr>
				<tr class="content">
					<td colspan="6">상세내용 영역</td>
				</tr>
				<tr>
					<td colspan="6">이전글 : 공지사항의 아홉 번째 게시글 제목입니다.</td>
				</tr>
				<tr>
					<td colspan="6">다음글 : 없음</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="repBtn">
				<button type="button" class="btn btn-link">
				신고
				</button>
			</div>
			
			<div class="btns">
				<div class="leftBtn">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary">
						목록
					</button>
				</div>
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 버튼 영역 끝-->
	
	<!-- 댓글 목록 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 reList">
			<div class="count">
			댓글 2
			</div>
			<table class="table">
				<tr>
					<td class="reTop">
						<h4>홍길동</h4>
						<h5>2020-06-19 01:05:53</h5>
						<button type="button" class="btn btn-link repBtn">신고</button>
						<p>
							등록된 댓글 노출 영역입니다.
						</p>
					</td>
				</tr>
				<tr>
					<td class="reTop">
						<h4>홍길동</h4>
						<h5>2020-06-19 01:05:53</h5>
						<button type="button" class="btn btn-link repBtn">신고</button>
						<button type="button" class="btn btn-link delBtn">삭제</button>
						<p>
							등록된 댓글 노출 영역입니다.
						</p>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<!-- 댓글 등록 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
			<table class="table re">
				<tr class="reAdd">
					<th class="reTh">댓글내용 * </th>
					<td class="textArea">
					<textarea rows="3" class="form-control text"></textarea>
					</td>
					<td class="addBtn">
					<button type="submit" class="btn btn-primary btn-lg">등록</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

</body>
</html>