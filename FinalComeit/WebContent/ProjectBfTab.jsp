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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectBfTab.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
        $(document).ready(function() {

            $(".tab_content").hide(); 
            $("ul.tabs li:first").addClass("active").show(); 
            $(".tab_content:first").show();

            $("ul.tabs li").click(function() 
            {

                $("ul.tabs li").removeClass("active"); 
                $("ul.tabs li").removeClass("on"); 
                $(this).addClass("active");
                $(this).addClass("on");
                $(".tab_content").hide();

                var activeTab = $(this).find("a").attr("href");
                $(activeTab).fadeIn(); 
                return false;
            });

        });
        
</script>



</head>
<body>

<div id="wrapper">    
    <!--탭 메뉴 영역 -->
    <ul class="tabs">
        <li class="on"><a href="#tab1">참가 요청 회원</a></li>
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">
			
		<!-- 참가 요청 페이지 만들고 바꾸기 -->
        <div id="tab1" class="tab_content">
            <!--Content-->
            <c:import url="ProjectReqMemList.jsp"></c:import>
        </div>

    </div>

</div>

</body>
</html>