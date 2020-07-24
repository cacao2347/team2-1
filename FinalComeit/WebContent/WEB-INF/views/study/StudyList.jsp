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
<title>COME-IT</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studylist.css" >

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
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

		
		// 카테고리
		// 언어 클릭 시
		
		// 면접 클릭 시
		
		// 자격증 클릭 시
		
		// 기타 클릭 시
		
		
		
		// 선택 초기화 버튼 클릭 시
		
		// 지역, 인원수, 레벨은 다 선택하고 '필터' 버튼 어떤지
		
		// 검색 버튼 클릭 시
		$("#searchBtn").click(function()
		{
			/* var k = $(this).val();
			$(".list-study").hide();
			
			//alert(k);
			var temp = $(".list-study > ul > li > item-body > firstLine > listTitle > study-title:contains('" + k + "')");
			
			$(temp).parent().show(); */
			
			
			
		});
		
		// 스터디 각각 리스트 클릭 시 (로그인 전)
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
		
		// 스터디 각각 리스트 클릭 시 (로그인 후)
		$(".titleBtn").click(function()
		{
			//var params = "scrtCheck" + $
			//alert($(".stu_cd").val());
			
			//$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
			
			alert($(this).val());
			
			var params = "stu_cd=" + $(this).val();
			
			$.ajax(
			{
				type : "POST"
				, url : "stuscrtcheck.action"
				, data : params
				, dataType : "json"
				, success : function(data)
				{
					if(data != 0)
					{
						var result = prompt("비밀번호를 입력해 주세요 : ");
						
						if(result=="" || result==null)
							return;
						else if(result == data)
							location.href = "/FinalComeit/studydetail.action";
						else if(result != data)
							alert("비밀번호가 틀렸습니다!");
					}
					else
					{
						location.href = "/FinalComeit/studydetail.action";
					}
						
					
				}
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
	
		});
		
		// 스터디방 개설 버튼 클릭 시 (로그인 전)
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
		
		// 스터디방 개설 버튼 클릭 시 (로그인 후)
		$("#createBtn").click(function()
		{
			location.href = "/FinalComeit/studycreate.action";
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
<body class="padding">
<c:if test="">

</c:if>

<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form method="post" >
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
					<dl class="cat">
						<dt>카테고리</dt>
						<dd><a href="">전체</a></dd>
						<c:forEach var="stuCats" items="${stuCat }">
							<!-- <dd><a href="">언어</a></dd>
							<dd><a href="">면접</a></dd>
							<dd><a href="">자격증</a></dd>
							<dd><a href="">기타</a></dd> -->
							<dd><a href="">${stuCats.cat_name }</a></dd>
						
						</c:forEach>
						
					</dl><!-- end cat -->
					
					<dl class="region">
						<dt>지역</dt>
						<dd>
							<select name="area" id="area" class="area form-control">
			                  <option value="0">전체</option>
			                     <c:forEach var="areas" items="${area }">
			                              <option value="${areas.area_cd }" 
			                              ${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
			                                 ${areas.area_name }
			                              </option>
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
					
					<dl class="level">
						<dt>레벨</dt>
						<dd class="checkbox">
							<label id="allChecklabel">
							<input type="checkbox" id="allCheck" name="all" value="전체" checked="checked">전체
							</label>
						</dd>
						
						<!-- <dd class="checkbox">
							<label id="low">
							<input type="checkbox" id="low" name="low" value="초급">초급
							</label>
						</dd>
						<dd class="checkbox">
							<label id="middle">
							<input type="checkbox" id="middle" name="middle" value="중급">중급
							</label>
						</dd>
						<dd class="checkbox">
							<label id="high">
							<input type="checkbox" id="high" name="high" value="고급">고급
							</label>
						</dd> -->
						<c:forEach var="levels" items="${level }">
							<dd class="checkbox">
								<label>
								<input type="checkbox" checked="checked" value="${levels.lv_cd }">${levels.lv }
								</label>
							</dd>
						
						</c:forEach>
					</dl><!-- end level -->
				
				</div><!-- end side -->
				</div><!-- 필터 끝 -->
				
				<!-- 본문 영역 -->
				<div class="col-md-6">
				
					<!-- 검색 영역 -->
					<div class="row">
						<div class="col-md-12">
						<div class="form-inline search">
							<input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
							<input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
							<button type="button" id="searchBtn" class="btn btn-primary searchBtn">검색</button>
						</div>
						</div>
					</div>
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						${count }개의 스터디방에서 스터디원을 모집중입니다!
						</div> 
						<div class="col-md-12">
						<ul class="list-study">
														
							<c:forEach var="studys" items="${study }">
								<li class="list-study-item">
								<div class="item-header">
								<img class="study-logo" alt="study-logo" src="assets/images/studylogo.PNG">
								</div>
								<div class="item-body">
								<div class="firstLine">
									<div class="listTitle">
										<h4 class="study-title" style="font-weight: bold;">
										
										<c:choose>
										<c:when test="${empty id }">
											<button type="button" class="btn btn-link bFtitleBtn" value="${studys.stu_cd }">[${studys.cat_name }] ${studys.title }</button>
										</c:when>
										
										<c:when test="${not empty id }">
											<button type="button" class="btn btn-link titleBtn" value="${studys.stu_cd }">[${studys.cat_name }] ${studys.title }</button>
										</c:when>
										</c:choose>
										
										
										</h4>
									</div>
									
									<c:if test="${studys.scrt_num ne '0'}">
										<div class="lock">
										<h5><span class="glyphicon glyphicon-lock icon" aria-hidden="true"></span></h5>
										<input type="hidden" name=currentbook${status.index} class="scrtCheck" value="${studys.scrt_num }">
										</div> 
									</c:if>
									
									<!-- 
									<div class="lock">
										<h5><span class="glyphicon glyphicon-lock icon" aria-hidden="true"></span></h5>
									</div> 
									-->
									
								</div>
								<div class="form-inline">
									<h5 class="study-date">${studys.str_date } ~ ${studys.end_date }</h5>
									<h5 class="study-term">${studys.meet_term }개월</h5>
								</div>
								
								<ul class="study-info">
									<li class="level"><span class="glyphicon glyphicon-stats" aria-hidden="true"></span> ${studys.lv }</li>
									<li class="location"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> ${studys.area_name } ${studys.spc_area_name }</li>
									<li class="numb"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> ${studys.mem_num }명</li>
								</ul>

								
								<ul class="list-study-tags">
								<c:forEach var="studyTagss" items="${studyTags }">
								<c:if test="${studyTagss.stu_cd eq studys.stu_cd}">
									<li class="stack-item">${studyTagss.int_tag_name }</li>
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
								<button type="button" id="bFcreateBtn" class="btn btn-primary btn-sm createBtn">스터디방 개설</button>
							</c:when>
							
							<c:when test="${not empty id }">
								<button type="button" id="createBtn" class="btn btn-primary btn-sm createBtn">스터디방 개설</button>
							</c:when>
							</c:choose>
						
						</div>
					</div>
					</div>
						
					
					<!-- 페이징 영역 -->
					<div class="row paging">
					<div class="col-md-12">
						<nav>
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
						</nav>
					</div>
					</div><!-- 페이징 영역 끝 -->
					
				</div>
				
			</div>
		</form>
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