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
<title>SpaceDetail.jsp</title>
 <!-- Bootstrap core CSS -->
<link href="<%=cp %>/assets/css/space-detail.css"  rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="shortcut icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">
<link rel="icon" href="<%=cp %>/assets/images/pen_1.ico" type="image/x-icon">

<link rel="stylesheet" href="<%=cp %>/assets/css/spafeedback.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet"><style type="text/css">
body{font-family: 'Noto Sans KR', sans-serif;}
</style>

<script type="text/javascript">
	/* 달력 */
	$(document).ready(function(){
	    var date_input=$('input[name="date"]'); //our date input has the name "date"
	    var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
	    var options={
	      format: 'yyyy/mm/dd',
	      container: container,
	      todayHighlight: true,
	      autoclose: true,
	    };
	    date_input.datepicker(options);
	  });
	
	/* 피드백 */
	 $(document).ready(function() {
        $("#slider").slider({
            animate: true,
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(1,ui.value); //changed
            }
        });

        $("#slider2").slider({
            animate: true,
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(2,ui.value); //changed
            }
        });
        
        $("#slider3").slider({
            animate: true,
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(3,ui.value); //changed
            }
        });
        
        $("#slider4").slider({
            animate: true,
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(4,ui.value); //changed
            }
        });
        
        $("#slider5").slider({
            animate: true,
            value:0,
            min: 0,
            max: 10,
            step: 1,
            slide: function(event, ui) {
                update(5,ui.value); //changed
            }
        });
        

        //Added, set initial value.
        $("#spa1").val(0);
        $("#spa2").val(0);
        $("#spa3").val(0);
        $("#spa4").val(0);
        $("#spa5").val(0);
        $("#spa1-label").text(0);
        $("#spa2-label").text(0);
        $("#spa3-label").text(0);
        $("#spa4-label").text(0);
        $("#spa5-label").text(0);
        
        update();
    });

    function update(slider,val) {
      var $spa1 = slider == 1?val:$("#spa1").val();
      var $spa2 = slider == 2?val:$("#spa2").val();
      var $spa3 = slider == 3?val:$("#spa3").val();
      var $spa4 = slider == 4?val:$("#spa4").val();
      var $spa5 = slider == 5?val:$("#spa5").val();


       $( "#spa1" ).val($spa1);
       $( "#spa1-label" ).text($spa1);
       $( "#spa2" ).val($spa2);
       $( "#spa2-label" ).text($spa2);
       $( "#spa3" ).val($spa3);
       $( "#spa3-label" ).text($spa3);
       $( "#spa4" ).val($spa4);
       $( "#spa4-label" ).text($spa4);
       $( "#spa5" ).val($spa5);
       $( "#spa5-label" ).text($spa5);

       $('#slider a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa1+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider2 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa2+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider3 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa3+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider4 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa4+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
       $('#slider5 a').html('<label><span class="glyphicon glyphicon-chevron-left"></span>'+$spa5+'<span class="glyphicon glyphicon-chevron-right"></span></label>');
    } 
    
    $(document).ready(function () { $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .8) + 'px;}.modal-open .modal{overflow-y: hidden !important;overflow-x: hidden !important;}</style>'); });

</script>
</head>
<body>
<!-- 헤더 -->
<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/header.jsp"></c:import>
	</div>
</div>
			

