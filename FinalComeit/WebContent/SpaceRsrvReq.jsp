<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SpaceRsrvReq.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	    // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	    $(".menu>a").click(function(){
	    	 var submenu = $(this).next("ul");
	    	 
	            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            if( submenu.is(":visible") ){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	            }
	        });
	    });
	</script>
</head>

<body>
	<div>
	    <ul>
	        <li class="menu"style="margin-top: 20px;">
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
	               					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">거부</button>
	               				</td>
	               			</tr>
	               			<tr>
	               				<td>길동</td>
	               				<td>2020.07.13</td>
	               				<td>오후1시~4시</td>
	               				<td>4명</td>
	               				<td>2020.07.06</td>
	               				<td>
	               					<button class="btn btn-primary">승인</button>
	               					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">거부</button>
	               				</td>
	               			</tr>
	               		</tbody>
	               		</table>
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
	               					<button class="btn btn-primary">승인</button>
	               					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">거부</button>
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
	               					<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">거부</button>
	               				</td>
	               			</tr>
	               		</tbody>
	               		</table>
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
	
					<!-- 모달 -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">거부 사유</h5>
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
					        X
					        </button>
					      </div>
					      <div class="modal-body mbody">
					      	
					      	
					      	<table class="table" style="margin-top: 30px;">
					      		
					      		<tr>
					      			<td style="border-top:none"><div class="rsnTit">사유</div></td>
					      			<td style="border-top:none">
					      				<input type="text" class="form-control" style="width: 300px;" placeholder="예) 자리가 부족합니다.">
					      			</td>
					      		</tr>
					      	</table>
					      	
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary">확인</button>
					      </div>
					    </div>
					  </div>
					</div><!-- 모달 끝  -->
</body>
</html>