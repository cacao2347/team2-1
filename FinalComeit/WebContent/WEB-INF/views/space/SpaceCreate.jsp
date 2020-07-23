<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	        url
	        $(".form-group").removeClass("has-error");
	        for (var i = 0; i < curInputs.length; i++) {
	            if (!curInputs[i].validity.valid) {
	                isValid = false;
	                $(curInputs[i]).closest(".form-group").addClass("has-error");
	            }
	        }
	        $(".form-group").removeClass("has-error");
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
	
	
	$(function(){
		
		
		// 사업자 번호 입력 유효성 검사
		$(".onlyNumber").keyup(function(event){
	        if (!(event.keyCode >=37 && event.keyCode<=40)) {
	            var inputVal = $(this).val();
	            $(this).val(inputVal.replace(/[^0-9]/gi,''));
	        }
	    });
		
		//------- 검사하여 상태를 class에 적용
	    $('#aa').keyup(function(event){
	        
	        var divaa = $('#divaa');
	        
	        if($('#aa').val()==""){
	        	divaa.removeClass("has-success");
	        	divaa.addClass("has-error");
	        }else{
	        	divaa.removeClass("has-error");
	        	divaa.addClass("has-success");
	        }
	    });
	});
	
	$("#nextone").click(
	function()
	{
		var num = $("#aa").val();
		if(num.length != 10)
		{
			$("#err").html("사업자 번호는 10자리 숫자 입니다.");
			$("#err").css("display", "inline");
			return;
		}
	});

	//지역 & 키워드
	$(function(){
    	 
    	 // AJAX 요청 및 응답 처리
    	 ajaxSpcAreaRequest();
    	 
    	// 지역명이 바뀌면 상세지역 ajax 호출
 		$("#area").change(function()
 		{
 			ajaxSpcAreaRequest();
 			
 		})
 		
 		//키워드
 		$("#keySelect").change(function() 
 				 {
 					    var selectedValue = "";
 					 	// alert("셀렉트값 변경");
 					 	
 					 	selectedValue = $("#keySelect option:checked").val();
 					 
 						if(selectedValue == "SPTGT1009")
 						{
 							$("#keyInput").attr("readonly", false);
 						}
 						else
 						{
 							$("#keyInput").attr("readonly", true);
 						}
 				 });
 				 
 				 // 관심 키워드 삭제 버튼
 				 $("#keyResetBtn").click(function() 
 			    {
 					   $(".stuKeyBox").empty();
 					   array = [];
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
 			$("#spcAreaDiv").html(data);
 			$("#spcArea").removeAttr("disabled");
 		});
 	}
	
 // 관심 키워드 추가 버튼
	 $("#keyAddBtn").click(function() 
    {
	      var tmpHtml = "";
	      var selectedKey = "";
	      var keyInput = "";

	      tmpHtml = tmpHtml + "";
	      
	      selectedText = $("#keySelect option:checked").text();
	      selectedValue = $("#keySelect option:checked").val();
	      keyInput = $("#keyInput").val();
	      elementCount = $(".tagStyle").length;
	      
	      if(selectedValue =='SPTGT1009')
	      {
	    	  selectedText = keyInput;
	      }
	      
	      for (var i = 0; i < array.length; i++) 
	      {
				if(selectedText == array[i])
				{
					alert(selectedText)
					alert("중복된 키워드는 입력 할 수 없습니다.");
					return;
				}
		  }
	      
	   	  // 키워드 개수 제한
	      if(elementCount == 5)
	      {
	    	  alert("키워드는 최대 5개 까지 선택 할 수 있습니다.")
	    	  return;
	      }
	      
	      array.push(selectedText);
	      
	      if(selectedValue == 'SPTGT1009')
	      {
	    	  
	    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
	    			  + "<input type='hidden' name='intTagList' value='"+ selectedText + "'></span></div>");
	      }
	      // 관심키워드 일 때...
	      else
	      {
	    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
	    			  + "<input type='hidden' name='etcTagList' value='"+ selectedText + "'></span></div>");			    	  
	      }
	      
	 });
	
	 $("#keySelect").change(function() 
	 {
		    var selectedValue = "";
		 	// alert("셀렉트값 변경");
		 	
		 	selectedValue = $("#keySelect option:checked").val();
		 
			if(selectedValue == "SPTGT1009")
			{
				$("#keyInput").attr("readonly", false);
			}
			else
			{
				$("#keyInput").attr("readonly", true);
			}
	 });
	 
	 // 관심 키워드 삭제 버튼
	 $("#keyResetBtn").click(function() 
    {
		   $(".stuKeyBox").empty();
		   array = [];
	 });
	 


</script>
</head>
<body>