<!-- Page Content -->
  <div class="container">

    <div class="row">
     <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">${spaceInfo.spa_name }</h1>

        <!-- Author -->
        <p class="lead">${spaceInfo.busi_name }</p>
        <hr>
        </div>

      <!-- Post Content Column -->
      <div class="col-lg-8">
        <!-- Preview Image -->
        <img src="<%=cp %>/assets/images/199.jpg" alt="53" style="width: 755px; height: 250px;">

        <hr>

        <!-- Post Content -->
        <div class="lead">
        <ul class="list-space-tags form-inline">
		<c:forEach var="spaceTagss" items="${spaceTag }">
		<c:if test="${spaceTagss.spa_req_cd eq spaceInfo.spa_req_cd}">
		<li class="stack-item"><h4 >#${spaceTagss.tag_name }</h4></li>
		</c:if>
		</c:forEach>
		</ul>
		<h5>${spaceInfo.type_name }</h5>
        </div>
        <br><br>
        
        <!-- 공간 정보 부분 -->
        <div class="row">
		<div class="col-md-12 font-14">
			<dl>
				<dt class="dtbr">
					한줄 소개
				</dt>
				<dd>
					${spaceInfo.one_intro }
				</dd>
				<dt class="dtbr">
					상세 소개
				</dt>
				<dd>
					${spaceInfo.dtl_intro }
				</dd>
				<dt class="dtbr">
					예약시 주의사항
				</dt>
				<dd>
				    ${spaceInfo.rsv_notes }
				</dd>
				<dt class="dtbr">
					시설 안내
				</dt>
				<dd>
				<div class="row">
					<div class="col-md-12">
						<ul class=" ">
							<c:forEach var="fcltys" items="${fclty }">
							<c:if test="${fcltys.spa_req_cd eq spaceInfo.spa_req_cd}">
							<li class=""><h4 >${fcltys.content }</h4></li>
							</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				</dd>
			</dl>
		</div>
	</div><!-- end row -->
	
	
				
        
   <!-- 댓글 목록 영역 -->
	<div class="feed">
		<div class="reList">
			<div class="count">
			<span class="glyphicon glyphicon-heart heart" aria-hidden="true"></span>피드백참여: ${spaceInfo.feedCount }명</p>
			</div>
			<table class="table table-hover table-bordered">
				<tr>
					<!-- <th>Feedback<button type="button" class="btn btn-primary btnfeed">등록</button></th> -->
					<th colspan="6">Feedback
					<c:forEach var="feedChecks" items="${feedCheck }">
					<c:if test="${feedChecks.mem_id eq  sessionScope.id}">
					<button type="button" class="btn btn-primary btnfeed" data-toggle="modal" data-target="#staticBackdrop2">등록하기</button>
					</c:if>
					</c:forEach></th> 
				</tr>
				<tr>
					<td class="countNum">번호</td>
					<td>시설</td>
					<td>친절</td>
					<td>가격</td>
					<td>위치</td>
					<td>소음</td>
				</tr>
				<c:forEach var="feedbacks" items="${feedback }">
				<c:if test="${feedbacks.spa_req_cd eq spaceInfo.spa_req_cd}">
				<tr>
					<td>
						<c:set var="countNum" value="${countNum + 1}" />
						<div class="countNum">${countNum }</div>
					</td>
					<td>
						${feedbacks.facility }
					</td>
					<td>
						${feedbacks.kindness }
					</td>
					<td>
						${feedbacks.price }
					</td>
					<td>
						${feedbacks.location }
					</td>
					<td>
						${feedbacks.noise }
					</td>
				</tr>
				</c:if>
				</c:forEach>
				<!-- <tr>
					<td class="reTop">
						<h4>홍길동</h4>
						<h5>2020-06-19 01:05:53</h5>
						<button type="button" class="btn btn-link repBtn">신고</button>
						<p>
							등록된 댓글 노출 영역입니다.
						</p>
					</td>
				</tr>
				<tr>
					<td class="reTop">
						<h4>홍길동</h4>
						<h5>2020-06-19 01:05:53</h5>
						<button type="button" class="btn btn-link repBtn">신고</button>
						<button type="button" class="btn btn-link delBtn">삭제</button>
						<p>
							등록된 댓글 노출 영역입니다.
						</p>
					</td>
				</tr> -->
			</table>
		</div>
	</div>
	 </div>
	 
	 
	 <!-- 모달 -->
		<div class="modal fade" id="staticBackdrop2" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel2" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-content">
		      <div class="head">
		      <!-- 피드백 -->
		      	<div class="container modalfeed modal-body modal-dialog">
		      	<button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
		        X
		        </button>
      <!-- START -->
      <div class="price-box">
	 <div class="modal-body mbody">
          			<div class="price-slider">
            		<h4 class="great" style="color: #336699; font-weight: bold;" >시설</h4>
           			 <span>공간의 시설 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider" ></div>
            		 <input type="hidden" id="spa1" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">친절</h4>
           			 <span>공간의 친절 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider2"></div>
            		 <input type="hidden" id="spa2" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">가격</h4>
           			 <span>공간의 가격 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider3"></div>
            		 <input type="hidden" id="spa3" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">위치</h4>
           			 <span>공간의 위치 만족도를 평가하세요!</span>
            		<div class="col-sm-12">
            		 <div id="slider4"></div>
            		 <input type="hidden" id="spa4" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
            		<h4 class="great1"  style="color: #336699; font-weight: bold;">소음</h4>
           			 <span>공간의 소음 만족도를 평가하세요!0(소음강함)~10(소음없음)</span>
            		<div class="col-sm-12">
            		 <div id="slider5"></div>
            		 <input type="hidden" id="spa5" class="form-control">
            		</div>
          			</div>
          			<div class="price-slider" style="margin-top: 15px;">
           			 <h4 class="great1"  style="color: #336699; font-weight: bold;">상세후기</h4>
           			 <span>공간에 대한 상세 피드백 후기를 남겨주세요! (선택사항)</span>
					<div class="deev">
            			<textarea rows="5" cols="60"></textarea>
            		</div>
          			</div>

          <div class="form-group">
            <div class="col-sm-12">
              <button type="submit" class="btn btn-primary btn-lg btn-block">등록하기 <span class="glyphicon glyphicon-chevron-right pull-right" style="padding-right: 10px;"></span></button>
            </div>
          </div>
