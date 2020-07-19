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
<title>MemberMyLecture.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/membermy.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/membermySPL.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container-fluid">
   <!-- 수강 내역 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
	      <div class="panel panel-default">
	         <div class="panel-heading head">
	            <h3 class="panel-title tit">수강 이력</h3>
	         </div>
	            <table class="table table-bordered">
	            <tr class="detail">
	               <th>강의코드</th>
	               <th>강의명</th>
	               <th>강사명</th>
	               <th>강의 시작일</th>
	               <th>강의 종료일</th>
	               <th>진행상태</th>
	               <th>환불신청</th>
	            </tr>
	            <tr class="detail">
	               <td>A0004</td>
	               <td>JAVA 정복</td>
	               <td>홍길동</td>
	               <td>2020-05-30</td>
	               <td>2020-06-30</td>
	               <td>진행중</td>
	               <td>
	               		<input type="submit" value="환불신청" class="refBtn btn-primary btn-sm" />
	               </td>
	            </tr>
	            <tr class="detail">
	               <td>A0003</td>
	               <td>JAVA 정복</td>
	               <td>홍길동</td>
	               <td>2020-04-30</td>
	               <td>2020-05-30</td>
	               <td>종료</td>
	               <td>
	               		<input type="submit" value="환불신청" class="refBtn btn btn-sm" disabled="disabled"/>
	               </td>
	            </tr>
	            <tr class="detail">
	               <td>A0003</td>
	              <td>JAVA 정복</td>
	               <td>홍길동</td>
	               <td>2020-04-30</td>
	               <td>2020-05-30</td>
	               <td>종료</td>
	               <td>
	               		<input type="submit" value="환불신청" class="refBtn btn btn-sm" disabled="disabled"/>
	               </td>
	            </tr>
	            <tr class="detail">
	               <td>A0002</td>
	               <td>JAVA 정복</td>
	               <td>홍길동</td>
	               <td>2020-04-30</td>
	               <td>2020-05-30</td>
	               <td>종료</td>
	               <td>
	               		<input type="submit" value="환불신청" class="refBtn btn btn-sm" disabled="disabled"/>
	               </td>
	            </tr>
	            <tr class="detail">
	               <td>A0001</td>
	               <td>JAVA 정복</td>
	               <td>홍길동</td>
	               <td>2020-04-30</td>
	               <td>2020-05-30</td>
	               <td>종료</td>
	               <td>
	               		<input type="submit" value="환불신청" class="refBtn btn btn-sm" disabled="disabled"/>
	               </td>
	            </tr>
	            </table>
	      </div>
      </div>
      <div class="col-md-2">
      </div>
      </div><!-- end .row -->
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
				
			</div>
		</div><!-- 페이징처리 끝 -->
</div>

</body>
</html>