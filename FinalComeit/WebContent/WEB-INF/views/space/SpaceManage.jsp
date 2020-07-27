<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>SpaceManage.jsp</title>
<!-- <link href="css/space-manage.css" rel="stylesheet">
<link href="css/business-frontpage.css" rel="stylesheet"> -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawVisualization);
	
	var list = new Array();
	<c:forEach items="${TotData}" var="TotData">
	list.push("${TotData.facility}");
	list.push("${TotData.kindness}");
	list.push("${TotData.price}");
	list.push("${TotData.location}");
	list.push("${TotData.noise}");
	</c:forEach>

	function drawVisualization() { 
		
		for ( var i = 0; i < list.length; i++) {
		    var facility= list[0];
		    var kindness= list[1];
		    var price= list[2];
		    var location= list[3];
		    var noise= list[4];
		}
		//alert(facility);
		//alert(kindness);
		//alert(price);
		//alert(location);
		//alert(noise);
		
		var data = google.visualization.arrayToDataTable([
				['년도', {label: '시설', type: 'number'},{label: '친절', type: 'number'}, {label: '가격', type: 'number'},
					{label: '위치', type: 'number'} , {label: '소음', type: 'number'}],
				['2020',  facility, kindness, price, location, noise],
			]);
		var options = {
				title : '업체명',
				vAxis: {title: '점수'},
				hAxis: {title: '년도'}, 
				seriesType: 'bars',
				series: {
		            0: { color: '#68aae3' },
		            1: { color: '#5683aa' },
		            2: { color: '#4b92cf' },
		            3: { color: '#2d6ca4' },
		            4: { color: '#336699' }}
			};
		
		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
	
	$(function()
	{
		// 리스트 페이지로 이동
	   	$(".listBtn").click(function()
	   	{
			//var params = "spa_req_cd=" + $(this).val();
			location.href = "/FinalComeit/spalist.action?"//+params;
		});
	});
	
</script>
</head>
<body>

	<div>
		<button type="button" class="btn btn-primary listBtn">공간등록</button>
	</div>
	<br><br>
	
	<!-- 업체 카드 영역 -->
      <!-- <h4>업체명</h4>
        <div class="card h-75">
          <img class="card-img-top" src="https://placehold.it/300x200" alt="">
          <div class="card-body">
            <h4 class="card-title">업체명</h4>
            <p class="card-text">스터디카페<br>서울 마포구<br>#태그</p>
          </div>
          <div class="card-footer">
            <a href="#" class="btn btn-primary">Find Out More!</a>
          </div>
        </div> -->
         <div  style="margin-top: 30px;">
		 <div class="item">
                  <ul class="thumbnails" style="list-style:none;" >
                      <c:forEach var="MyInfoList" items="${MyInfo }">
                      <c:if test="${empty MyInfoList}">
                      	등록된 공간이 없습니다.
                      </c:if>

                       <li class="col-sm-4 col-md-5" >	
						<div class="demo">
					      <figure class="imghvr-scale-top-left">
					     <%--  <input type="image" class="imageBtn" value="${spaceList.area_name }" src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;"> --%>
					      <%-- <button type="button" class="imageBtn"  value="${spaceList.area_name }"><img src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;"></button> --%>
					       <%-- <input type="image" src="<%=cp %>/assets/images/199.jpg" alt="53" class="imageBtn" style="width: 300px; height: 250px;" value="${spaceList.spa_req_cd }"onclick="imageBtn(this)"> --%>
					       <img src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 300px; height: 250px;">
					        <figcaption>
					        <button type="button" class="imageBtn" value="${MyInfoList.spa_req_cd }" style="background-color:transparent;  border:0px transparent solid; text-align: left;outline:none;" >
					        <p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					        ${MyInfoList.area_name} ${MyInfoList.spc_area_name}</p>
					        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					               영업 시간 : ${MyInfoList.str_time}시 ~ ${MyInfoList.end_time}시</p>
					        <p><span class="glyphicon glyphicon-time" aria-hidden="true"></span>
					               최대이용시간 : ${MyInfoList.use_hrs}시간</p>
					        <div class="form-inline">
					        <p><span class="glyphicon glyphicon-home" aria-hidden="true"></span> ${MyInfoList.type_name}</p>
					        <p><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> ${MyInfoList.busi_name}</p>
					        </div>
					        </button>
					        </figcaption>
					      </figure>
					      <div class="caption">
					      	<div class="nameAndCount">
							<h4>${MyInfoList.spa_name}</h4>
							<p class="feed"><span class="glyphicon glyphicon-heart heart" aria-hidden="true"></span>피드백수: ${MyInfoList.feedCount }개</p>
							</div>
							<p>&quot;${MyInfoList.one_intro}&quot;</p>
						  </div>
						  </div>
                       </li>
				</c:forEach>
                  </ul>
                  <div class="col-md-6" id="chart_div" style="width: 100%; height: 350px; margin-top: -35px;">
      		</div>
             </div>
        </div>
        
        <br>
        <div class="upandde" style="margin-left: 30px;">
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="submit" class="btn btn-secondary">삭제</button>
		</div>
		<br><br>
      
     
      
      
	
	
</body>
</html>