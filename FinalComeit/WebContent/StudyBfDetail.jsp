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
<title>StudyBfDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyBfDetail.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>



</head>
<body>

<div class="row">
	<div class="col-md-12">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">COME-IT</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">스터디</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">프로젝트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">강의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">장소</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유게시판</a>
          </li>                   
        </ul>
      </div>
    </div>
  </nav>
	</div>
</div>

<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		<img class="img-fluid rounded study-img" src="assets/images/study2.jpg" alt="">
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-5">

		<div class="form-inline">
				<h1 class="title">F반 스터디방</h1>
			<a><button type="button" class="btn report">신고</button></a>
           <button type="button" class="btn btn-primary">참가</button>
		</div>
		
		<br />
		<h5 class="sub-title">활동 기간</h5>
		<p class="content">2020-01-16 ~ 2020-07-15 / 6개월</p>
		<h5 class="sub-title">활동 지역</h5>
		<p class="content">서울 마포구</p>
		<h5 class="sub-title">키워드</h5>
		<p class="content">JavaScript / HTML / CSS/ JQuery</p>
		<h5 class="sub-title">예상 레벨</h5>
		<p class="content">초급</p>
		<h5 class="sub-title">상세 설명</h5>
		<p class="content">
		스터디의 상세 설명 영역입니다.
		스터디장이 수정할 수 있는 영역이며, <br />
		우리 스터디가 어떤 공부를 하게 될 지 
		상세하게 작성할 수 있습니다. 
		</p><br />
		
		
		</div>
		<div class="col-md-3">
			<div class="row">
				<div class="col-md-12">
				<h5 class="sub-title member">스터디장</h5>
				<div class="form-inline">
					<div class="memImg">
					<img alt="Bootstrap Image Preview" src="assets/images/hjkim.PNG" class="rounded-circle profileImg" />
					</div>
					<div class="memName">
					<p class="content">김길동</p>
					</div>
				</div><!-- end .form-inline -->
			
				</div>
			</div>
			<div class="row study-member">
				<div class="col-md-12">
				<h5 class="sub-title member2">스터디원</h5>
				<div class="form-inline">
					<div class="memImg">
					<img alt="Bootstrap Image Preview" src="assets/images/khjang.PNG" class="rounded-circle profileImg" />
					</div>
					<div class="memName">
					<p class="content">장길동</p>
					</div>
				</div>
			
				
				<div class="form-inline">
					<div class="memImg">
					<img alt="Bootstrap Image Preview" src="assets/images/sjsong.PNG" class="rounded-circle profileImg" />
					</div>
					<div class="memName">
					<p class="content">송길동</p>
					</div>
				</div>
			
				
				<div class="form-inline">
					<div class="memImg">
					<img alt="Bootstrap Image Preview" src="assets/images/jmshin.PNG" class="rounded-circle profileImg" />
					</div>
					<div class="memName">
					<p class="content">신길동</p>
					</div>
				</div>
			
				<div class="form-inline">
					<div class="memImg">
					<img alt="Bootstrap Image Preview" src="assets/images/hschoi.PNG" class="rounded-circle profileImg" />
					</div>
					<div class="memName">
					<p class="content">최길동</p>
					</div>
				</div>
			
				</div>
			</div>
		</div>
		
		<div class="col-md-2">
		</div>
		
	</div>
</div>

<div class="row">
	<div class="col-md-12">
	</div>
</div>

</body>
</html>