<div class="container spadiv spawh">
	<br><h5>공간 등록</h5>
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
                <p><small>사업주정보 & 이미지</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-5" type="button" class="btn btn-default btn-circle">5</a>
                <p><small>위치</small></p><!--  & 사이트주소 -->
            </div>
        </div>
    </div>
    
    <form role="form">
        <div class="panel panel-primary setup-content" id="step-1"><br><br>
            <div class="panel-heading">
                 <h4 class="panel-title">"사업자번호"</h4>
            </div>
            
            <div class="panel-body">
                <div class="form-group" id="divaa"><span style="color: red; font-size: 11pt;"> 사업자등록번호는 필수사항입니다.<br> * 제대로된 정보를 입력하지 않을시 불이익을 받을 수 있습니다.<br><br></span>
						입력한 사업자 번호와 동일한 파일을 업로드 해야합니다. 후 관리자의 검수기간을 거쳐 승인된 공간만 활동할 수 있습니다.<br> 지금 사업자등록번호를 입력해 공간을 등록 하세요!<br>
                     <label class="control-label" style="margin-left: 50px;"></label><br><br><br>
                     <label class="control-label" for="aa">사업자등록번호 입력</label>
                     <label class="control-label aa2" for="aa2" >첨부파일 업로드</label><br>
                     
                     <div class="spain">
                	 	<input maxlength="40" type="text" required="required" name="housing" id="aa" 
                		  class="onlyNumber form-control aa"  placeholder="숫자만 입력(10자리)" />
                		 <button class="btn btn-primary pull-right aa2" type="button" >등록</button>
                		 <input type="file" required="required" name="housing" id="aa2" class="aa2 aa form-control"/>
                	 </div>
                	 <div class="errMsg">
                    	<span id="err"></span>
                    </div>
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button" id="nextone">Next</button>
                <br><br>
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
                 	<input maxlength="100" type="radio" name="housing" id="spa1" checked/><label class="control-label" for="spa1">카페</label>
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
                <br><br>
            </div>
        </div>
        
        <!-- 키워드 입력 -->
        <div class="panel panel-primary setup-content" id="step-3">
            <div class="panel-heading">
                 <h4 class="panel-title">"태그/키워드"</h4>
            </div>
			    <div class="form-group">
				<div class="stuKeyword">
					<label for="inputIntKeyword" class="col-lg-2 control-label">
						키워드(최대 5개)<span class="must">*</span>
					</label>

				</div>
				<div class="stuKey1">
					<div class="stuKeySel">
						<div class="col-lg-10 form-inline">
							<select name="keySelect" id="keySelect"
								class="form-control keySelect">
								<c:forEach var="Tag" items="${spaTag }">
									<option value="${Tag.spa_tag_tpye_cd }">
										${Tag.tag_name }</option>
								</c:forEach>
							</select> &nbsp; 
							<input type="text" class="keyInput form-control" id="keyInput" placeholder="키워드를 입력해 주세요." style="width: 30%" readonly="readonly"/>
							&nbsp; <input type="button" id="keyAddBtn" value="추가"
								class="keyBtn btn btn-primary" />
							&nbsp;	
								<input type="button" id="keyResetBtn" value="초기화"
								class="keyBtn btn btn-primary" />
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label"></label>
				<div class="col-lg-10 form-inline">
					<div id="stuKeyBox" class="stuKeyBox" style="width: 85%;">
					</div>
					<!-- end .stuKeyBox -->
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
                <br><br>
            </div>

        
        <div class="panel panel-primary setup-content" id="step-4">
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
                <br><br>
            </div>
        </div>
        
        <div class="panel panel-primary setup-content" id="step-5">
            <div class="panel-heading">
                 <h4 class="panel-title" style="margin-bottom: 10px;">"위치"</h4>
            </div>
            <div class="panel-body">
                <div class="form-group">
                <label class="control-label">위치 입력*</label>
                <div class="form-group" id="areaMemNum">
					<div class="col-lg-10" style="float: left; width: 225px;" >
					
						<select name="area" required="required" id="area" class="area form-control">
						<option value="0">지역 선택</option>
							<c:forEach var="areas" items="${area }">
		                        <option value="${areas.area_cd }" 
		                        ${areas.area_cd == spcArea.area_cd ? "selected= \"selected\"" : ""}>
		                           ${areas.area_name }
		                        </option>
		                     </c:forEach>
						</select>
						
					</div>
					
					
					<!-- div 안에있는 select 문은 AjaxJoinSpcArea.jsp에서 가져온다 -->
					<div id="spcAreaDiv" class="col-lg-10" style="float: left; width: 225px;" >
					
					</div>
				</div><!-- end .areaMemNum -->
					<br>
					상세주소
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="예) 홍대입구 2번출구" />
                </div>
                
                
                <br>
                <div class="panel-heading">
                 	<!-- <h4 class="panel-title" style="margin-bottom: 10px;">"사이트주소"</h4> -->
            	</div>
                <div class="form-group">
                    <!-- <label class="control-label">웹 사이트 주소</label> -->
                    <!-- 지우면 next 버튼이 안돼서 히든으로 감춤... -->
                    <input maxlength="200" id="url" type="hidden" required="required" class="form-control" placeholder="예) http://www.~~~.com" />
                </div>
                <button class="btn btn-success pull-right" type="submit">Finish!</button>
                <br><br>
            </div>
        </div>
    </form>
</div>
<script src="<%=cp %>/assets/js/spa.scripts.js"></script>

</body>
</html>