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
<title>StudyBfDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyBfDetail.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp %>/assets/js/bootstrap.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<!-- 글씨체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>




<script type="text/javascript">

   $(document).ready(function () 
   {
      $(".infoBtn").click(function() 
      {
         $("#modal").show();   
         
         // 스크롤 제어
         $("html, body").css({"overflow":"hidden", "height":"100%"});
         $("#modal").bind("touchmove", function(e) {
            e.preventDefault();
         });
         $("#modal .searchModal").bind("touchmove", function(e) {
            e.stopPropagation();
         });
         
      });   
      
      
      $(".outBtn").click(function() 
      {
            var outRsn = prompt("불합리한 방출은 사이트 이용에 제한이 있을 수 있습니다.\n방출 사유를 입력하세요.");
            
      });
      
      $(".delBtn").click(function() 
      {
         alert("스터디 방을 폐쇄하시겠습니까?");   
      });
      
      
      // 스터디장 정보 요청시
     $("#leaderMemBtn").click(function()
	 {
		$("#infoForm").attr("action", "leaderinfomodal.action");	
	 });
     
      
      // 스터디원 정보 요청시
     $("#joinMemBtn").click(function()
	 {
    	 $("#infoForm").attr("action", "meminfomodal.action");	
	 });
      
      
   });
      
   function closeModal() 
   {
      $('.searchModal').hide();
   
      // 스크롤 제어 해제
      $("html, body").css({"overflow":"auto", "height":"auto"});
      $('#modal').unbind('touchmove');
      
   };
   
   
   function leaderModal()
   {
	  $.ajax({
		  url : "<%=cp%>/leaderinfomodal.action",
		  data : {
			  leaderMemCd: $("#leaderMemCd").val()
		  },
		  type: "post",
		  
	  });
   }
   
   
	<%-- // 문자 발송 설정
	function idSendSms() 
	{
		phoneCheck = "";
		alert("phoneCheck_bf : " + phoneCheck);
		
		$.ajax({
			url : "<%=cp%>/idsendsms.action",
			data : {
				receiver:$("#formTel").val()
			},
			type: "post",
			success: function(result) {
				phoneCheck = result;
				alert("result : " + result);
				alert("phoneCheck_af : " + phoneCHeck);
			}
		});	
	}
 --%>
</script>


</head>
<body class="padding">

<!-- 헤더 -->
<div class="row">

   <div class="col-md-12">
   <c:import url="/WEB-INF/views/header.jsp"></c:import>
   </div>

</div>

