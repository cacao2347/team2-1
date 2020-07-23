<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String imagePath = cp + "/pds/saveData";
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
var array = new Array();


	/* 페이지 전환 */
	$(document).ready(function()
	{
		$('.show1').show(); //페이지를 로드할 때 표시할 요소
		$('.show2').hide(); //페이지를 로드할 때 숨길 요소
		$('.show3').hide(); //페이지를 로드할 때 숨길 요소
		$('.show4').hide(); //페이지를 로드할 때 숨길 요소
		$('.show5').hide(); //페이지를 로드할 때 숨길 요소
		
		$('#next1').click(function()
		{
			$ ('.show1').hide();
			$ ('.show2').show();
			$ ('.show3').hide();
			$ ('.show4').hide();
			$ ('.show5').hide(); 
			$('#check1').addClass('btn-default');
			$('#check1').removeClass('btn-success');
			$('#check2').addClass('btn-success');
			
			return false;
		});
		$('#next2').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show3').show(); 
			$ ('.show2').hide(); 
			$ ('.show4').hide(); 
			$ ('.show5').hide(); 
			$('#check2').addClass('btn-default');
			$('#check2').removeClass('btn-success');
			$('#check3').addClass('btn-success');
			return false;
		});
		$('#next3').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show4').show(); 
			$ ('.show2').hide(); 
			$ ('.show3').hide(); 
			$ ('.show5').hide(); 
			$('#check3').addClass('btn-default');
			$('#check3').removeClass('btn-success');
			$('#check4').addClass('btn-success');
			return false;
		});
		$('#next4').click(function()
		{
			$ ('.show1').hide(); 
			$ ('.show5').show(); 
			$ ('.show2').hide(); 
			$ ('.show3').hide(); 
			$ ('.show4').hide(); 
			$('#check4').addClass('btn-default');
			$('#check4').removeClass('btn-success');
			$('#check5').addClass('btn-success');
			return false;
		});
	});
		

