<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/spacecreate.css">
<style type="text/css">

 body {
    margin-top:30px;
    background-image: url('assets/images/199.jpg');
}
</style>
<script type="text/javascript">
	$(document).ready(function () {
		
	    var navListItems = $('div.setup-panel div a'),
	        allWells = $('.setup-content'),
	        allNextBtn = $('.nextBtn');
	
	    allWells.hide();
	
	    navListItems.click(function (e) {
	        e.preventDefault();
	        var $target = $($(this).attr('href')),
	            $item = $(this);
	
	        if (!$item.hasClass('disabled')) {
	            navListItems.removeClass('btn-success').addClass('btn-default');
	            $item.addClass('btn-success');
	            allWells.hide();
	            $target.show();
	            $target.find('input:eq(0)').focus();
	        }
	    });
	
	    allNextBtn.click(function () {
	        var curStep = $(this).closest(".setup-content"),
	            curStepBtn = curStep.attr("id"),
	            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	            curInputs = curStep.find("input[type='text'],input[type='url']"),
	            isValid = true;
	
	        $(".form-group").removeClass("has-error");
	        for (var i = 0; i < curInputs.length; i++) {
	            if (!curInputs[i].validity.valid) {
	                isValid = false;
	                $(curInputs[i]).closest(".form-group").addClass("has-error");
	            }
	        }
	
	        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
	    });
	
	    $('div.setup-panel div a.btn-success').trigger('click');
	});

	jQuery(document).ready(function(){
	    var select = $("select#mm");
	    select.change(function(){
	        var select_name = $(this).children("option:selected").text();
	        $(this).siblings("label").text(select_name);
	    });
	});


</script>
</head>
<body>


