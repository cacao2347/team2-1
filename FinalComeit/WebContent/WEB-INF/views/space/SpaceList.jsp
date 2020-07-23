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

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/spacelist.css" >
</head>
<body class="padding">
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
</div>
			
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<img class="img-fluid rounded study-img" src="assets/images/cafe07.jpg" alt="studyImg">
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
					
					<dl class="region">
						<dt>유형</dt>
						<dd>
							<select name="region" class="form-control">
								<option value="전체">전체</option>
								<option value="카페">카페</option>
								<option value="스터디">스터디카페</option>
							</select>
						</dd>
					</dl>
					
					<dl class="inwon">
						<dt>시간</dt>
						<dd class="radio">
							<label for="all">
							<input type="radio" id="all" name="inwon" value="전체" checked="checked">전체
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveDown">
							<input type="radio" id="fiveDown" name="inwon" value="5명 미만">3시간 미만
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveUp">
							<input type="radio" id="fiveUp" name="inwon" value="5명 이상">3시간 이상 ~ 5시간 미만
							</label>
							
						</dd>
						<dd class="radio">
							<label id="tenUp">
							<input type="radio" id="tenUp" name="inwon" value="10명 이상">5시간 이상
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
								<input type="text" class="form-control tag" id="tag" placeholder="키워드" style="width: 150px;">
							    <button type="button" class="btn btn-primary searchBtn" style="width: 60px;">검색</button>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-inline search text-right">
								<select class="form-control">
									  <option>공간명</option>
									  <option>상호명</option>
								</select>
								<input type="text" class="form-control title" id="title">
								<button type="button" class="btn btn-primary searchBtn">검색</button>
							</div>
						</div>
					</div>
					
					
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						99개의 공간
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="create">
									<button type="button" class="btn btn-primary btn-sm createBtn" onClick="location.href='spacreate.action'">공간 개설</button>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 30px;">
						 <div class="item">
                    <ul class="thumbnails" style="list-style:none;" >
                        <li class="col-sm-4 col-md-6" >	
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-4 col-md-6">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-4 col-md-6">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                        <li class="col-sm-4 col-md-6">
							<div class="fff">
								<div class="thumbnail">
									<a href="#"><img src="http://placehold.it/360x240" alt=""></a>
								</div>
								<div class="caption">
									<h4>Praesent commodo</h4>
									<p>Nullam Condimentum Nibh Etiam Sem</p>
									<a class="btn btn-mini" href="#">» Read More</a>
								</div>
                            </div>
                        </li>
                    </ul>
              </div><!-- /Slide3 --> 
        </div>
						
						</div>
					</div><!-- 리스트 영역 끝 -->
					
					
						
					
					<!-- <div class="row paging">
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
					</div> -->
					
				</div>
				
			</div>
			
		</div>
</div>
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>