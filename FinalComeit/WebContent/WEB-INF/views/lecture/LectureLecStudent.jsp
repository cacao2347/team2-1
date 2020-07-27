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
<title>LectureLecStudent.jsp</title>
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

<!-- 결제 API -->
<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#member1").mouseover(function() {
			$("#stuMemInfo").css('display', 'block');
		});
		$("#member1").mouseleave(function() {
			$("#stuMemInfo").css('display', 'none');
		});
		
		$("#lecJoinBtn").click(function()
		{
			IMP.init('imp37333857');

			IMP.request_pay({
			    pg : 'inicis', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 14000, //판매 가격
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});
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

	<div class="row">
		<div class="col-md-12">
			<c:import url="/WEB-INF/views/header.jsp"></c:import>
		</div>
	</div>

	<!-- 바디 -->
	<div class="container-fluid">

		<!-- 방 정보 및 팀원 정보 -->
		<div class="row">
			<div class="col-md-2">
				<c:import url="/WEB-INF/views/LectureSidebar.jsp">
				</c:import>
			</div>
			<!-- 방 정보 -->
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<img src="<%=cp%>/assets/images/study2.jpg" alt="" class="stuImg" />
						<!-- 스터디방 제목 -->
						<div class="stuTitle">

							<div class="row">
								<div class="col-md-10">
									<h2 class="title" style="font-weight: bold;">${lecInfo.lec_name }</h2>		
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
								${lecInfo.lec_intro }
								</h3>
							</div>
							<!-- end stuTerm -->

							<!-- 활동 지역 -->
							<div class="stuArea">
								<span class="glyphicon glyphicon-map-marker icon"></span>
								<h3>활동 지역</h3>
								<br /> <span class="area">${lecInfo.spc_area_name }</span>
							</div>
							<!-- end .stuArea -->

							<!-- 키워드 -->
							<div class="stuKey">
								<span class="glyphicon glyphicon-tags icon"></span>
								<h3>키워드</h3>
								<span class="keword">
									<c:forEach var="lecTags" items="${lecTag }">
										<c:if test="${lecInfo.lec_cd eq lecTags.lec_cd }">
											<li class="stack-item">${lecTags.int_tag}</li>
										</c:if>
									</c:forEach>
								</span>
							</div>
							<!-- end .stuKey -->

							<!-- 예상 레벨 -->
							<div class="stuLevel">
								<span class="glyphicon glyphicon-calendar icon"></span>
								<h3>강의 일자</h3>
								<br> <span class="level">${lecInfo.str_date }~${lecInfo.end_date }</span>
								<br> <span class="level">화, 목</span>
							</div>

							<!-- 상세 설명 -->
							<div class="stuCurr">
								<span class="glyphicon glyphicon-user icon"></span>
								<h3>강의 인원</h3>
								<br /> 
								<span class="curr"> 
									강의 최소 개설 인원 : ${lecInfo.min_mem }명 <br>
									강의 최대 인원 : ${lecInfo.max_mem }명
								</span>
							</div>
							
							<div class="lecMoney">
								<span class="glyphicon glyphicon-shopping-cart icon"></span>
								<h3>수강료</h3>
								<br /> 
								<span class="curr"> 
									${lecInfo.lec_fee } 원
								</span>
							</div>
							
							<br><br><br>
							
							<!-- 버튼 영역 -->
							<div class="text-right">
								<input type="button" id="lecJoinBtn" value="강의 신청" class="btn btn-lg btn-primary join" />
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
	
<div class="row">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-12">
						<c:import url="/WEB-INF/views/lecture/LectureTab.jsp"></c:import>
					</div>
				</div>
			</div>
			<div class="col-md-2">
			</div>
		</div>

	<div class="col-md-12">
   		<c:import url="/WEB-INF/views/footer.jsp"></c:import>
    </div>
</body>
</html>