<div class="container spadiv spawh">
	<h5>공간 등록</h5>
	<br><br>
    <div class="stepwizard">
    
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                <p><small>사업자번호 & 파일</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-2" type="button" class="btn btn-default btn-circle">2</a>
                <p><small>공간유형 & 소개</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-3" type="button" class="btn btn-default btn-circle">3</a>
                <p><small>태그 & 공간정보</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-4" type="button" class="btn btn-default btn-circle">4</a>
                <p><small>영업정보</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-5" type="button" class="btn btn-default btn-circle">5</a>
                <p><small>사업주정보 & 이미지</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-6" type="button" class="btn btn-default btn-circle"">6</a>
                <p><small>위치 & 사이트주소</small></p>
            </div>
        </div>
    </div>
    
    <form role="form">
        <div class="panel panel-primary setup-content" id="step-1"><br><br>
            <div class="panel-heading">
                 <h4 class="panel-title">"사업자번호"</h4>
            </div>
            
            <div class="panel-body">
                <div class="form-group"><span style="color: red; font-size: 11pt;"> 사업자등록번호는 필수사항입니다.<br> * 제대로된 정보를 입력하지 않을시 불이익을 받을 수 있습니다.<br><br></span>
						입력한 사업자 번호와 동일한 파일을 업로드 해야합니다. 후 관리자의 검수기간을 거쳐 승인된 공간만 활동할 수 있습니다.<br> 지금 사업자등록번호를 입력해 공간을 등록 하세요!<br>
                     <label class="control-label" style="margin-left: 50px;"></label><br><br><br>
                     <label class="control-label" for="aa">사업자등록번호 입력</label>
                     <label class="control-label aa2" for="aa2" >첨부파일 업로드</label><br>
                     <div class="spain">
                	 	<input maxlength="40" type="text" required="required" name="housing" id="aa" 
                		  class="form-control aa" placeholder="사업자등록번호 입력" />
                		 <button class="btn btn-primary nextBtn pull-right aa2" type="button" >등록</button>
                		 <input type="text" required="required" name="housing" id="aa2" class="aa2 aa form-control"/>
                	 </div>
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>
        <br><br>
        <div class="panel panel-primary setup-content" id="step-2">
            <div class="panel-heading">
                 <h4 class="panel-title">"공간 유형"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    	카페의 유형을 선택해주세요!<br>
                 	<input maxlength="100" type="radio" name="housing" id="spa1"/><label class="control-label" for="spa1">카페</label>
                 	<input maxlength="100" type="radio" name="housing" id="spa2"/><label class="control-label" for="spa2">스터디 카페</label>
                 	
                 </div>
            </div>
            <br><br>
            <div class="panel-heading">
                 <h4 class="panel-title">"공간 소개"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">한줄 소개</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="예) 노트북 대여 가능한 스터디 카페입니다." />
                </div>
                <div class="form-group">
                    <label class="control-label">상세 소개</label>
                    <input maxlength="1000" type="text" required="required" class="form-control" placeholder="예) 위치는 홍대입구 2번 출구 앞이며 노트북 대여가 가능하고, 최대 이용 시간은 3시간입니다." />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>
        
        <div class="panel panel-primary setup-content" id="step-3">
            <div class="panel-heading">
                 <h4 class="panel-title">"태그/키워드"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">키워드</label>
                    <div class="form-inline">
                    <input maxlength="500" type="text" required="required" class="form-control key" placeholder="예) 가성비  노트북 ..." />
                    <button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
                    </div>
                </div>
                <br><br>
                <div class="panel-heading">
                 	<h4 class="panel-title">"공간 정보"</h4>
            	</div>
                <div class="form-group">
                    <label class="control-label" for="1">공간 시설 안내</label>
                    <input maxlength="200" type="text" required="required" id="1" class="form-control" placeholder="예) 화장실은 복도 왼편에 있습니다." />
                </div>
                <div class="form-group">
                    <label class="control-label" for="2">예약시 주의사항</label>
                    <input maxlength="1000" type="text" required="required" id="2" class="form-control" placeholder="예) 최대 이용시간은 3시간입니다. 준수해주십시오. 5명이상의 단체 예약은 받기 어렵습니다..." />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>
        
        
        <div class="panel panel-primary setup-content" id="step-4">
            <div class="panel-heading">
                 <h4 class="panel-title">"영업 정보"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">영업 요일</label>
                    <div class="form-inline">
                    	<input maxlength="500" type="text" required="required" class="form-control key" placeholder="예) 일요일 월요일 ..." />
                    	<button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">영업 시간</label>
                    <div class="form-inline">
                    <div class="selects">
                	<label for="mm">시간</label>
	    				<select id="mm" title="select mm">
				    	    <option selected="selected">오전</option>
				        	<option>오후</option>
	    				</select>
					</div>
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) 1시" /> ~
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) 10시" style="margin-right: 10pt;" /> 최대이용시간
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) 3" />시간
                    </div>
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>
        
        <div class="panel panel-primary setup-content" id="step-5">
            <div class="panel-heading">
                 <h4 class="panel-title">"사업주정보 & 이미지"</h4>
            </div>
            <br><br>
            <div class="panel-body">
                		대표이미지 
                		<button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
                		<br><br>상세이미지
                		<button class="btn btn-primary nextBtn pull-right" type="button" style="margin-left: 10px;" >등록</button>
            </div>
            <br><br>
            <div class="panel-body">
                <div class="form-inline">
                		업체 전화번호 : 
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) 010-0000-0000" style="margin-right: 10px; margin-left: 10px;"/> 
                    	대표자명: 
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) 홍길동" style="margin-right: 10px; margin-left: 10px;"/>
                    	상호명: 
                    	<input maxlength="50" type="text" required="required" class="form-control key" placeholder="예) (주)길동" style="margin-left: 10px;"/>
                    </div>
                <div class="form-group">
                    <label class="control-label">Company Address</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>
        
        <div class="panel panel-primary setup-content" id="step-6">
            <div class="panel-heading">
                 <h4 class="panel-title" style="margin-bottom: 10px;">"위치"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                <label class="control-label">위치 입력</label>
                <div class="form-inline">
                    <div class="selects">
	                	<label for="mm">지역</label>
		    				<select id="mm" title="select mm">
					    	    <option selected="selected">서울</option>
					        	<option>경기도</option>
		    				</select>
		    			</div>
		    			<div class="selects" style="margin-left: 10px;">
	                	<label for="mm">상세지역</label>
		    				<select id="mm" title="select mm">
					    	    <option selected="selected">마포구</option>
					        	<option>...</option>
		    				</select>
						</div>
					</div>
					<br>
					상세주소
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="예) 홍대입구 2번출구" />
                </div>
                <br>
                <div class="panel-heading">
                 	<h4 class="panel-title" style="margin-bottom: 10px;">"사이트주소"</h4>
            	</div>
                <div class="form-group">
                    <label class="control-label">웹 사이트 주소</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="예) http://www.~~~.com" />
                </div>
                <button class="btn btn-success pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </form>
</div>

<script src="js/spa.scripts.js"></script>

</body>
</html>