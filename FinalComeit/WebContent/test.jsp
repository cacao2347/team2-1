<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String args = (String)request.getAttribute("args");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */

    
    /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
    
    /* footer */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }

  </style>
</head>
<body>

<!-- <nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav> -->

<c:import url="header.jsp"></c:import>

<div class="container-fluid">

  	<!-- 사이드바 -->
    <nav class="col-sm-3 sidenav">
      <h4><img class="img-fluid img-square myimg" src="assets/images/IU.jpg" alt="myimg" style="width: 180px; height:200px;"></h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active" style="text-align: center;">아이유 님의 프로필</li>
        <li style="text-align: center;">◎85cm</li>
        <li><textarea name="" id="" cols="20" rows="5">강사이력
·ㅇㅇ대학
컴퓨터공학과 졸업
⦁ 무슨무슨 기업 근무(2017~2020)</textarea></li>
        <li >강사소개</li>
        <li><textarea name="" id="" cols="20" rows="10">
안녕하세요 아이유입니다.
 저는 ㅇㅇ대학 컴공과를 졸업하여…
  웹개발 경력 n년차이며...</textarea></li>
      </ul>
    </nav>
	<!-- 사이드바 끝 -->

	<!-- 본문 -->
    <div class="col-sm-9 page">
     <c:import url="ProfessorMy.jsp"></c:import>
    </div>
    <!-- 본문 끝 -->
 
</div>

<!-- footer -->
<footer class="container-fluid navbar-fixed-bottom">
  <p>Footer Text</p>
</footer>
<!-- footer 끝 -->

</body>
</html>

