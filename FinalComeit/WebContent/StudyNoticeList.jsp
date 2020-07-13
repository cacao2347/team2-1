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
<title>StudyNoticeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyNoticeList.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


</head>
<body>

<div class="container-fluid">
<!-- 	<div class="row">
		<div class="col-md-2">
		</div> 
		<div class="col-md-8">
			<div class="main">
				<input type="radio" name="tabs" id="tab1" class="tab1" checked="checked"/>
				<label for="tab1">공지사항</label>
				
				<input type="radio" name="tabs" class="tab2" id="tab2" />
				<label for="tab2">모임날짜 정하기</label>
				
				<input type="radio" name="tabs" class="tab3" id="tab3"/>
				<label for="tab3">캘린더</label>
				
				<input type="radio" name="tabs" class="tab4" id="tab4"/>
				<label for="tab4">산출물 관리</label>
				
				<input type="radio" name="tabs" class="tab5" id="tab5"/>
				<label for="tab5">모임장소 정하기</label>
				
				<input type="radio" name="tabs" class="tab6" id="tab6"/>
				<label for="tab6">투표</label>
		
			</div>end.main
		</div>end .col-md-8
		<div class="col-md-2">
		</div> 
	</div>end .row
	 -->
	<div class="row searchRow">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="col-md-2">
				<select name="" id="" class="form-control">
				<option value="title">제목</option>
				<option value="author">작성자</option>
				</select>
			</div>
			<div class="col-md-8">
				<input type="text" id="" class="searchBox form-control" placeholder="검색어를 입력하세요."/>
			</div>
			<div class="col-md-2">
				<button type="button" class="search btn btn-dark">검색</button>
			</div>
			
			
		</div><!-- end .col-md-8 -->
		<div class="col-md-2">
		</div>
	</div><!-- end .row .searchRow -->
	
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 container">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>2020.07.02 회의 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-02</td>
						<td>5</td>
					</tr>
					<tr>
						<td>2</td>
						<td>2020.07.03 과제입니다.</td>
						<td>김길동</td>
						<td>2020-07-03</td>
						<td>5</td>
					</tr>
					<tr>
						<td>3</td>
						<td>2020.07.04 뷰페이지 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-04</td>
						<td>5</td>
					</tr>
					<tr>
						<td>4</td>
						<td>2020.07.05 회의 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-05</td>
						<td>5</td>
					</tr>
					<tr>
						<td>5</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
					<tr>
						<td>6</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
					<tr>
						<td>7</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
					<tr>
						<td>8</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
					<tr>
						<td>9</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
					<tr>
						<td>10</td>
						<td>2020.07.02 과제 진행 사항 입니다.</td>
						<td>김길동</td>
						<td>2020-07-06</td>
						<td>5</td>
					</tr>
				</tbody>
		</table>
		
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- end .row -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<div class="paging"> 
				<ul class="pagination">
				<li class="page-item"><a href="#" class="page-link">Previous</a></li>
				<li class="page-item"><a href="#" class="page-link">1</a></li>
				<li class="page-item"><a href="#" class="page-link">2</a></li>
				<li class="page-item"><a href="#" class="page-link">3</a></li>
				<li class="page-item"><a href="#" class="page-link">4</a></li>
				<li class="page-item"><a href="#" class="page-link">5</a></li>
				<li class="page-item"><a href="#" class="page-link">6</a></li>
				<li class="page-item"><a href="#" class="page-link">7</a></li>
				<li class="page-item"><a href="#" class="page-link">8</a></li>
				<li class="page-item"><a href="#" class="page-link">9</a></li>
				<li class="page-item"><a href="#" class="page-link">10</a></li>
				<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
			</div>
			<div class="col-md-2">
				<button type="button" class="add btn btn-dark">등록</button>
			</div>
			
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- end .row -->
</div><!-- end .container-fluid -->

</body>
</html>