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
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function() 
	{
		
		$("#member1").mouseover(function() 
		{
			$("#stuMemInfo").css('display', 'block');	
		});
		$("#member1").mouseleave(function() 
		{
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
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	</div>
	<div class="col-md-2">
	</div>
</div>

<!-- 바디 -->
<div class="container-fluid">
	
	<!-- 스터디방 이미지 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<img src="<%=cp %>/assets/images/study2.jpg" alt="" class="stuImg" />		
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<!-- 방 정보 및 팀원 정보 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<!-- 방 정보 -->
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-8">
					<!-- 스터디방 제목 -->
					<div class="stuTitle">
						<h1 class="title">F반 스터디방</h1>
						<input type="button" value="참가" class="btn btn-lg btn-primary join" />
						<img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
						<%-- <button type="button" class="reportBtn"><img src="<%=cp%>/assets/images/report.png" alt="" class="report"/></button> --%>
						<hr />
					</div><!-- end.stuTitle -->
					
					
					<!-- 스터디방 정보 -->
					<div class="stuInfo">
						<!-- 활동 기간 -->
						<div class="stuTerm">
							<span class="glyphicon glyphicon-calendar icon"></span>
							<h3>활동 기간</h3><br>
							<span class="term">2020-01-16 ~ 2020-07-15&nbsp;&nbsp;&nbsp;&nbsp;6개월</span><br />
							<span class="day">└ 월요일, 수요일</span>		
						</div><!-- end stuTerm -->
						
						<!-- 활동 지역 -->
						<div class="stuArea">
							<span class="glyphicon glyphicon-map-marker icon"></span>
							<h3>활동 지역</h3><br />
							<span class="area">서울시 마포구</span>
						</div><!-- end .stuArea -->
						
						<!-- 키워드 -->
						<div class="stuKey">
							<span class="glyphicon glyphicon-tags icon"></span>
							<h3>키워드</h3><br>
							<span class="keword">Java / Oracle / JSP / Spring</span>
						</div><!-- end .stuKey -->
						
						<!-- 예상 레벨 -->
						<div class="stuLevel">
							<span class="glyphicon glyphicon-blackboard icon"></span>
							<h3>예상 레벨</h3><br>
							<span class="level">중급</span>
						</div>
						
						<!-- 상세 설명 -->
						<div class="stuCurr">
							<span class="glyphicon glyphicon-bookmark icon"></span>
							<h3>상세 설명</h3><br />
							<span class="curr">스터디의 상세 설명 영역입니다.<br>
										   스터디장이 수정할 수 있는 영역이며, 우리 스터디가 어떤 공부를 하게 될 지<br> 
										   상세하게 작성할 수 있습니다.상세 커리큘럼이 적혀 있는 영역입니다.</span>
						</div>
					
					</div><!-- end .stuInfo -->
				</div><!-- end .col-md-8 -->
				
				<!-- 스터디원 정보 -->
				<div class="col-md-4">
					<div class="stuMem">
						<!-- <h3>스터디장</h3> -->
						<div class="memLeader" id="member1">
							
							<img src="<%=cp %>/assets/images/hjkim.PNG" alt="" class="img-circle memImg" />
							<span class="glyphicon glyphicon-ok ok"></span>
							<h4>Study Leader</h4>
							<span class="name">김길동</span>
							
							<!-- 멤버정보카드 -->
							<div class="memInfo" id="stuMemInfo">
								<div class="userName">
									<span class="glyphicon glyphicon-user user"></span><h3>이름 :</h3><span class="name">김길동</span>
								</div><!-- end .userName -->
								<div class="userManner">
									<span class="glyphicon glyphicon-pencil pencil"></span><h3>매너연필 :</h3><span class="manPencil">5cm</span>
								</div><!-- userManner -->
								<div class="userPosi">
									<h3>신분 :</h3><span class="position">취업준비생</span>
								</div><!-- end .userPosi -->
								<div class="userKey">
									<h3>관심키워드 :</h3><span class="keyword">Java / JSP</span>
								</div><!-- end .userKey -->
								<div class="userInt">
									<h3>자기소개 :</h3><span class="oneInt">한 줄 자기소개 영역입니다.</span>
								</div><!-- end .userInt -->
								<div class="userStu">
									<h3>참여중인 스터디 :</h3>
									<span class="joinStu">·F반 스터디방</span><br>
									<span class="joinStu">·F반 취업준비방</span>
								</div><!-- end .userStu -->
								<div class="userPro">
									<h3>참여중인 스터디 :</h3>
									<span class="joinPro">·F반 프로젝트방</span><br>
									<span class="joinPro">·Come-It</span>
								</div><!-- end .userStu -->
							</div><!-- end .memInfo -->
							
						</div><!-- end .memLeader -->
					<!-- 	<h3>스터디원</h3> -->
						
						<div class="member" id="member2">
							<img src="<%=cp %>/assets/images/khjang.PNG" alt="" class="img-circle memImg" />					
							<h4>member</h4>
							<span class="name">장길동</span>
							
						</div><!-- end .mem -->
						
						
						<div class="member">
							<img src="<%=cp %>/assets/images/sjsong.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">송길동</span>
						</div>
						<div class="member">
							<img src="<%=cp %>/assets/images/jmshin.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">신길동</span>
						</div>
						<div class="member">
							<img src="<%=cp %>/assets/images/hschoi.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">최길동</span>
						</div>
						
					</div><!-- end .stuMem -->
				
				</div>
			</div><!-- end .row -->
		
		</div><!-- end .col-md-8 -->
		
		<div class="col-md-2">
		</div>
	</div><!-- end .row -->
	
	
</div><!-- end .container-fluid -->

<!-- 푸터 -->
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-8">
	</div>
	<div class="col-md-2">
	</div>
</div>
</body>
</html>