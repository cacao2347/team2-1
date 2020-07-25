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
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">

<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/spacelist.css" >
<style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
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
		
		// 상세 페이지로 이동
	   	$(".imageBtn").click(function()
	   	{
			var params = "spa_req_cd=" + $(this).val();
			location.href = "/FinalComeit/spacedetail.action?"+params;
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
				<img class="img-fluid rounded space-img" src="assets/images/spaimg.png" alt="studyImg">
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
			                                 ${areas.area_name }
			                              </option>
			                           </c:forEach>
			                  </select>
						</dd>
						<dd id="spcAreadd">
						</dd>
					</dl><!-- end region -->
					
					<dl class="region">
						<dt>유형</dt>
						<dd>
							<select name="region" class="form-control">
								<option value="전체">전체</option>
								<option value="카페">카페</option>
								<option value="스터디">스터디카페</option>
							</select>
						</dd>
					</dl>
					
					<dl class="inwon">
						<dt>시간</dt>
						<dd class="radio">
							<label for="all">
							<input type="radio" id="all" name="inwon" value="전체" checked="checked">전체
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveDown">
							<input type="radio" id="fiveDown" name="inwon" value="5명 미만">3시간 미만
							</label>
						</dd>
						<dd class="radio">
							<label id="fiveUp">
							<input type="radio" id="fiveUp" name="inwon" value="5명 이상">3시간 이상 ~ 5시간 미만
							</label>
							
						</dd>
						<dd class="radio">
							<label id="tenUp">
							<input type="radio" id="tenUp" name="inwon" value="10명 이상">5시간 이상
							</label>
							
						</dd>
					</dl><!-- end inwon -->
				</div><!-- end side -->
				</div><!-- 필터 끝 -->
				
				<!-- 본문 영역 -->
				<div class="col-md-6">
				
					<!-- 검색 영역 -->
					<div class="row">
						<div class="col-md-4">
							<div class="form-inline search">
								<input type="text" class="form-control tag" id="tag" placeholder="키워드" style="width: 150px;">
							    <button type="button" class="btn btn-primary searchBtn" style="width: 60px;">검색</button>
							</div>
						</div>
						<div class="col-md-8">
							<div class="form-inline search text-right">
								<select class="form-control">
									  <option>공간명</option>
									  <option>상호명</option>
								</select>
								<input type="text" class="form-control title" id="title">
								<button type="button" class="btn btn-primary searchBtn">검색</button>
							</div>
						</div>
					</div>
					
					
					
					<!-- 리스트 영역 -->
					<div class="row list">
						<div class="col-md-12">
						${count }개의 공간
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="create">
								<c:if test="${not empty sessionScope.spa_cd && sessionScope.loginType=='1'}" >
									<button type="button" class="btn btn-primary btn-sm createBtn" onClick="location.href='spacreate.action'">공간 개설</button>
								</c:if>
								</div>
							</div>
						</div>
						<div class="col-md-12" style="margin-top: 30px;">
						 <div class="item">
		                    <ul class="thumbnails" style="list-style:none;" >
		                        <c:forEach var="spaceList" items="${space }">
			                        <li class="col-sm-4 col-md-6" >	
										<div class="demo">
									      <figure class="imghvr-scale-top-left">
									     <%--  <input type="image" class="imageBtn" value="${spaceList.area_name }" src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;"> --%>
									      <%-- <button type="button" class="imageBtn"  value="${spaceList.area_name }"><img src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;"></button> --%>
									       <%-- <input type="image" src="<%=cp %>/assets/images/199.jpg" alt="53" class="imageBtn" style="width: 300px; height: 250px;" value="${spaceList.spa_req_cd }"onclick="imageBtn(this)"> --%>
									       <img src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;">
									        <figcaption>
									        <button type="button" class="imageBtn" value="${spaceList.spa_req_cd }" style="background-color:transparent;  border:0px transparent solid; text-align: left;outline:none;" >
									        <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
									        ${spaceList.area_name} ${spaceList.spc_area_name}</p>
									        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
									               영업 시간 : ${spaceList.str_time}시 ~ ${spaceList.end_time}시</p>
									        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
									               최대이용시간 : ${spaceList.use_hrs}시간</p>
									        <div class="form-inline">
									        <p><span class="glyphicon glyphicon-home" aria-hidden="true"></span> ${spaceList.type_name}</p>
									        <p><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> ${spaceList.busi_name}</p>
									        </div>
									        </button>
									        </figcaption>
									      </figure>
									      <div class="caption">
									      	<div class="nameAndCount">
											<h4>${spaceList.spa_name}</h4>
											<p class="feed"><span class="glyphicon glyphicon-heart heart" aria-hidden="true"></span>피드백수: ${spaceList.feedCount }개</p>
											</div>
											<p>&quot;${spaceList.one_intro}&quot;</p>
											<p>
											<ul class="list-study-tags">
											<c:forEach var="spaceTagss" items="${spaceTags }">
											<c:if test="${spaceTagss.spa_req_cd eq spaceList.spa_req_cd}">
												<li class="stack-item">${spaceTagss.tag_name }</li>
											</c:if>
											</c:forEach>
											</ul>
											<p>
										  </div>
										  </div>
			                        </li>
								</c:forEach>
		                    </ul>
			              </div>
				        </div>
					</div>
				</div><!-- 리스트 영역 끝 -->
					
				
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