<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>.jsp</title>
 <link href="vendor/bootstrap/css/header.css" rel="stylesheet">
</head>
<body>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">COME-IT</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">스터디</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">프로젝트</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">강의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">공간</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#"> <img src="images/user.png" style="width: 35px;"></a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

</body>
</html>