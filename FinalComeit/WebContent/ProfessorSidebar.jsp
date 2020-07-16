<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<style type="text/css">
/* 사이드바 */
.sidenav 
{
  background-color: #f1f1f1;
  position: fixed;
  width: 200px;
  height: 100%;
  margin-left: -20px;
  margin-top:50px
}
</style>
</head>
<body>

<div class="container-fluid">

  	<!-- 사이드바 -->
    <nav class="col-sm-3 sidenav">
      <h4><img class="img-fluid img-square myimg" src="assets/images/IU.jpg" alt="myimg" style="width: 180px; height:200px;"></h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active" style="text-align: center;">아이유 님의 프로필</li>
        <li style="text-align: center;"><span class="glyphicon glyphicon-pencil"></span>&nbsp;85cm</li>
        <li><span class="glyphicon glyphicon-list-alt">&nbsp;강사이력</span></li>
        <li>
        <textarea name="" id="" cols="20" rows="5">
·ㅇㅇ대학
컴퓨터공학과 졸업
⦁ 무슨무슨 기업 근무(2017~2020)</textarea></li>
        <li>강사소개</li>
        <li><textarea name="" id="" cols="20" rows="10">
안녕하세요 
아이유입니다.
저는 ㅇㅇ대학 컴공과를 졸업하여…
웹개발 경력 n년차이며...</textarea></li>
      </ul>
    </nav>
	<!-- 사이드바 끝 -->
</div>

</body>
</html>