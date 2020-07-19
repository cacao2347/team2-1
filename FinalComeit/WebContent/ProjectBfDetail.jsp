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
<title>ProjectAfDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectBfDetail.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>

  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


<script type="text/javascript">

	$(document).ready(function () 
	{
		$(".infoBtn").click(function() 
		{
			$(".search-modal-content").width("500px");
			$("#modal").show();	
		});	
		
		
		$(".joinBtn").click(function() 
		{
			$(".search-modal-content").width("1000px");
			$("#levelModal").show();	
		});	
		
		
		$(".outBtn").click(function() 
		{
				var outRsn = prompt("불합리한 방출은 사이트 이용에 제한이 있을 수 있습니다.\n방출 사유를 입력하세요.");
				
		});
		
		$(".leave").click(function() 
		{
			alert("퇴장버튼 클릭 시 날짜에 따라 페널티 경고 메세지 띄우기");	
		});
		
	
		
	});
		
	function closeModal() 
	{
		$('.searchModal').hide();
	};
	
	

</script>


</head>
<body>

<!-- 헤더 -->
<div class="row">
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
</div>

<!-- 바디 -->
<div class="container-fluid">
	
	<!-- 프로젝트방 이미지 -->
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
					<!-- 프로젝트방 제목 -->
					<div class="stuTitle">
						<div class="title">
							<h1>F반 프로젝트방</h1>
							
						</div>

						<div class="jrBtn pull-right">
							<input type="button" value="참가" class="btn btn-lg btn-primary joinBtn"/>
							<img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
						</div><!-- end .button -->
						
						<!-- 모달 -->
							<!-- 검은 배경 -->
							<div id="levelModal" class="searchModal">
								<!-- 모달창 -->
								<div class="search-modal-content">
								
								<!-- 버튼 -->
								<div class="closeD pull-right" onClick="closeModal();">
									<span class="pop_bt modalCloseBtn" >X</span>
								</div><!-- end .closeD -->
									
								<div class="levelAnsTitle">
									<h3>레벨테스트 답변 입력</h3>
								</div>
								
								<div class="levelAns">
									<h3>1. 자기 소개 한 줄 입력해주세요</h3>					
									<textarea name="" id="" class="ansBox form-control" ></textarea>
								</div>
								
								<div class="levelAns">
									<h3>2. ~~~~~~~~~~~~ 이 문제에 대한 답변을 입력해 주세요</h3>
									<textarea name="" id="" class="ansBox form-control" ></textarea>
								</div>
									
								</div><!-- end .search-modal-content -->					
							</div><!-- end .searchModal -->	
					
					</div><!-- end.stuTitle -->
					
					
					<!-- 프로젝트방 정보 -->
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
							<span class="curr">프로젝트의 상세 설명 영역입니다.<br>
										   프로젝트장이 수정할 수 있는 영역이며, 우리 프로젝트가 어떤 공부를 하게 될 지<br> 
										   상세하게 작성할 수 있습니다.상세 커리큘럼이 적혀 있는 영역입니다.</span>
						</div>
					
					</div><!-- end .stuInfo -->
					
				
					
				</div><!-- end .col-md-8 -->
				
				<!-- 프로젝트원 정보 -->
				<div class="col-md-4 ">
				
					
					<div class="stuMem">
						<!-- <h3>프로젝트장</h3> -->
						<div class="memLeader" id="member1">

							<img src="<%=cp %>/assets/images/hjkim.PNG" alt="" class="img-circle memImg" />
							<span class="glyphicon glyphicon-ok ok"></span>
							<h4>Study Leader</h4>
							<span class="name">김길동</span>
							<input type="button" class="btn-sm btn-default infoBtn" id="" value="정보" />
							
							<!-- 모달 -->
							<!-- 검은 배경 -->
							<div id="modal" class="searchModal">
								<!-- 모달창 -->
								<div class="search-modal-content">
									
									<!-- 버튼 -->
									<div class="closeD pull-right" onClick="closeModal();">
										<span class="pop_bt modalCloseBtn" >X</span>
									</div><!-- end .closeD -->
									
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
										<h3>관심키워드 :</h3><span class="keyword">Java / JSP / jQuery / SQL / Spring</span>
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
										<h3>참여중인 프로젝트 :</h3>
										<span class="joinPro">·F반 프로젝트방</span><br>
										<span class="joinPro">·Come-It</span>
									</div><!-- end .userPro -->
									<div class="out">
										<input type="button" value="방출" class="btn btn-sm outBtn" />
									</div><!-- end .out -->
							</div><!-- end .search-modal-content -->
							
							
							
							</div><!-- end .searchModal -->	
							
						
							
						</div><!-- end .memLeader -->
					<!-- 	<h3>프로젝트원</h3> -->
						
						
						
						<div class="member" id="member2">
							<img src="<%=cp %>/assets/images/khjang.PNG" alt="" class="img-circle memImg" />					
							<h4>member</h4>
							<span class="name">장길동</span>
							<input type="button" class="btn-sm btn-default infoBtn" id="" value="정보" />
						</div><!-- end .member -->
						
						
						<div class="member">
							<img src="<%=cp %>/assets/images/sjsong.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">송길동</span>
							<input type="button" class="btn-sm btn-default infoBtn" id="" value="정보" />
						</div>
						<div class="member">
							<img src="<%=cp %>/assets/images/jmshin.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">신길동</span>
							<input type="button" class="btn-sm btn-default infoBtn" id="" value="정보" />
						</div>
						<div class="member">
							<img src="<%=cp %>/assets/images/hschoi.PNG" alt="" class="img-circle memImg" />
							<h4>member</h4>
							<span class="name">최길동</span>
							<input type="button" class="btn-sm btn-default infoBtn" id="" value="정보" />
						</div>
						
					</div><!-- end .stuMem -->
				
					
					<!-- 프로젝트장에게만 보일 수정 / 폐쇄 버튼 -->
					<div class="roomBtn">
						<input type="button" value="방 정보 수정" class="btn modBtn" />
						<input type="button" value="폐쇄" class="btn delBtn" />
					</div><!-- end .roomBtn -->
				</div>
				
				
				
			</div><!-- end .row -->
		</div><!-- end .col-md-8 -->
		
		<div class="col-md-2">
		</div>
	</div><!-- end .row -->
	
	
</div><!-- end .container-fluid -->

<!-- 탭 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
				<c:import url="ProjectBfTab.jsp"></c:import>
				
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<!-- 푸터 -->
<div class="row">
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
</div>
</body>
</html>