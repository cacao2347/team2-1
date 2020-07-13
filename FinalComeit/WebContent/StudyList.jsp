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
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studylist.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>


</head>
<body>
<div class="row">
	<div class="col-md-12">
	<%-- <c:import url="header.jsp"></c:import> --%>
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
					<dl class="cat">
						<dt>카테고리</dt>
						<dd><a href="">언어</a></dd>
						<dd><a href="">면접</a></dd>
						<dd><a href="">자격증</a></dd>
						<dd><a href="">기타</a></dd>
					</dl><!-- end cat -->
					
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
					
					<dl class="level">
						<dt>레벨</dt>
						<dd class="checkbox">
							<label id="all">
							<input type="checkbox" id="all" name="all" value="전체" checked="checked">전체
							</label>
						</dd>
						<dd class="checkbox">
							<label id="low">
							<input type="checkbox" id="low" name="low" value="초급">초급
							</label>
						</dd>
						<dd class="checkbox">
							<label id="middle">
							<input type="checkbox" id="middle" name="middle" value="중급">중급
							</label>
						</dd>
						<dd class="checkbox">
							<label id="high">
							<input type="checkbox" id="high" name="high" value="고급">고급
							</label>
						</dd>
					</dl><!-- end level -->
				
				</div><!-- end side -->
				</div><!-- 필터 끝 -->
				
				<!-- 본문 영역 -->
				<div class="col-md-6">
				
					<!-- 검색 영역 -->
					<div class="row">
						<div class="col-md-12">
						<div class="form-inline search">
							<input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
							<input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
							<button type="button" class="btn btn-primary searchBtn">검색</button>
						</div>
						</div>
					</div>
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						99개의 스터디방
						</div>
						<div class="col-md-12">
						<ul class="list-study">
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<div class="firstLine">
									<div class="listTitle">
										<h4 class="study-title" style="font-weight: bold;">[언어] 자바 공부 같이해요</h4>
									</div>
									<div class="lock">
										<h5><span class="glyphicon glyphicon-lock icon" aria-hidden="true"></span></h5>
									</div>
								</div>
								<div class="form-inline">
									<h5 class="study-date">2020-06-16 ~ 2020-07-15</h5>
									<h5 class="study-term">1개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 초급</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 5명</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">Java</li>
									<li class="stack-item">Oracle</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">[자격증] 정보처리기사 필기 같이 공부하실 분</h4>
								<div class="form-inline">
									<h5 class="study-date">2020-05-16 ~ 2020-08-15</h5>
									<h5 class="study-term">3개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 초급</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 영등포구</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 8명</li>
								</ul>
								<ul class="list-study-tags">
									<li class="stack-item">정보처리기사</li>
								</ul>
								</div>
							</li>
							<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">[언어] 웹 풀스택 개발 공부</h4>
								
								<div class="form-inline">
									<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
									<h5 class="study-term">6개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 중급</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 6명</li>
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
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">[언어] 웹 풀스택 개발 공부</h4>
								
								<div class="form-inline">
									<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
									<h5 class="study-term">6개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 중급</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 6명</li>
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
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<h4 class="study-title" style="font-weight: bold;">[언어] 웹 풀스택 개발 공부</h4>
								
								<div class="form-inline">
									<h5 class="study-date">2020-01-16 ~ 2020-07-15</h5>
									<h5 class="study-term">6개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> 중급</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 서울 마포구</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 6명</li>
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
						</ul>
						
						</div>
					</div><!-- 리스트 영역 끝 -->
					
					<div class="row">
					<div class="col-md-12">
						<div class="create">
							<button type="button" class="btn btn-primary btn-sm createBtn">스터디방 개설</button>
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
	<%-- <c:import url="footer.jsp"></c:import> --%>
	</div>
</div>
</body>
</html>