</div>
      </div>

		      	<!-- 피드백 -->
		      </div>
		    </div>
		  </div>
		</div><!-- 모달 끝  -->
					

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">


        <!-- Search Widget -->
        <div class="card my-0 cardgray">
          <h5 class="card-header">업체 정보</h5>
          <div class="card-body">
          	<dl>
          		<dt>대표자명</dt>
          		<dd>${spaceInfo.rprsn_name }</dd>
          		<dt>전화번호</dt>
          		<dd>${spaceInfo.tel }</dd>
          		<dt>영업 정보</dt>
          		<dd>영업시간 : ${spaceInfo.str_time }시 ~ ${spaceInfo.end_time }시<br> 최대 이용시간: ${spaceInfo.use_hrs }시</dd>
          	</dl>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">위치</h5>
          <div class="card-body">
          <!-- 지도넣는 부분 -->
          <address>
				 <strong>업체 주소</strong><br /> ${spaceInfo.area_name } ${spaceInfo.spc_area_name }<br />${spaceInfo.dtl_addr }<br />
			</address>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
						예약하기
					</button>
					
					<!-- 모달 -->
					<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header head">
					        <h5 class="modal-title mTit" id="staticBackdropLabel">공간 예약</h5>
					        <button type="button" class="close xBtn" data-dismiss="modal" aria-label="Close">
					        X
					        </button>
					      </div>
					      <div class="modal-body mbody">
					      	
					      	
					      	<table class="table" style="margin-top: 30px;">
					      		
					      		<tr>
					      			<td style="border-top:none"><div class="rsnTit">예약일</div></td>
					      			<td style="width: 180px;border-top:none">
								      <div class="form-group">
								        <label class="control-label" for="date">Date</label>
								        <input class="form-control" id="date" name="date" placeholder="YYYY/MM/DD" type="text" style="width: 150px;"/>
								      </div>
					      			</td>
					      			<td style="border-top:none">
					      				<label class="control-label" for="date">시간</label>
					      				<input type="text" class="form-control" style="width: 150px;" placeholder="예) 3(숫자만 입력)">
					      			</td>
					      		</tr>
					      		<tr>
					      			<td><div class="rsnTit">예약정보</div></td>
					      			<td>
					      			  <div class="form-group">
								        <label class="control-label" for="tot">총 이용시간</label>
								        <input type="text" class="form-control" style="width: 150px;" id="tot" placeholder="예) 2(숫자만 입력)">
								      </div>
					      			</td>
					      			<td >
					      				<div class="form-group"><label class="control-label" for="peo">인원수</label>
					      				<input type="text" class="form-control content" id="peo" style="width: 150px;"  placeholder="예) 2(숫자만 입력)"></div>
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
          
          </div>
        </div>

	<button type="button" id="report" class="btn btnEvent" style="background-color:transparent;float: right;  border:0px transparent solid;outline:none;">
		<img src="<%=cp %>/assets/images/report.png" alt="btnImages" class="btnImages" style="width: 35px;">
	</button>
    </div>
    <!-- /.row -->
    

</div>
  </div>
  <!-- /.container -->

<div class="row">
	<div class="col-md-12">
	<c:import url="/WEB-INF/views/footer.jsp"></c:import>
	</div>
</div>


		

  <!-- Bootstrap core JavaScript -->
<%--   <script src="<%=cp %>/assets/js/jquery.min.js"></script>
  <script src="<%=cp %>/assets/js/bootstrap.bundle.min.js"></script> --%>

</body>
</html>