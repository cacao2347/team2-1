<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function () {
	$.datepicker.regional['ko'] = {
		closeText: '닫기',
		prevText: '이전달',
		nextText: '다음달',
		currentText: '오늘',
		monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
		'7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월',
		'7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		weekHeader: 'Wk',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '',
		showOn: 'both',
		buttonText: "달력",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-99:c+99',
	};
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	var datepicker_default = {
		showOn: 'both',
		buttonText: "검색",
		currentText: "이번달",
		changeMonth: true,
		changeYear: true,
		showButtonPanel: true,
		yearRange: 'c-99:c+99',
		showOtherMonths: true,
		selectOtherMonths: true
	}

	datepicker_default.closeText = "선택";
	datepicker_default.dateFormat = "yy-mm";
	datepicker_default.onClose = function (dateText, inst) {
		var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
		var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
		$(this).datepicker('setDate', new Date(year, month, 1));
	}

	datepicker_default.beforeShow = function () {
		var selectDate = $("#sdate").val().split("-");
		var year = Number(selectDate[0]);
		var month = Number(selectDate[1]) - 1;
		$(this).datepicker( "option", "defaultDate", new Date(year, month, 1) );
	}

	$("#sdate").datepicker(datepicker_default);
	
	
	
});
</script>

<style type="text/css">
table.ui-datepicker-calendar { display:none; }
</style>
</head>
<body>
<form name="frmEX">
날짜 선택 <input type="text" name="sdate" id="sdate" size="7" maxlength="7" value="2020-07" />
</form>
<br>
<div class="radio">
    <label for="foo1">
        <input type="radio" name="ra" id="foo1">
        전체
    </label>
    <label for="foo2">
        <input type="radio"name="ra" id="foo2">
        승인
    </label>
    <label for="foo3">
        <input type="radio"name="ra" id="foo3">
        거부
    </label>
</div>
	<div>
	    <ul>
	        <li class="menu" style="margin-top: 20px;">
	            <a>업체명1</a>
	            <ul>
	                <li style="margin-top: 30px;">
	               		<table class="table table-hover table-bordered">
	               		<thead>
	               			<tr>
	               				<th>아이디</th>
	               				<th>날짜</th>
	               				<th>요청시간</th>
	               				<th>인원</th>
	               				<th>요청한날</th>
	               				<th>승인여부</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               			<tr>
	               				<td>길동</td>
	               				<td>2020.07.12</td>
	               				<td>오후1시~3시</td>
	               				<td>4명</td>
	               				<td>2020.07.04</td>
	               				<td>
	               					<button class="btn btn-primary">승인</button>
	               				</td>
	               			</tr>
	               			<tr>
	               				<td>길동</td>
	               				<td>2020.07.13</td>
	               				<td>오후1시~4시</td>
	               				<td>4명</td>
	               				<td>2020.07.06</td>
	               				<td>
	               					<button class="btn btn-secondary">거부</button>
	               				</td>
	               			</tr>
	               		</tbody>
	               		</table>
	               		<br>
	               		<!-- 페이징 영역 -->
						<div class="paging text-center">
							<div class="col-md-12">
								<nav>
									<ul class="pagination">
						            <li class="page-item"><a href="#" class="page-link">Previous</a></li>
						            <li class="page-item"><a href="#" class="page-link">1</a></li>
						            <li class="page-item"><a href="#" class="page-link">2</a></li>
						            <li class="page-item"><a href="#" class="page-link">3</a></li>
						            <li class="page-item"><a href="#" class="page-link">4</a></li>
						            <li class="page-item"><a href="#" class="page-link">Next</a></li>
						            </ul>
								</nav>
							</div>
						</div>
					</li>
	            </ul>
	        </li>
	        <li class="menu" style="margin-top: 20px;">
	            <a>업체명2</a>
	            <ul>
	                <li style="margin-top: 30px;">
	                <table class="table table-hover table-bordered">
	               		<thead>
	               			<tr>
	               				<th>아이디</th>
	               				<th>날짜</th>
	               				<th>요청시간</th>
	               				<th>인원</th>
	               				<th>요청한날</th>
	               				<th>승인여부</th>
	               			</tr>
	               		</thead>
	               		<tbody>
	               			<tr>
	               				<td>길동</td>
	               				<td>2020.07.12</td>
	               				<td>오후1시~2시</td>
	               				<td>4명</td>
	               				<td>2020.07.07</td>
	               				<td>
	               					<button class="btn btn-secondary">거부</button>
	               				</td>
	               			</tr>
	               			<tr>
	               				<td>길동</td>
	               				<td>2020.07.13</td>
	               				<td>오후2시~5시</td>
	               				<td>4명</td>
	               				<td>2020.07.08</td>
	               				<td>
	               					<button class="btn btn-primary">승인</button>
	               				</td>
	               			</tr>
	               		</tbody>
	               		</table>
	               		<br>
	               		<!-- 페이징 영역 -->
						<div class="paging text-center">
							<div class="col-md-12">
								<nav>
									<ul class="pagination">
						            <li class="page-item"><a href="#" class="page-link">Previous</a></li>
						            <li class="page-item"><a href="#" class="page-link">1</a></li>
						            <li class="page-item"><a href="#" class="page-link">2</a></li>
						            <li class="page-item"><a href="#" class="page-link">3</a></li>
						            <li class="page-item"><a href="#" class="page-link">4</a></li>
						            <li class="page-item"><a href="#" class="page-link">Next</a></li>
						            </ul>
								</nav>
							</div>
						</div>
	               		</li>
	            </ul>
	        </li>
	    </ul>
	</div>


</body>
</html>