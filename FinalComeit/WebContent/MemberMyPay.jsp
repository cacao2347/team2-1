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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/membermy.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/membermySPL.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 결제 내역 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
      <div class="panel panel-default">
         <div class="panel-heading head">
            <h3 class="panel-title tit">결제 내역 ></h3>
         </div>
            <table class="table table-bordered">
            <tr class="myPro">
               <th>강의 코드</th>
               <th>강의 명</th>
               <th>강사 명</th>
               <th>강의기간</th>
               <th>금액</th>
               <th>유형</th>
            </tr>
            <tr class="detail">
               <td>A0004</td>
               <td>JAVA배우기</td>
               <td>박길동</td>
               <td>2020-05-30 ~ 2020-06-30</td>
               <td>170,000</td>
               <td>결제</td>
            </tr>
            <tr class="detail">
               <td>A0003</td>
               <td>웹만들기</td>
               <td>홍길동</td>
               <td>2020-04-01 ~ 2020-05-01</td>
               <td>250,000</td>
               <td>환불</td>
            </tr>
            <tr class="detail">
               <td>A0003</td>
               <td>웹만들기</td>
               <td>홍길동</td>
               <td>2020-04-01 ~ 2020-05-01</td>
               <td>250,000</td>
               <td>결제</td>
            </tr>
            <tr class="detail">
               <td>A0002</td>
               <td>오라클 배우기</td>
               <td>신길동</td>
               <td>2020-02-02 ~ 2020-02-02</td>
               <td>120,000</td>
               <td>결제</td>
            </tr>
            <tr class="detail">
               <td>A0001</td>
               <td>C언어로 게임 만들기</td>
               <td>최길동</td>
               <td>2020-01-01 ~ 2020-02-01</td>
               <td>100,000</td>
               <td>결제</td>
            </tr>
            </table>
      </div>
      </div>
      <div class="col-md-2">
      </div>
      <!--페이징 처리 -->
      <div class="row">
	      <div class="col-md-2">
		  </div>
			<div class="col-md-8">
				<div class="paging"> 
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
				</div>
			</div>
			<div class="col-md-2">
				<button type="button" class="add btn btn-dark">등록</button>
			</div>
		</div><!-- 페이징처리 끝 -->
   </div><!-- 결제 내역 끝 -->
	
</body>
</html>