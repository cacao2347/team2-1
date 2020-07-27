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

	function drawVisualization() { 
		var data = google.visualization.arrayToDataTable([
				['년도', '시설', '친절', '가격', '위치', '소음', 'Average'],
				['2016',  5,      8,         2,             8,           5,      5.6],
				['2017',  5,      2,        9,             8,          8,      6.4],
				['2018',  7,      6,        7,             8,           7,      7],
				['2019',  9,      10,        5,             6,           5,      7],
				['2020',  6,      9,         9,             6,          6,      7.2]
			]);
		var options = {
				title : '업체명',
				vAxis: {title: '점수'},
				hAxis: {title: '년도'}, 
				seriesType: 'bars',
				series: {5: {type: 'line'}}
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
	 <div class="row">
      <div class="col-md-5 mb-4">
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
         
        
        <br>
        <div class="upandde">
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="submit" class="btn btn-secondary">삭제</button>
		</div>
		<br><br>
      </div>
      
      <!-- 그래프영역 -->
     
      <div class="col-md-6" id="chart_div" style="width: 900px; height: 500px;">
      </div>
      
	</div>
	
	
</body>
</html>