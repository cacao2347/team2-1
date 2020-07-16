<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/header.css">

</head>
<body>
 <!-- Navigation -->
  <nav class="hnavbar hnavbar-expand-lg hnavbar-dark hbg-dark fixed-top">
    <div class="hcontainer">
      <a class="hnavbar-brand" href="#">COME-IT</a>
      <button class="hnavbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="hnavbar-toggler-icon"></span>
      </button>
      <div class="collapse hnavbar-collapse" id="navbarResponsive">
        <ul class="hnavbar-nav hml-auto">
          <li class="hnav-item">
            <a class="hnav-link" href="#">스터디</a>
          </li>
          <li class="hnav-item">
            <a class="hnav-link" href="#">프로젝트</a>
          </li>
          <li class="hnav-item">
            <a class="hnav-link" href="#">강의</a>
          </li>
          <li class="hnav-item">
            <a class="hnav-link" href="#">공간</a>
          </li>
          <li class="hnav-item">
            <a class="hnav-link" href="#">자유게시판</a>
          </li>
          <li class="hnav-item">
            <a class="hnav-link" href="#"> <img src="<%=cp %>/assets/images/user_mem.png" style="width: 35px;"></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
    <script src="js/jquery.min.header.js"></script>
  <script src="js/bootstrap.bundle.min.header.js"></script>
  
</body>
</html>