<!-- 바디 -->
<div class="container-fluid">
   
   <!-- 스터디방 이미지 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      <div class="col-md-8">
         <img src="<%=cp %>/assets/images/study2.jpg" alt="" class="stuImg" />      
      </div>
      <div class="col-md-2">
      </div>
   </div>
   
   
   
   <!-- 방 정보 및 팀원 정보 -->
   <div class="row">
      <div class="col-md-2">
      </div>
      
      <!-- 방 정보 -->
      <div class="col-md-8">
         <div class="row">
         <c:if test="${!empty studyInfo}" >
            <div class="col-md-8">
               <!-- 스터디방 제목 -->
               <div class="stuTitle">
                  <div class="title">
                     <h1>${studyInfo.title }</h1>
                     
                  </div>
                  <!-- 스터디장 : 커밋 , 회원 : 참가, 스터디원 : 퇴장 으로 노출 -->
                  <div class="jrBtn pull-right">
                     <input type="button" value="참가" class="btn btn-lg btn-primary" />
                     <img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
                  </div><!-- end .button -->
               </div><!-- end.stuTitle -->
               
               
               <!-- 스터디방 정보 -->
               <div class="stuInfo">
                  <!-- 활동 기간 -->
                  <div class="stuTerm">
                     <span class="glyphicon glyphicon-calendar icon"></span>
                     <h4>활동 기간</h4><br>
                     <span class="term">${studyInfo.str_date } ~ ${studyInfo.end_date }&nbsp;&nbsp;&nbsp;&nbsp;${studyInfo.meet_term }개월</span><br />
                     └ <c:forEach var="dayName" items="${dayName }">
                         <span class="day"> ${dayName.stu_day_name } </span>
                        </c:forEach>
                                                
                  </div><!-- end stuTerm -->
                  
                  <!-- 활동 지역 -->
                  <div class="stuArea">
                     <span class="glyphicon glyphicon-map-marker icon"></span>
                     <h4>활동 지역</h4><br />
                     <span class="area">${studyInfo.area_name } ${studyInfo.spc_area_name }</span>
                  </div><!-- end .stuArea -->
                  
                  <!-- 키워드 -->
                  <div class="stuKey">
                     <span class="glyphicon glyphicon-tags icon"></span>
                     <h4>키워드</h4><br>
                     <c:forEach var="intTag" items="${intTag }">
                           <ul class="list-study-tags">
                              <li class="stack-item">${intTag.int_tag_name }</li>
                           </ul>
                     </c:forEach>
                     <c:forEach var="etcTag" items="${etcTag }">
                           <ul class="list-study-tags">
                              <li class="stack-item">${etcTag.etc_tag_name }</li>
                           </ul>
                     </c:forEach>
                  </div><!-- end .stuKey -->
                  
                  <!-- 예상 레벨 -->
                  <div class="stuLevel">
                     <span class="glyphicon glyphicon-blackboard icon"></span>
                     <h4>예상 레벨</h4><br>
                     <span class="level">${studyInfo.lv }</span>
                  </div>
                  
                  <!-- 상세 설명 -->
                  <div class="stuCurr">
                     <span class="glyphicon glyphicon-bookmark icon"></span>
                     <h4>상세 설명</h4><br />
                     <p style="white-space: pre-line;" class="curr">${studyInfo.content }</p>
                     <%-- <span class="curr">${studyInfo.content }</span> --%>
                  </div>
               
               </div><!-- end .stuInfo -->
            </div><!-- end .col-md-8 -->
            </c:if>
            <!-- 스터디원 정보 -->
            
            <form method="post" id="infoForm" name="infoForm">
            <div class="col-md-4 ">
            <!-- 모달 -->
                     <div id="modal" class="searchModal">
                        <!-- 모달창 -->
                        <div class="search-modal-content">
                           
                           <!-- 버튼 -->
                           <div class="closeD" onClick="closeModal();">
                              <span class="pop_bt modalCloseBtn pull-right" >X</span>
                           </div><!-- end .closeD -->
                           
                           <div class="userName">
                              <span class="glyphicon glyphicon-user user"></span><h4>이름 :</h4><span class="name">${leaderModalInfo.name }</span>
                           </div><!-- end .userName -->
                           <div class="userManner">
                              <span class="glyphicon glyphicon-pencil pencil"></span><h4>매너연필 :</h4><span class="manPencil">5cm</span>
                           </div><!-- userManner -->
                           <div class="userPosi">
                              <h4>신분 :</h4><span class="position">${leaderModalInfo.idntt }</span>
                           </div><!-- end .userPosi -->
                           <div class="userKey">
                              <h4>관심키워드 :</h4><span class="keyword">Java / JSP / jQuery / SQL / Spring</span>
                           </div><!-- end .userKey -->
                           <div class="userInt">
                              <h4>자기소개 :</h4><span class="oneInt">${leaderModalInfo.mem_content }</span>
                           </div><!-- end .userInt -->
                           <div class="userStu">
                              <h4>참여중인 스터디 :</h4>
                              <span class="joinStu">·F반 스터디방</span><br>
                              <span class="joinStu">·F반 취업준비방</span>
                           </div><!-- end .userStu -->
                           <div class="userPro">
                              <h4>참여중인 프로젝트 :</h4>
                              <span class="joinPro">·F반 프로젝트방</span><br>
                              <span class="joinPro">·Come-It</span>
                           </div><!-- end .userPro -->
                           <div class="out">
                              <input type="button" value="방출" class="btn btn-sm outBtn" />
                              <input type="button" class="btn btn-sm btn-primary manBtn" value="위임" />
                           </div><!-- end .out -->
                     </div><!-- end .search-modal-content -->                     
                     </div><!-- end .searchModal -->   
            
               <div class="stuMem">
                  <!-- <h3>스터디장</h3> -->
               
               
                  <div class="memLeader" id="member1">
                     <c:forEach var="memImg" items="${memImg }">
                        <c:if test="${memImg.join_mem_cd eq leaderName.leader_mem_cd}">
                           <div class="leaderImg">
                              <img src="<%=cp %>${memImg.mem_img }" alt="" class="img-circle memImg" />
                           </div><!-- end .leaderImg -->
                        </c:if>
                     </c:forEach>
                     
                     <div class="leaderInfo">
                        <span class="glyphicon glyphicon-ok ok"></span>
                        <h4>Study Leader</h4><br>
                        <span class="name">${leaderName.leader_name }</span>
                        <input type="hidden" name="leaderMemCd" id="leaderMemCd" value="${leaderName.leader_mem_cd }"/>
                        <input type="button" class="btn btn-xs btn-default infoBtn" id="leaderMemBtn" value="정보" />
                     </div><!-- end .leaderInfo -->
                     
                  </div><!-- end .memLeader -->
                  
                  
                  
               <!--    <h3>스터디원</h3> -->
                  <c:forEach var="joinName" items="${joinName }">
                     <c:if test="${joinName.stu_join_name ne leaderName.leader_name}">
                        <div class="memLeader" id="">
                           
                           <c:forEach var="memImg" items="${memImg }">
                              <c:if test="${memImg.join_mem_cd eq joinName.join_mem_cd}">
                                 <div class="leaderImg">
                                    <img src="<%=cp %>${memImg.mem_img }" alt="" class="img-circle memImg" />
                                 </div><!-- end .leaderImg -->
                              </c:if>
                           </c:forEach>
                           <div class="leaderInfo">
                              <h4>Study Member</h4><br>
                              <span class="name">${joinName.stu_join_name }</span>
                              <input type="hidden" name="joinMemCd" id="joinMemCd" value="${joinName.join_mem_cd }"/>
                              <input type="button" class="btn btn-xs btn-default infoBtn" id="joinMemBtn" value="정보" />
                           
                           </div><!-- end .leaderInfo -->
                        </div><!-- end .memLeader -->
                     </c:if>
                  </c:forEach>

                  
               </div><!-- end .stuMem -->
      		
               
               <!-- 스터디장에게만 보일 수정 / 폐쇄 버튼 -->
               <div class="roomBtn">
                  <input type="button" value="방 정보 수정" class="btn modBtn" />
                  <input type="button" value="폐쇄" class="btn delBtn" />
               </div><!-- end .roomBtn -->
            </div>
            
            </form>
            
         </div><!-- end .row -->
      
      </div><!-- end .col-md-8 -->
      
      <div class="col-md-2">
      </div>
   </div><!-- end .row -->
   
   
</div><!-- end .container-fluid -->

<!-- 푸터 -->
<div class="row">
   <div class="col-md-12">
   <c:import url="/WEB-INF/views/footer.jsp"></c:import>
   </div>
   
</div>
</body>
</html>