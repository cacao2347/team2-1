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
	   // 스터디장 모달 정보 요청
      $(".leaderBtn").click(function() 
      {
    	  var params = "leaderMemCd=" +$(this).val();
    	  
    	  $.ajax(
    	  {
    	      type : "POST"
    	      , url : "leaderinfomodal.action"
    	      , data : params
    	      , dataType : "text"
    	      , success : function(args)
 	  	      { 
    	    	  var infoData = args.split('-');
    	    	 
    	    	  // 정보 담기
    	    	  
				  $("#modalName").text(infoData[0]);
		    	  $("#modalIdntt").text(infoData[1]);
		    	  $("#memContent").text(infoData[2]); 
		    	  $("#modalTag").text(infoData[3]);
		    	  $("#memJoinStu").text(infoData[4]);
		    	  
				  
		    	  // 모달창 보여주기
		    	  $("#modal").show();
				  
				  // 스크롤 제어
		          $("html, body").css({"overflow":"hidden", "height":"100%"});
		          $("#modal").bind("touchmove", function(e) {
		            e.preventDefault();
		          });
		         
		          $("#modal .searchModal").bind("touchmove", function(e) {
		            e.stopPropagation();
		          });
	    	 
			  }
    	  	  , error : function(e) 
    	  	  {
					alert(e.responseText);
			  }
    	  	
    	  
    	  });	
      });   // end 스터디장 모달 정보요청
      
      
      // 스터디원 모달 정보 요청 joinMemBtn
       $(".joinMemBtn").click(function() 
      {
    	  var params = "joinMemCd=" +$(this).val();
    	  
    	  $.ajax(
    	  {
    	      type : "POST"
    	      , url : "meminfomodal.action"
    	      , data : params
    	      , dataType : "text"
    	      , success : function(args)
 	  	      { 
    	    	  var infoData = args.split('-');
    	    	 
    	    	  // 정보 담기
				  $("#modalName").text(infoData[0]);
		    	  $("#modalIdntt").text(infoData[1]);
		    	  $("#memContent").text(infoData[2]); 
		    	  $("#modalTag").text(infoData[3]);
		    	  $("#memJoinStu").text(infoData[4]);
				  
		    	  // 모달창 보여주기
		    	  $("#modal").show();
				  
				  // 스크롤 제어
		          $("html, body").css({"overflow":"hidden", "height":"100%"});
		          $("#modal").bind("touchmove", function(e) {
		            e.preventDefault();
		          });
		         
		          $("#modal .searchModal").bind("touchmove", function(e) {
		            e.stopPropagation();
		          });
	    	 
			  }
    	  	  , error : function(e) 
    	  	  {
					alert(e.responseText);
			  }
    	  	
    	  
    	  });	
      });// end 스터디원 모달 정보요청
      
      // 스터디원 참가 요청 
      $(".joinStudyBtn").click(function() 
      {
    	  var params = "stuCode=" +$(this).val();
    	
    	  $.ajax(
         {
             type : "POST"
             , url : "studyjoin.action"
             , data : params
             , dataType : "text"
             , success : function(args)
             { 
            	 
            	 if (args == 1) 
					alert("참가가 완료 되었습니다.")
			 	 else
			 		 alert("참가가 불가능한 방 입니다.")
            	 
             }
             , error : function(e) 
             {
              	alert(e.responseText);
             }
            
             
         });  
    	  
    	  reload();
    	  
	  });
      
      // 스터디장 커밋 버튼 클릭
      $(".commitBtn").click(function() 
      {
			var params = "stuCode=" + $(this).val();
			
			var now = new Date();
			
			var today = now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
			
			
			if (condition) {
				
			}
			
			$.ajax(
			{
				 type : "POST"
	             , url : "leadercommit.action"
	             , data : params
	             , dataType : "text"
	             , success : function(data)
	             { 
	            	 alert(data);
	            	 
	            	 if (data == 1) 
	            	 {
	            		 alert("확정이 완료되었습니다."); 
	            		 $('.commitBtn').attr('disabled', true);
	            	 }
	            	 else
	            	 {
	            		 alert("확정이 실패되었습니다.");
	            	 }
	            		 
	            	 
	             }
	             , error : function(e) 
	             {
	              	alert(e.responseText);
	             }
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
      
    });
  	
 	// 모달창 닫기 버튼 클릭 시 
	function closeModal() 
	{	
		$('.searchModal').hide();
		
		// 스크롤 제어 해제
		$("html, body").css({"overflow":"auto", "height":"auto"});
		$('#modal').unbind('touchmove');
		
	};
	
	// 다시 로드
	function reload() 
	{
		location.reload();	
	}
 
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
         
        <form method="post" id="infoForm" name="infoForm"> 
         <c:if test="${!empty studyInfo}" >
            <div class="col-md-8">
               <!-- 스터디방 제목 -->
               <div class="stuTitle">
                  <div class="title">
                     <h2>${studyInfo.title }</h2>
                  </div>
                  <!-- 스터디장 : 커밋 , 회원 : 참가, 스터디원 : 퇴장 으로 노출 -->
                  <div class="jrBtn pull-right">
                   	<c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd && empty studyInfo.cmt_date}">
                   	<input type="hidden" name="" id="strDate" value="${studyInfo.str_date }"/>
                  	<button type="button" class="btn btn-lg btn-primary commitBtn" value="${studyInfo.stu_cd }">COMMIT</button>
                  	</c:if>
                  	<c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd && not empty studyInfo.cmt_date}">
                  	<button type="button" class="btn btn-lg btn-primary commitBtn" value="${studyInfo.stu_cd }" disabled="disabled">COMMIT</button>
                  	</c:if>
                  	
                  	
                  	 <c:if test="${sessionScope.mem_cd ne leaderName.leader_mem_cd }">
                  	<button type="button" class="btn btn-lg btn-primary joinStudyBtn" value="${studyInfo.stu_cd }">참가</button>
                  	</c:if>
                     <img src="<%=cp %>/assets/images/report.png" alt="" class="report" onclick=""/>
                  </div><!-- end .button -->
               </div><!-- end.stuTitle -->
               
               
               <!-- 스터디방 정보 -->
               <div class="stuInfo">
                  <!-- 활동 기간 -->
                  <div class="stuTerm">
                     <span class="glyphicon glyphicon-calendar icon icTerm"></span>
                     <h4>활동 기간</h4><br>
                     <span class="term">${studyInfo.str_date } ~ ${studyInfo.end_date }&nbsp;&nbsp;&nbsp;&nbsp;${studyInfo.meet_term }개월</span><br />
                     └ <c:forEach var="dayName" items="${dayName }">
                         <span class="day"> ${dayName.stu_day_name } </span>
                        </c:forEach>
                                                
                  </div><!-- end stuTerm -->
                  
                  <!-- 활동 지역 -->
                  <div class="stuArea">
                     <span class="glyphicon glyphicon-map-marker icon icArea"></span>
                     <h4>활동 지역</h4><br />
                     <span class="area">${studyInfo.area_name } ${studyInfo.spc_area_name }</span>
                  </div><!-- end .stuArea -->
                  
                  <!-- 키워드 -->
                  <div class="stuKey">
                     <span class="glyphicon glyphicon-tags icon icKey"></span>
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
                     <span class="glyphicon glyphicon-blackboard icon icLv"></span>
                     <h4>예상 레벨</h4><br>
                     <span class="level">${studyInfo.lv }</span>
                  </div>
                  
                  <!-- 상세 설명 -->
                  <div class="stuCurr">
                     <span class="glyphicon glyphicon-bookmark icon icCrr"></span>
                     <h4>상세 설명</h4><br />
                     <p style="white-space: pre-line;" class="curr">${studyInfo.content }</p>
                     <%-- <span class="curr">${studyInfo.content }</span> --%>
                  </div>
               
            
               </div><!-- end .stuInfo -->
            </div><!-- end .col-md-8 -->
            </c:if>
            <!-- 스터디원 정보 -->
            
            
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
                              <span class="glyphicon glyphicon-user user"></span><h4>이름 :</h4><span class="name" id="modalName"></span>              
	                           
                           </div><!-- end .userName -->
                           <div class="userManner">
                              <span class="glyphicon glyphicon-pencil pencil"></span><h4>매너연필 :</h4><span class="manPencil">5cm</span>
                           </div><!-- userManner -->
                           <div class="userPosi">
                              <h4>신분 :</h4><span class="position" id="modalIdntt"></span>
                           </div><!-- end .userPosi -->
                           <div class="userKey">
                              <h4>관심키워드 :</h4><span class="keyword" id="modalTag"></span>
                           </div><!-- end .userKey -->
                           <div class="userInt">
                              <h4>자기소개 :</h4><span class="oneInt" id="memContent"></span>
                           </div><!-- end .userInt -->
                           <div class="userStu">
                              <h4>참여중인 스터디 :</h4>
                              <span class="joinStu" id="memJoinStu"></span>
                           </div><!-- end .userStu -->
                          
                           <div class="out">
                            <c:if test="${sessionScope.mem_cd eq leaderName.leader_mem_cd }">
                              <input type="button" value="방출" class="btn btn-sm outBtn" />
                            </c:if>
                           </div><!-- end .out -->
                     </div><!-- end .search-modal-content -->                     
                     </div><!-- end .searchModal -->   
            
               <div class="stuMem">
               
               <!-- <h3>스터디장</h3> -->
                  <div class="memLeader" id="member1">
                  
                  
                 <div class="leaderImg">
				
					<c:set var="imgCount" value="${imgCount=0 }"/>
                     <c:forEach var="memImg" items="${memImg }">
                        <c:if test="${memImg.join_mem_cd eq leaderName.leader_mem_cd}">
                              <c:set var="imgCount" value="${imgCount=1 }"/>	
                              	<img src="${memImg.mem_img }" alt="" class="img-circle memImg" />
                        </c:if>
                     </c:forEach>
                     
                     <c:if test="${imgCount==0 }" >
                     	<img src="<%=cp %>/assets/images/basic.png" alt="" class="img-circle memImg" />
                     </c:if>
                   </div><!-- end .leaderImg -->  
                     
                     
                     
                     <div class="leaderInfo">
                        <span class="glyphicon glyphicon-ok ok"></span>
                        <h4>Study Leader</h4><br>
                        <span class="name">${leaderName.leader_name }</span>
                      
                       <button type="button" class="btn btn-xs btn-default infoBtn leaderBtn" value="${leaderName.leader_mem_cd  }">정보</button>
                        
                     </div><!-- end .leaderInfo -->
                     
                  </div><!-- end .memLeader -->
                  
                  
               <!--    <h3>스터디원</h3> -->
                 <c:forEach var="joinName" items="${joinName }">
                     <c:if test="${joinName.stu_join_name ne leaderName.leader_name}">
                        <div class="memLeader" id="">
                          <c:forEach var="memImg" items="${memImg }">
                              <c:if test="${memImg.join_mem_cd eq joinName.join_mem_cd}">
                              
                              <div class="leaderImg">
                              
                                    <c:choose>
                              		<c:when test="${empty memImg.mem_img  }">
                              		<img src="<%=cp %>/assets/images/basic.png" alt="" class="img-circle memImg" />
                              		</c:when>
                              		<c:when test="${not empty memImg.mem_img }">
                              		<img src="${memImg.mem_img }" alt="" class="img-circle memImg" />
                              		</c:when>
                              		
                              		</c:choose>
                                    
                                 </div><!-- end .leaderImg -->
                              
                              </c:if>
                           </c:forEach>
                           
                           <div class="leaderInfo">
                              <h4>Study Member</h4><br>
                              <span class="name">${joinName.stu_join_name }</span>
                              <input type="hidden" name="joinMemCd" id="joinMemCd" value="${joinName.join_mem_cd }"/>
                              
                              <button type="button" class="btn btn-xs btn-default infoBtn joinMemBtn" value="${joinName.join_mem_cd   }">정보</button>
                           
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