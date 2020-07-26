<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!-- 안녕 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COME-IT</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecturelist.css" >
<%-- <link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/lecturelist.css" > --%>

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<style type="text/css">

body
{
	font-family: 'Noto Sans KR', sans-serif !important;
}

</style>

<script type="text/javascript">

	$(function()
	{
		// AJAX 요청 및 응답 처리
        ajaxSpcAreaRequest();
		
     	// 지역명이 바뀌면 상세지역 ajax 호출
		$("#area").change(function()
		{
		   ajaxSpcAreaRequest();
		   
		});
		
		$("#allCheck").click(function()	
		{  
			if ($("#allCheck").is(':checked')) {
                $("input[type=checkbox]").prop("checked", true);
            } else {
                $("input[type=checkbox]").prop("checked", false);
            }
		});

		
		// 검색 버튼 클릭 시
		$("#searchBtn").click(function()
		{
			f = document.searchForm;
			f.action = "<%=cp %>/lecturelist.action";
			f.submit();
			
		});
		
		// 강의 각각 리스트 클릭 시 (로그인 전)
		$(".bFtitleBtn").click(function()
		{
			var result = confirm("로그인 후 이용 가능합니다.\n확인 버튼 클릭 시 로그인 페이지로 이동합니다.");
			
			if(result)
			{
				location.href = "/FinalComeit/memberlogin.action";
			}
			else if(result==null)
			{
				return;
			}
			
		});
		
		
		/*
		// 강의 각각 리스트 클릭 시 (로그인 후)
		$(".titleBtn").click(function()
		{
			//var params = "scrtCheck" + $
			//alert($(".stu_cd").val());
			
			//$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
			
			alert($(this).val());
			
			var params = "lec_cd=" + $(this).val();
			
			$.ajax(
			{
				type : "POST"
				, url : "stuscrtcheck.action"
				, data : params
				, dataType : "text"
				, async:false
				, success : function(data)
				{
					if(data != 0)
					{
						var result = prompt("비밀번호를 입력해 주세요 : ");
						
						if(result=="" || result==null)
							return;
						else if(result == data)
							location.href = "/FinalComeit/lecturedetail.action?" + params;
						else if(result != data)
							alert("비밀번호가 틀렸습니다!");
					}
					else
					{
						location.href = "/FinalComeit/lecturedetail.action?" + params;
					}
						
					
				}
				, error : function(e)
				{
					alert(e.responseText + "에러");
				}
			});
	
		});
		*/
		
		// 강의 개설 버튼 클릭 시 (로그인 전)
		$("#bFcreateBtn").click(function()
		{
			var result = confirm("로그인 후 이용 가능합니다.\n확인 버튼 클릭 시 로그인 페이지로 이동합니다.");
			
			if(result)
			{
				location.href = "/FinalComeit/memberlogin.action";
			}
			else if(result==null)
			{
				return;
			}
		});
		
		// 강의 개설 버튼 클릭 시 (로그인 후)
		$("#createBtn").click(function()
		{
			// 여기서 ajax 처리로 개수 체크하기
			
			$.ajax(
			{
				type : "POST"
				, url : "lecturecreatecnt.action"
				, dataType : "text"
				, success : function(data)
				{
					if(data >= 10)
					{
						alert("강의는 최대 10개까지 참가 가능합니다.\n강의 종료 후 새로운 강의에 참가해주세요.");
					}
					else if(data <= 10)
					{
						location.href = "/FinalComeit/lecturecreate.action";
					}
					else
					{
						alert("판별불가");
					}
					
				}
				, error : function(e)
				{
					alert(e.responseText + "에러");
				}
			});
			
			
			
		});
		
	});
	
	// 지역에 따른 세부지역 불러오는 ajax
    function ajaxSpcAreaRequest()
    {

       $.post("areaajax.action",
       {
          area_cd : $("#area").children("option:selected").val()
       }, function(data)
       {
          //alert(data);
          $("#spcAreadd").html(data);
          $("#spcArea").removeAttr("disabled");
       });
    }
	

</script>


