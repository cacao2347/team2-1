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
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/projectAfTab.css">
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
        <li class="on"><a href="#tab1">공지사항</a></li>
        <li><a href="#tab2">모임 날짜 정하기</a></li>
        <li><a href="#tab3">캘린더</a></li>
        <li><a href="#tab4">산출물 관리</a></li>
        <li><a href="#tab5">모임 장소 정하기</a></li>
        <li><a href="#tab6">투표</a></li>
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">
		
		<!-- 공지사항 -->
        <div id="tab1" class="tab_content">
            <!--Content-->
            <c:import url="ProjectNoticeList.jsp"></c:import>
        </div>
		
		<!-- 모임 날짜 정하기 -->
        <div id="tab2" class="tab_content">
           <!--Content-->
           <c:import url="ProjectDateList.jsp"></c:import>
        </div>
        
        <!-- 캘린더 -->
        <div id="tab3" class="tab_content">
           <!--Content-->
           <c:import url="ProjectCalendar.jsp"></c:import>
        </div>
        
        <!-- 산출물 관리 -->
        <div id="tab4" class="tab_content">
           <!--Content-->
           <c:import url="ProjectFileList.jsp"></c:import>
        </div>
        
        <!-- 모임 장소 정하기 -->
        <div id="tab5" class="tab_content">
           <!--Content-->
           <c:import url="StudySpaceList.jsp"></c:import>
        </div>
        
        <!-- 투표 -->
        <div id="tab6" class="tab_content">
           <!--Content-->
           <c:import url="ProjectVoteList.jsp"></c:import>
        </div>
        

    </div>

</div>

</body>
</html>