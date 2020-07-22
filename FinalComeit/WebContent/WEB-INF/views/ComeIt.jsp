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
<link rel="stylesheet" href="<%=cp %>/assets/css/comeit.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
      $(function(){
        var welcomeSection = $('.welcome-section'),
        enterButton = welcomeSection.find('.enter-button');

        setTimeout(function(){
          welcomeSection.removeClass('content-hidden');
        },800);
        enterButton.on('click',function(e){
          welcomeSection.fadeOut();
        })
      })
</script>
</head>
<body>
    <div class="welcome-section content-hidden">
      <div class="content-wrap">
        <ul class="fly-in-text">
          <li>C</li>
          <li>O</li>
          <li>M</li>
          <li>E</li>
          <li>-</li>
          <li>I</li>
          <li>T</li>
          <li>!</li>
        </ul>
        <a href="/FinalComeit/mainpage.action" class="enter-button">Enter</a>
      </div>
    </div>
</body>
</html>