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

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/memstop.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

<style type="text/css">
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}

 </style>
</head>
<body class="stopBody">
<div class="row">
	<div class="col-md-12">
	<c:import url="header.jsp"></c:import>
	</div>
</div>
<!-- 본문 영역 -->
<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 mainContent">
			<div class="cont">
			<table class="stopContent">
				<tr>
					<td rowspan="3">
					<img class="img-fluid rounded stopImg" src="assets/images/exclamation.png" alt="exclamation">
					</td>
					<td> 홍길동님의 계정은</td>
				</tr>
				<tr>
					<td> 2020-07-18 일 부로</td>
				</tr>
				<tr>
					<td> 정지 처리 되었습니다.</td>
				</tr>
			</table>
			</div>
			<div class="reqBtn">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">항소하기</button>
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

<!-- 모달 -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header head">
        <h5 class="modal-title mTit" id="staticBackdropLabel">항소신청 사유</h5>
        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
        X
        </button>
      </div>
      <div class="modal-body mbody">
		<div class="rsnTit">사유 입력</div>
		<input type="text" class="form-control content">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close">확인</button>
      </div>
    </div>
  </div>
</div><!-- 모달 끝  -->

</body>
</html>