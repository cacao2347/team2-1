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
<title>StudyAfDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyAfDetail.css" >
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
			$("#modal").show();	
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
	
	
	
	/* 출석 차트 */
	google.charts.load('current', {packages: ['corechart', 'bar']});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

	      var data = new google.visualization.DataTable();
	      data.addColumn('timeofday', 'Time of Day');
	      data.addColumn('number', 'Attendance rate');

	      data.addRows([
	        [{v: [8, 0, 0], f: '8 am'}, 1],
	        [{v: [9, 0, 0], f: '9 am'}, 2],
	        [{v: [10, 0, 0], f:'10 am'}, 3],
	        [{v: [11, 0, 0], f: '11 am'}, 4],
	        [{v: [12, 0, 0], f: '12 pm'}, 5],
	        [{v: [13, 0, 0], f: '1 pm'}, 6],
	        [{v: [14, 0, 0], f: '2 pm'}, 7],
	        [{v: [15, 0, 0], f: '3 pm'}, 8],
	        [{v: [16, 0, 0], f: '4 pm'}, 9],
	        [{v: [17, 0, 0], f: '5 pm'}, 10],
	      ]);

	      var options = {
	        title: '우리 방 출석률',
	        hAxis: {
	          title: 'Member Name',
	          format: 'h:mm a',
	          viewWindow: {
	            min: [7, 30, 0],
	            max: [17, 30, 0]
	          }
	        },
	         vAxis: {
	          title: '모임 회차'
	        } 
	      };

	      var chart = new google.visualization.ColumnChart(
	        document.getElementById('chart_div'));

	      chart.draw(data, options);
	    }
	  
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
						<div class="title">
							<h1>F반 스터디방</h1>
							
						</div>
						
						<div class="jrBtn pull-right">
							<input type="button" value="퇴장" class="leave btn btn-lg btn-primary" />
							<img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
						</div><!-- end .button -->
						
					
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
					
					<!-- 출석 차트 -->
					
				
					<div id="chart_div" class="attChart"></div>
					
				</div><!-- end .col-md-8 -->
				
				<!-- 스터디원 정보 -->
				<div class="col-md-4 ">
				
					
					<div class="stuMem">
						<!-- <h3>스터디장</h3> -->
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
									<div class="closeD" onClick="closeModal();">
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
					<!-- 	<h3>스터디원</h3> -->
						
						
						
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
				
					
					<!-- 스터디장에게만 보일 수정 / 폐쇄 버튼 -->
					<div class="roomBtn">
						<input type="button" value="방 정보 수정" class="btn modBtn" />
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
				<c:import url="StudyTab.jsp"></c:import>
				
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