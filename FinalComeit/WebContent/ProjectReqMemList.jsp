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
<title>ProjectReqMemList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet"  href="<%=cp %>/assets/css/blog-post.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectreqmemlist.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function () 
	{
		$(".rejectBtn").click(function() 
		{
			prompt("거절 사유를 입력해 주세요 : ");
		});
	});

</script>

</head>
<body>

<div class="container-fluid">
<div class="row">
<div class="col-md-12">

<div class="pageTitle">
	<h1>참가 요청 회원 확인</h1>
</div>
<div>
	<table class="table table-hover reqList">
		<tr class="outTr">
			<th>참가 요청자</th>
			<th>요청일</th>
			<th>답변보기</th>
			<th>거절</th>
			<th>승인</th>
		</tr>
		<tr class="outTr">
			<td class="outTd">
				<button type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">홍길동</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">2020-06-20</td>
			<td class="outTd">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#answer">답변보기</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-danger btn-sm rejectBtn">거절</button>
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-success btn-sm">승인</button>
			</td>
		</tr>
		<tr class="outTr">
			<td class="outTd">
				<button type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">홍길동</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">2020-06-20</td>
			<td class="outTd">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#answer">답변보기</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-danger btn-sm rejectBtn">거절</button>
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-success btn-sm">승인</button>
			</td>
		</tr>
		<tr class="outTr">
			<td class="outTd">
				<button type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">홍길동</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">2020-06-20</td>
			<td class="outTd">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#answer">답변보기</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-danger btn-sm rejectBtn">거절</button>
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-success btn-sm">승인</button>
			</td>
		</tr>
		<tr class="outTr">
			<td class="outTd">
				<button type="button" class="btn btn-link" data-toggle="modal" data-target="#staticBackdrop">홍길동</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">2020-06-20</td>
			<td class="outTd">
				<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#answer">답변보기</button>
				<!-- 클릭 시 모달 뜨기 -->
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-danger btn-sm rejectBtn">거절</button>
			</td>
			<td class="outTd">
				<button type="button" class="btn btn-success btn-sm">승인</button>
			</td>
		</tr>
	</table>
</div>
</div>
</div>
</div>




<!-- 회원 정보 모달 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header head">
        <h5 class="modal-title mTit" id="staticBackdropLabel">홍길동님의 정보</h5>
        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
        X
        </button>
      </div>
      <div class="modal-body mbody">
      	<div class="modalImg">
      		<img class="img-fluid img-circle myimg" src="assets/images/myImg.PNG" alt="myimg">
      	</div>
      
      	<table class="table tblModal">
      		<tr>
      			<td>
      			<span class="glyphicon glyphicon-user icon" aria-hidden="true"></span>
      			<span>이름 : </span>
      			</td>
      			<td>홍길동</td>
      		</tr>
      		<tr>
      			<td>
      			<span class="glyphicon glyphicon-pencil icon" aria-hidden="true"></span>
      			<span>매너연필 : </span>
      			</td>
      			<td>55cm</td>
      		</tr>
      		<tr>
      			<td>
      			<span class="glyphicon glyphicon-education icon" aria-hidden="true"></span>
      			<span>신분 : </span>
      			</td>
      			<td>취업준비생</td>
      		</tr>
      		<tr>
      			<td>
      			<span class="glyphicon glyphicon-tags icon" aria-hidden="true"></span>
      			<span>관심키워드 : </span>
      			</td>
				<td>
				<ul class="list-my-tags">
					<li class="stack-item">Java</li>
					<li class="stack-item">Oracle</li>
				</ul>
				</td>
      		</tr>
      		<tr>
      			<td>
      			<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
      			<span>자기소개 : </span> 
      			</td>
      			<td>한 줄 자기소개 영역입니다.</td>
      		</tr>
      		<tr>
      			<td>참여중인 스터디</td>
      			<td>
      			<ul class="myStudy">
      				<li>첫번째 스터디방 제목</li>
      				<li>두번째 스터디방 제목</li>
      			</ul>
      			</td>
      		</tr>
      		<tr>
      			<td>참여중인 프로젝트</td>
      			<td>
      			<ul class="myProject">
      				<li>첫번째 프로젝트방 제목</li>
      				<li>두번째 프로젝트방 제목</li>
      			</ul>
      			</td>
      		</tr>
      	</table>
      	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">확인</button>
      </div>
    </div>
  </div>
</div><!-- 회원 정보 모달 끝  -->

<!-- 답변 모달 -->
<div class="modal fade" id="answer" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header head">
        <h5 class="modal-title mTit" id="staticBackdropLabel">홍길동님의 답변</h5>
        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
        X
        </button>
      </div>
      <div class="modal-body mbody">
      	<div class="quest">1. 첫 번째 레벨테스트 질문입니다.</div>
      	<div>
      		<input type="text" class="form-control ans" readonly="readonly" value="첫 번째 레벨테스트 질문에 대한 답변이 노출되고 있습니다.">
      	</div>
      	<div class="quest">2. 두 번째 레벨테스트 질문입니다.</div>
      	<div>
      		<input type="text" class="form-control ans" readonly="readonly" value="두 번째 레벨테스트 질문에 대한 답변이 노출되고 있습니다.">
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">확인</button>
      </div>
    </div>
  </div>
</div><!-- 답변 모달 끝  -->

</body>
</html>