$(function(){
	 // AJAX 요청 및 응답 처리
	 ajaxSpcAreaRequest();
	 
    //모달을 전역변수로 선언
    var modalContents = $(".modal-contents");
    var modal = $("#defaultModal");
    
    $('.onlyAlphabetAndNumber').keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
        }
    });
    
    $(".onlyHangul").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
        }
    });

    $(".onlyNumber").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });
    
    //------- 검사하여 상태를 class에 적용
    $('#id').keyup(function(event){
        
        var divId = $('#divId');
        
        if($('#id').val()==""){
            divId.removeClass("has-success");
            divId.addClass("has-error");
        }else{
            divId.removeClass("has-error");
            divId.addClass("has-success");
        }
    });
    
    $('#password').keyup(function(event){
        
        var divPassword = $('#divPassword');
        
        if($('#password').val()==""){
            divPassword.removeClass("has-success");
            divPassword.addClass("has-error");
        }else{
            divPassword.removeClass("has-error");
            divPassword.addClass("has-success");
        }
    });
    
    $('#passwordCheck').keyup(function(event){
        
        var passwordCheck = $('#passwordCheck').val();
        var password = $('#password').val();
        var divPasswordCheck = $('#divPasswordCheck');
        
        if((passwordCheck=="") || (password!=passwordCheck)){
            divPasswordCheck.removeClass("has-success");
            divPasswordCheck.addClass("has-error");
        }else{
            divPasswordCheck.removeClass("has-error");
            divPasswordCheck.addClass("has-success");
        }
    });
    
    $('#name').keyup(function(event){
        
        var divName = $('#divName');
        
        if($.trim($('#name').val())==""){
            divName.removeClass("has-success");
            divName.addClass("has-error");
        }else{
            divName.removeClass("has-error");
            divName.addClass("has-success");
        }
    });
    
    $('#email').keyup(function(event){
        
        var divEmail = $('#divEmail');
        
        if($.trim($('#email').val())==""){
            divEmail.removeClass("has-success");
            divEmail.addClass("has-error");
        }else{
            divEmail.removeClass("has-error");
            divEmail.addClass("has-success");
        }
    });
    
    // 사업자 번호
    $('#aa').keyup(function(event){
        
        var divPhoneNumber = $('#aadiv');
        
        if($.trim($('#aa').val())==""){
            divPhoneNumber.removeClass("has-success");
            divPhoneNumber.addClass("has-error");
        }else{
            divPhoneNumber.removeClass("has-error");
            divPhoneNumber.addClass("has-success");
        }
    });
    
    
    $("#spanumfile").click(function()
            {
               var myFormData = new FormData();
               var fileok = document.getElementById("aa2");
               var fileCheck = null;
               fileCheck = $("#aa2").val();

               alert(fileCheck);
               
                alert(fileok.files[0].name);
               
               myFormData.append("fileok", fileok.files[0]);
               
               if(fileCheck == false)
               {
                    alert("파일을 첨부해 주세요");
                    return;
               }
               else
               {
                  $.ajax(
                  {
                       url: '<%=cp%>/ajaximg.action',
                       type: 'POST',
                       processData: false, // important
                       contentType: false,//'multipart/form-data', // important
                       dataType : 'text',
                       data: myFormData,
                       
                       success : function(data)
                       {
                           alert($.trim(data));
                           
                           $('#okFile').val($.trim(data));
                           
                   
                          var good = $("#okFile").val();
                          
                          alert(good);
                          alert('<%=cp%>');
                          
                          $("#goodImg").attr("src", '<%=imagePath%>'+'/' + fileok.files[0].name);
                       }
                  });
               }
            
            })
    
	    // 사업자번호 중복 확인
	    $('#dupBtn').click(function()
			 {
	   	 
				 if(!$('#aa').val())
				 {
					 alert("사업자 번호를 입력하세요.");
					 $('#aa').focus();
				 }
				 else
				 {
					$.ajax({ type: 'POST', url: 'checkspanum.action', data: { "aa" : $('#aa').val() }
	     		, success: function(data)
	         		{  
			           	if($.trim(data) == 0 && $('#aa').val() != null)
			           	{ 
			           		alert("등록가능한 번호입니다.");
			           		$("#phoneAuth").removeAttr("disabled");
			           	}
			           	else 
			           	{ 
			           		alert("등록 불가능한 번호입니다.");
			           	}
			           	
	       				} 
					}); //end ajax
				 }
	     	 //alert('뭐');
	     	
			});
    
	
	   // 지역명이 바뀌면 상세지역 ajax 호출
		$("#area").change(function()
		{
			ajaxSpcAreaRequest();
			
		});

		
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
		    			  + "<input type='hidden' name='etcTagList' value='"+ selectedText + "'></span></div>");
		      }
		      // 관심키워드 일 때...
		      else
		      {
		    	  $(".stuKeyBox").append("<div class='tagStyle'><span class='keyTag'>"+ selectedText 
		    			  + "<input type='hidden' name='intTagList' value='"+ selectedValue + "'></span></div>");			    	  
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
		
	
		// 공간등록 버튼 클릭시
		$("#finish").click(
			function()
			{
				if ($("#id").val() == "" || $("#password").val() == ""
						|| $("#passwordCheck").val() == ""
						|| $("#name").val() == ""
						|| $("#email").val() == "" || $("#week").val() == 0
						|| $("#area").val() == 0
						|| $("#spcArea").val() == 0
						|| $("#aa").val() == ""						// 사업자번호
						|| $("#phoneNumberCheck").val() == ""
						)
				{
					$("#err").html("필수 입력 항목이 누락되었습니다.");
					$("#err").css("display", "inline");
					return;
				}
				else if($("#stuKeyBox").children().length == 0)
				{
					$("#err").html("관심 키워드는 최소 한 개 이상 선택해야 합니다.");
					$("#err").css("display", "inline");
					return;
				}
				else 
				{
					console.log("통과");	 
				}
				
				// 최종 submit
				$("#finish").submit();
		
			});


</script>
</head>
<body>

<div class="container spadiv spawh">
	<br><h5>공간 등록</h5><button type="button" class="btn" onclick="location.href='spalist.action'">등록취소</button>
	<br><br>
    <div class="stepwizard">

        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-1" id="check1" type="button" class="btn btn-success btn-circle">1</a>
                <p><small>사업자번호 & 파일</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-2" id="check2" type="button" class="btn btn-default btn-circle">2</a>
                <p><small>공간유형 & 소개</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-3" id="check3" type="button" class="btn btn-default btn-circle">3</a>
                <p><small>태그 & 공간정보</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-4" id="check4" type="button" class="btn btn-default btn-circle">4</a>
                <p><small>사업주정보 & 이미지</small></p>
            </div>
            <div class="stepwizard-step col-xs-3"> 
                <a href="#step-5" id="check5" type="button" class="btn btn-default btn-circle">5</a>
                <p><small>위치</small></p><!--  & 사이트주소 -->
            </div>
        </div>
    </div>
    
    <form role="form">
        <div class="panel panel-primary show1" id="step-1"><br><br>
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
                     <div class="aadiv form-inline">
                	 	<input maxlength="40" type="text" required="required" name="housing" id="aa" 
                		  class="onlyNumber form-control aa"  placeholder="숫자만 입력(10자리)" />
                		  <button type="button" id="dupBtn" class="btn btn-primary">인증</button>
                		  </div>
                		 <button class="btn btn-primary pull-right aa2" type="button" id="spanumfile">등록</button>
                		 <input type="file" required="required" name="housing" id="aa2" class="aa2 aa form-control"/>
                	 </div>
                	 <div class="errMsg">
                    	<span id="err"></span>
                    </div>
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button" id="next1">Next</button>
                <br><br>
            </div>
        </div>
        <br><br>
        <div class="panel panel-primary show2" id="step-2">
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
                <button class="btn btn-primary nextBtn pull-right" type="button" id="next2">Next</button>
                <br><br>
            </div>
        </div>
        
        <!-- 키워드 입력 -->
        <div class="panel panel-primary show3" id="step-3">
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
                <div class="panel-heading ">
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
                <button class="btn btn-primary nextBtn pull-right" type="button" id="next3">Next</button>
                <br><br>
            </div>

        
        <div class="panel panel-primary show4" id="step-4">
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
                <button class="btn btn-primary nextBtn pull-right" type="button" id="next4">Next</button>
                <br><br>
            </div>
        </div>
        
        <div class="panel panel-primary show5" id="step-5">
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
                <button class="btn btn-success pull-right" type="submit" id="finish">Finish!</button>
                <br><br>
            </div>
        </div>
    </form>
</div>
<script src="<%=cp %>/assets/js/spa.scripts.js"></script>

</body>
</html>