</head>
<body class="">
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
</div>
			
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-8">
				<img class="img-fluid rounded study-img" src="assets/images/study2.jpg" alt="studyImg">
				</div>
				<div class="col-md-2">
				</div>
			</div>
			<div class="row content">
				<div class="col-md-2">
				</div>
				<div class="col-md-2"><!-- 필터 시작 -->
				<div class="side">
				
					<dl class="region">
						<dt>지역</dt>
						<dd>
							<select name="area" id="area" class="area form-control">
								<option value="0">전체</option>
								<c:forEach var="areas" items="${area }">
									<option value="${areas.area_cd }"
										${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
										${areas.area_name }</option>
								</c:forEach>
							</select>
						</dd>
						
						<dd id="spcAreadd">
							
						</dd>
						
					</dl><!-- end region -->
					
					<dl class="inwon">
						<dt>인원 수</dt>
						<dd class="radio">
							<label for="all">
							<input type="radio" id="all" name="inwon" value="전체" checked="checked">전체
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveDown">
							<input type="radio" id="fiveDown" name="inwon" value="5명 미만">5명 미만
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveUp">
							<input type="radio" id="fiveUp" name="inwon" value="5명 이상">5명 이상 ~ 10명 미만
							</label>
							
						</dd>
						<dd class="radio">
							<label id="tenUp">
							<input type="radio" id="tenUp" name="inwon" value="10명 이상">10명 이상
							</label>
							
						</dd>
					</dl><!-- end inwon -->
				
				</div><!-- end side -->
				</div><!-- 필터 끝 -->
				
				<!-- 본문 영역 -->
				<div class="col-md-6">
				
					<!-- 검색 영역 -->
					<div class="row">
						<div class="col-md-12">
						<div class="form-inline search">
						
						<form name="searchForm" method="post">
							<select name="searchKey" class="form-control selectField" style="width: 20%;">
								<option value="lec_name">제목</option>
								<option value="name">강사명</option>
							</select>
							
							<input type="text" name="searchValue" placeholder="관심 키워드 또는 스터디방 제목으로 검색하세요!" class="form-control boxTF" style="width: 70%;">
							<input type="button" value="검색" class="btn btn-primary searchBtn" id="searchBtn" style="width: 9%">
						</form>
							<!-- <input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
							<input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
							<button type="button" id="searchBtn" class="btn btn-primary searchBtn">검색</button> -->
						</div>
						</div>
					</div>
					
					
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						${count }개의 강의에서 수강인원을 모집중입니다!
						</div>
						<div class="col-md-12">
						<ul class="list-study">
						
							<c:forEach var="lecs" items="${lec }">
								<li class="list-study-item">
								<div class="item-header">
								
								<c:choose>
								<c:when test="${empty lecs.img_url }">
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</c:when>
								<c:when test="${not empty lecs.img_url }">
								<img class="study-logo" alt="study-logo" src="${lecs.img_url }">
								</c:when>
								</c:choose>
								</div>
								<div class="item-body">
								<div class="firstLine">
									<div class="listTitle">
										<h4 class="study-title" style="font-weight: bold;">
										
										<c:choose>
										<c:when test="${empty id }">
											<button type="button" class="btn btn-link bFtitleBtn" value="${lecs.lec_cd }">${lecs.lec_name}</button>
										</c:when>
										
										<c:when test="${not empty id }">
											<button type="button" class="btn btn-link titleBtn" value="${lecs.lec_cd}">${lecs.lec_name}</button>
										</c:when>
										</c:choose>
										
										
										</h4>
									</div>
									
								</div>
								<div class="form-inline">
									<h5 class="study-date">${lecs.str_date} ~ ${lecs.end_date}</h5>
									<h5 class="study-term">${lecs.lec_term}</h5>
								</div>
								
								<ul class="study-info">
									<li class="pencil"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> ${lecs.name }</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> ${lecs.area_name } ${lecs.spc_area_name }</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${lecs.min_mem }~${lecs.max_mem }명</li>
									
								</ul>
								
								<ul class="study-info">
								<c:forEach var="lecHrDayss" items="${lecHrDays }">
									<c:if test="${lecs.lec_cd eq lecHrDayss.lec_cd }">
									<li class="day"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>${lecHrDayss.day_name}</li>
									<li class="lec_time"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>${lecHrDayss.str_hrs}시 ~ ${lecHrDayss.end_hrs}시</li>
									</c:if>
									</c:forEach>
								</ul>

								
								<ul class="list-study-tags">
								<c:forEach var="lecTagss" items="${lecTags }">
								<c:if test="${lecs.lec_cd eq lecTagss.lec_cd }">
									<li class="stack-item">${lecTagss.int_tag}</li>
								</c:if>
								</c:forEach>
								</ul>

								</div>
								
							</li>
							
							</c:forEach>
						</ul>
						
						</div>
					</div><!-- 리스트 영역 끝 -->
	
					
					<div class="row">
					<div class="col-md-12">
						<div class="create">
							<c:choose>
							
							<c:when test="${empty id }">
								<button type="button" id="bFcreateBtn" class="btn btn-primary btn-sm createBtn">강의 개설</button>
							</c:when>
							
							<c:when test="${not empty id }">
								<button type="button" id="createBtn" class="btn btn-primary btn-sm createBtn">강의 개설</button>
							</c:when>
							</c:choose>
						</div>
					</div>
					</div>
						
					
					<!-- 페이징 영역 -->
					<div class="row paging">
					<div class="col-md-12">
						<!-- <nav>
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
						</nav> -->
						<!-- 페이징 처리에 따른 페이지 인덱스 적용 -->
						<c:if test="${dataCount != 0 }">
							<div align="center">
								${pageIndexList }
							</div>
						</c:if>
						
						<!-- 테이블에 데이터가 존재하지 않을 경우 -->
						<c:if test="${dataCount == 0 }">
							<tr style="height: 30px; background-color: #FFFFFF;">
								<td align="center" colspan="3">
									등록된 자료가 존재하지 않습니다.
								</td>
							</tr>
						</c:if>
					</div>
					</div><!-- 페이징 영역 끝 -->
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
</div>
</body>
</html>