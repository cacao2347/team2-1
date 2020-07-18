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
<title>COME-IT</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecturelist.css" >
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecturelist.css" > --%>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>


</head>
<body>
<div class="row">
	<div class="col-md-12">
	<c:import url="header.jsp"></c:import>
	</div>
</div>
			
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<img class="img-fluid rounded study-img" src="assets/images/study2.jpg" alt="studyImg">
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row content">
				<div class="col-md-2">
				</div>
				<div class="col-md-2"><!-- 필터 시작 -->
				<div class="side">
				
					<dl class="region">
						<dt>지역</dt>
						<dd>
							<select name="region" class="form-control">
								<option value="전체">전체</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
							</select>
						</dd>
						  
 						<dd>
							<select name="regDetail" class="form-control">
								<option value="전체">전체</option>
								<option value="마포구">마포구</option>
								<option value="양천구">양천구</option>
							</select>
						</dd>
					</dl><!-- end region -->
					
					<dl class="inwon">
						<dt>인원 수</dt>
						<dd class="radio">
							<label for="all">
							<input type="radio" id="all" name="inwon" value="전체" checked="checked">전체
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveDown">
							<input type="radio" id="fiveDown" name="inwon" value="5명 미만">5명 미만
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveUp">
							<input type="radio" id="fiveUp" name="inwon" value="5명 이상">5명 이상 ~ 10명 미만
							</label>
							
						</dd>
						<dd class="radio">
							<label id="tenUp">
							<input type="radio" id="tenUp" name="inwon" value="10명 이상">10명 이상
							</label>
							
						</dd>
					</dl><!-- end inwon -->
				
				</div><!-- end side -->
				</div><!-- 필터 끝 -->
				
				<!-- 본문 영역 -->
				<div class="col-md-6">
				
					<!-- 검색 영역 -->
					<div class="row">
						<div class="col-md-4">
							<div class="form-inline search">
								<input type="text" class="form-control tag" id="tag" placeholder="기술 태그" style="width:100%">
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-inline search text-right">
								<select class="form-control">
									  <option>제목</option>
									  <option>강사명</option>
								</select>
								<input type="text" class="form-control title" id="title" placeholder="강의 제목">
								<button type="button" class="btn btn-primary searchBtn">검색</button>
							</div>
						</div>
					</div>
					
					
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						99개의 강의
						</div>
						<div class="col-md-12">
						<ul class="list-study">
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/basic.png">
								</div>
								<div class="item-body">
								<div class="firstLine">
									<div class="listTitle">
										<h4 class="study-title" style="font-weight: bold;">한 달만에 마스터 하는 자바</h4>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<h5 class="study-date">2020-06-16 ~ 2020-07-15</h5>
										<h5 class="study-term">1개월</h5>
									</div>
									<div class="col-md-6 text-right">
										<h5 style="color: red;">300,000원</h5>
									</div>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 강사 서팔광</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 월, 수</li>
									<li class="numb"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> 13시~15시</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">Java</li>
									<li class="stack-item">Oracle</li>
									<li class="stack-item">잘가르침</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/basic.png">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">Python 초급과정</h4>
								<div class="form-inline">
									
									<div class="row">
										<div class="col-md-6">
											<h5 class="study-date">2020-05-16 ~ 2020-08-15</h5>
											<h5 class="study-term">3개월</h5>
										</div>
										<div class="col-md-6 text-right">
											<h5 style="color: red;">140,000원</h5>
										</div>
									</div>
									
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 강사 추득만</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 영등포구</li>
									<li class="numb"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 목, 금</li>
									<li class="numb"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> 13시~15시</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">Python</li>
									<li class="stack-item">초심자</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/basic.png">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">웹 사이트 만들기</h4>
								
								<div class="row">
									<div class="col-md-6">
										<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
										<h5 class="study-term">6개월</h5>
									</div>
									<div class="col-md-6 text-right">
										<h5 style="color: red;">300,000원</h5>
									</div>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 강사 곽팔의</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 토, 일</li>
									<li class="numb"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> 13시~15시</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">Java</li>
									<li class="stack-item">Oracle</li>
									<li class="stack-item">JavaScript</li>
									<li class="stack-item">HTML</li>
									<li class="stack-item">CSS</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/basic.png">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">C++로 게임 만들기</h4>
								
								<div class="row">
									<div class="col-md-6">
										<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
										<h5 class="study-term">6개월</h5>
									</div>
									<div class="col-md-6 text-right">
										<h5 style="color: red;">1,800,000원</h5>
									</div>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 강사 권필쌍</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 일</li>
									<li class="numb"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> 13시~15시</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">C++</li>
									<li class="stack-item">게임제작</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/basic.png">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">침팬지도 이해하는 Java배우기</h4>
								
								<div class="row">
									<div class="col-md-6">
										<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
										<h5 class="study-term">6개월</h5>
									</div>
									<div class="col-md-6 text-right">
										<h5 style="color: red;">800,000원</h5>
									</div>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 강사 도엽철</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> 화, 수, 목</li>
									<li class="numb"><span class="glyphicon glyphicon-time" aria-hidden="true"></span> 13시~15시</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">Java</li>
									<li class="stack-item">침팬지	</li>
								</ul>
								</div>
							</li>
						</ul>
						
						</div>
					</div><!-- 리스트 영역 끝 -->
					
					<div class="row">
					<div class="col-md-12">
						<div class="create">
							<button type="button" class="btn btn-primary btn-sm createBtn">강의 개설</button>
						</div>
					</div>
					</div>
						
					
					<!-- 페이징 영역 -->
					<div class="row paging">
					<div class="col-md-12">
						<nav>
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
						</nav>
					</div>
					</div><!-- 페이징 영역 끝 -->
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	<c:import url="footer.jsp"></c:import>
	</div>
</div>
</body>
</html>