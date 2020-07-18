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
<title>LectureStudentDetail.jsp</title>
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/lectureprofessordetail.css">
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap"
	rel="stylesheet">

<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$("#member1").mouseover(function() {
			$("#stuMemInfo").css('display', 'block');
		});
		$("#member1").mouseleave(function() {
			$("#stuMemInfo").css('display', 'none');
		});
		/* 
		
		$("#member2").mouseover(function() 
		{
			$("#stuMemInfo2").css('display', 'block');	
		});
		$("#member2").mouseleave(function() 
		{
			$("#stuMemInfo2").css('display', 'none');
		});
		 */

	});
</script>


</head>
<body>

	<!-- 헤더 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>

	<!-- 바디 -->
	<div class="container-fluid">

		<!-- 스터디방 이미지 -->
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<img src="<%=cp%>/assets/images/study2.jpg" alt="" class="stuImg" />
			</div>
			<div class="col-md-2"></div>
		</div>

		<!-- 방 정보 및 팀원 정보 -->
		<div class="row">
			<div class="col-md-2"></div>
			<!-- 방 정보 -->
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<!-- 스터디방 제목 -->
						<div class="stuTitle">

							<div class="row">
								<div class="col-md-10">
									<h2 class="title" style="font-weight: bold;">한 달안에 자바 마스터 되기</h2>		
								</div>
										
								<div class="col-md-2">
									<img src="<%=cp%>/assets/images/report.png" alt="" class="report" onclick="" />									
								</div>
							</div>
							
							<hr />

						</div>
						<!-- end.stuTitle -->


						<!-- 스터디방 정보 -->
						<div class="stuInfo">
							<!-- 활동 기간 -->
							<div class="stuTerm">
								<span class="glyphicon glyphicon-pencil"></span>
								<h3 class="lecIntro">강의 소개</h3><br>
								<h3>
								자바를 처음 접하거나, 프로그래밍 첫 발을 자바로 내딛으려는 분을 위한 코드스쿼드 신재민 마스터의 강의. 
								학습 방법부터 코칭받으며 배울 수 있기에 더이상 자바가 무섭지 않아요! 코드스쿼드의 마스터즈 코스 
								화이트 레벨을 수강하기 전에 준비단계로 수강하면 더욱 좋습니다.
								</h3>
							</div>
							<!-- end stuTerm -->

							<!-- 활동 지역 -->
							<div class="stuArea">
								<span class="glyphicon glyphicon-map-marker icon"></span>
								<h3>활동 지역</h3>
								<br /> <span class="area">서울시 마포구</span>
							</div>
							<!-- end .stuArea -->

							<!-- 키워드 -->
							<div class="stuKey">
								<span class="glyphicon glyphicon-tags icon"></span>
								<h3>키워드</h3>
								<br> <span class="keword">Java / Oracle / JSP /
									Spring</span>
							</div>
							<!-- end .stuKey -->

							<!-- 예상 레벨 -->
							<div class="stuLevel">
								<span class="glyphicon glyphicon-calendar icon"></span>
								<h3>강의 일자</h3>
								<br> <span class="level">2020-06-19~2020-07-18</span>
								<br> <span class="level">화, 목</span>
							</div>

							<!-- 상세 설명 -->
							<div class="stuCurr">
								<span class="glyphicon glyphicon-user icon"></span>
								<h3>강의 인원</h3>
								<br /> 
								<span class="curr"> 
									강의 최소 개설 인원 : 3명 <br>
									강의 최대 인원 : 5명
								</span>
							</div>
							
							<div class="lecMoney">
								<span class="glyphicon glyphicon-shopping-cart icon"></span>
								<h3>수강료</h3>
								<br /> 
								<span class="curr"> 
									300,000 원
								</span>
							</div>
							
							<!-- 버튼 영역 -->
							<div class="text-right">
								<input type="button" value="강의 결제" class="btn btn-lg btn-primary join" />
							</div>

						</div>
						<!-- end .stuInfo -->
					</div>
					<!-- end .col-md-8 -->

				</div>
				<!-- end .row -->

			</div>
			<!-- end .col-md-8 -->

			<div class="col-md-2"></div>
		</div>
		<!-- end .row -->


	</div>
	<!-- end .container-fluid -->

	<!-- 푸터 -->
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"></div>
		<div class="col-md-2"></div>
	</div>
</body>
</html>