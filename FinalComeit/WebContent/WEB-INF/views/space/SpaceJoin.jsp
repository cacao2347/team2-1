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
<link rel="stylesheet" type="text/css"
	href="<%=cp%>/assets/css/join.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<!-- 파비콘 -->
<link rel="shortcut icon" href="<%=cp%>/assets/images/pen_1.ico"
	type="image/x-icon">
<link rel="icon" href="<%=cp%>/assets/images/pen_1.ico"
	type="image/x-icon">

<!-- 글꼴 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<script>
	$(function()
	{
		//모달을 전역변수로 선언
		var modalContents = $(".modal-contents");
		var modal = $("#defaultModal");

		$('.onlyAlphabetAndNumber').keyup(function(event)
		{
			if (!(event.keyCode >= 37 && event.keyCode <= 40))
			{
				var inputVal = $(this).val();
				$(this).val($(this).val().replace(/[^_a-z0-9]/gi, '')); //_(underscore), 영어, 숫자만 가능
			}
		});

		$(".onlyHangul").keyup(function(event)
		{
			if (!(event.keyCode >= 37 && event.keyCode <= 40))
			{
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi, ''));
			}
		});

		$(".onlyNumber").keyup(function(event)
		{
			if (!(event.keyCode >= 37 && event.keyCode <= 40))
			{
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi, ''));
			}
		});

		//------- 검사하여 상태를 class에 적용
		$('#id').keyup(function(event)
		{

			var divId = $('#divId');

			if ($('#id').val() == "")
			{
				divId.removeClass("has-success");
				divId.addClass("has-error");
			} else
			{
				divId.removeClass("has-error");
				divId.addClass("has-success");
			}
		});

		$('#password').keyup(function(event)
		{

			var divPassword = $('#divPassword');

			if ($('#password').val() == "")
			{
				divPassword.removeClass("has-success");
				divPassword.addClass("has-error");
			} else
			{
				divPassword.removeClass("has-error");
				divPassword.addClass("has-success");
			}
		});

		$('#passwordCheck').keyup(function(event)
		{

			var passwordCheck = $('#passwordCheck').val();
			var password = $('#password').val();
			var divPasswordCheck = $('#divPasswordCheck');

			if ((passwordCheck == "") || (password != passwordCheck))
			{
				divPasswordCheck.removeClass("has-success");
				divPasswordCheck.addClass("has-error");
			} else
			{
				divPasswordCheck.removeClass("has-error");
				divPasswordCheck.addClass("has-success");
			}
		});

		$('#name').keyup(function(event)
		{

			var divName = $('#divName');

			if ($.trim($('#name').val()) == "")
			{
				divName.removeClass("has-success");
				divName.addClass("has-error");
			} else
			{
				divName.removeClass("has-error");
				divName.addClass("has-success");
			}
		});

		$('#email').keyup(function(event)
		{

			var divEmail = $('#divEmail');

			if ($.trim($('#email').val()) == "")
			{
				divEmail.removeClass("has-success");
				divEmail.addClass("has-error");
			} else
			{
				divEmail.removeClass("has-error");
				divEmail.addClass("has-success");
			}
		});

		$('#phoneNumber').keyup(function(event)
		{

			var divPhoneNumber = $('#divPhoneNumber');

			if ($.trim($('#phoneNumber').val()) == "")
			{
				divPhoneNumber.removeClass("has-success");
				divPhoneNumber.addClass("has-error");
			} else
			{
				divPhoneNumber.removeClass("has-error");
				divPhoneNumber.addClass("has-success");
			}
		});
		
		// 중복확인 버튼을 클릭했을때의 처리
        $('#dupBtn').click(function()
 		 {
       	 
 			 if(!$('#id').val())
 			 {
 				 alert("아이디를 입력해주세요");
 				 $('#id').focus();
 				 
 			 }
 			 else
 			 {
 				$.ajax({ type: 'POST', url: 'checkspaidajax.action', data: { "id" : $('#id').val() }
         		, success: function(data)
         		
	          		{ //alert(data); 
			           	if($.trim(data) == 0 && $('#id').val() != null)
			           	{ 
			           		//$('#checkMsg').html('<p style="color:blue">사용가능</p>');
			           		alert("사용가능합니다.");
			           	}
			           	else 
			           	{ 
			           		//$('#checkMsg').html('<p style="color:red">사용불가능</p>');
			           		alert("사용불가능합니다.");
			           	}
			           	
	        		} 
  				}); //end ajax
 			 }
         	 //alert('뭐');
         	
 		});

		// 동의합니다 누르면 비활성화 해제
		$("#provisionY").click(function()
		{
			$("#id").removeAttr("disabled");
			$("#password").removeAttr("disabled");
			$("#passwordCheck").removeAttr("disabled");
			$("#name").removeAttr("disabled");
			$("#email").removeAttr("disabled");
			$("#phoneNumber").removeAttr("disabled");
			$("#phoneNumberCheck").removeAttr("disabled");

			$("#dupBtn").removeAttr("disabled");
			$("#phoneAuth").removeAttr("disabled");
			$("#authCheck").removeAttr("disabled");
			$("#joinBtn").removeAttr("disabled");

			$("#authNum").removeAttr("disabled");
			$("#authNumRslt").removeAttr("disabled");
			$("#authNumBtn").removeAttr("disabled");

			$("#err").css("display", "none");

		});

		// 동의하지 않습니다 누르면 비활성화 하고 값 리셋
		$("#provisionN").click(function()
		{
			$("#id").attr("disabled", true);
			$("#password").attr("disabled", true);
			$("#passwordCheck").attr("disabled", true);
			$("#name").attr("disabled", true);
			$("#email").attr("disabled", true);
			$("#phoneNumber").attr("disabled", true);
			$("#phoneNumberCheck").attr("disabled", true);

			$("#dupBtn").attr("disabled", true);
			$("#phoneAuth").attr("disabled", true);
			$("#authCheck").attr("disabled", true);

			$("#joinBtn").attr("disabled", true);
			$("#authNum").attr("disabled", true);
			$("#authNumRslt").attr("disabled", true);
			$("#authNumBtn").attr("disabled", true);

			$("#joinForm")[0].reset();
			$("input:radio[name='provisionyn']:radio[value='N']").prop(
					"checked", true);
			$("#err").css("display", "none");
		});

		$("#joinBtn").click(function()
		{
			if ($("#id").val() == "" || $("#password").val() == ""
					|| $("#passwordCheck").val() == ""
					|| $("#name").val() == ""
					|| $("#email").val() == "" || $("#week").val() == 0
					|| $("#phoneNumber").val() == ""
					|| $("#phoneNumberCheck").val() == "")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;
			}
			
			if ($("#id").val().length < 7 || $("#id").val().length > 10)
			{
				$("#err").html("아이디는 7자리 ~ 10자리 이내로 입력해주세요.");
				$("#err").css("display", "inline");
				return;
			}
			
			// 비밀번호 유효성 체크
			//영문,숫자,특수문자 중 2가지 혼합 (영문,숫자 = 통과) (특문,숫자 = 통과) 비밀번호 10~20자리
			var pw = $("#password").val();
			var num = pw.search(/[0-9]/g);
			var eng = pw.search(/[a-z]/ig);
			var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

			if(pw.length < 10 || pw.length > 20)
			{
				//alert("10자리 ~ 20자리 이내로 입력해주세요.");
				$("#err").html("패스워드는 10자리 ~ 20자리 이내로 입력해주세요.");
				$("#err").css("display", "inline");
				return;
			}
			else if(pw.search(/\s/) != -1)
			{
				//alert("비밀번호는 공백 없이 입력해주세요.");
				$("#err").html("패스워드는 공백 없이 입력해주세요.");
				$("#err").css("display", "inline");
				return;
			}
			else if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) )
			{
				//alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
				$("#err").html("패스워드는 영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
				$("#err").css("display", "inline");
				return;
			}
			else 
			{
				console.log("통과");	 
			}
			
			// 최종 submit
			$("#joinForm").submit();
			
		});
		
		$("#authNumBtn").click(function() 
		{			 
			if($("#authNum").val() == "" || $("#authNum").val() == null)
			 {
				  alert("인증번호를 입력하세요.");
				  return;
			 }

			 if($("#authNum").val() == phoneCheck)
		     {
				 alert("인증에 성공하였습니다.");
				 $("#authNumRslt").attr("value", "인증 성공");
		     }
			 else if($("#authNum").val() != phoneCheck)
			 {
				 alert("인증에 실패하였습니다.");
				 $("#authNumRslt").attr("value", "인증 실패"); 
			 }
			 else
			 {
				 alert("인증에 실패하였습니다.");
				 $("#authNumRslt").attr("value", "인증 실패");
			 }
		});
	});
	
	// 문자 발송
	function ajaxSendSms()
	 {
		var check = false;
        // 문자 인증 발송 전 중복확인
           if(!$('#phoneNumber').val())
           {
              alert("전화번호를 입력해주세요");
              $('#phoneNumber').focus();
              
           }
           else
           {
             $.ajax({ type: 'POST', url: 'checkpwdajax.action', data: { "phoneNumber" : $('#phoneNumber').val() }
               ,async:false,  success: function(data)
                   { 
                       if($.trim(data) == 0 && $('#phoneNumber').val() != null)
                       { 
                          check=true;
                          alert("사용가능합니다.");
                       }
                       else 
                       { 
                          alert("번호가 이미 존재합니다.");
                       }
                 } 
              }); //end ajax
           }
      
          if(check==true){
            phoneCheck = "";
            alert("phoneCheck_bf : " + phoneCheck);
      
            $.ajax(
            {
               url : "<%= cp%>/sendsms.action",
               data: {
                  receiver: $("#divPhoneNumber").val()
               },
               type: "post",
               success: function(result){
                  phoneCheck = result;
                  alert("result : " + result);
                  alert("phoneCheck_af : " + phoneCheck);
               }
            });   
         }	
	 }
</script>
</head>
<body>
	<%-- <c:import url="header.jsp"></c:import> --%>
	<div class="container">
		<!-- 좌우측의 공간 확보 -->
		<!-- 헤더 들어가는 부분 -->

		<div class="row">
			<p></p>
			<div class="col-md-12 topHeader">
				<div class="home">
					<a href="mainpage.action">로고</a>
				</div>
				<div class="goLogin">
					<a href="memberlogin.action">로그인</a>
				</div>
			</div>
		</div>
		<!--// 헤더 들어가는 부분 -->
		<!-- 모달창 -->
		<div class="modal fade" id="defaultModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">알림</h4>
					</div>
					<div class="modal-body">
						<p class="modal-contents"></p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<!--// 모달창 -->
		<hr />
		<!-- 본문 들어가는 부분 -->



		<form id="joinForm" class="form-horizontal" role="form" method="post"
			action="spaceinsert.action">
			<div class="form-group">
				<label for="provision" class="col-lg-2 control-label">회원가입약관</label>
				<div class="col-lg-10" id="provision">
					<textarea class="form-control authTextarea" rows="8"
						style="resize: none" readonly="readonly">
제 1 장 총 칙

 

제 1 조 (목적)
이 약관은 COME-IT(이하 "COME-IT"이라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

 

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

 

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

 

제 2 장 서비스 이용계약

 

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

 

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

 

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우

 

제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.

 

제 3 장 계약 당사자의 의무

 

제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.

 

제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

 

제 4 장 서비스 제공 및 이용

 

제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.

 

제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.

 

제5장 계약사항의 변경, 해지

 

제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.

 

제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.

 

제6장 손해배상

 

제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.

 

제 15 조 (관할법원)

 

서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.

 

[부칙]

 

(시행일) 이 약관은 2020년 08월부터 시행합니다.
                        </textarea>
					<div class="radio" style="margin-bottom: 2%;">
						<label> <input type="radio" id="provisionY"
							name="provisionyn" value="Y" checked> 동의합니다.
						</label> <label> <input type="radio" id="provisionN"
							name="provisionyn" value="N"> 동의하지 않습니다.
						</label>
					</div>
				</div>
			</div>
			<div class="form-group " id="divId">
				<label for="inputId" class="col-lg-2 control-label">아이디<span
					class="must">*</span></label>
				<div class="col-lg-10 form-inline">
					<input type="text" required="required"
						class="form-control onlyAlphabetAndNumber" id="id" name="id"
						data-rule-required="true"
						placeholder="7~10자리 알파벳, 숫자, 특수문자(_)만 입력 가능합니다." maxlength="30"
						style="width: 85%;"> &nbsp;
					<button type="button" id="dupBtn" class="btn btn-primary">중복확인</button>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<label for="inputPassword" class="col-lg-2 control-label">패스워드<span
					class="must">*</span></label>
				<div class="col-lg-10 form-inline">
					<input type="password" required="required" maxlength="20"
						class="form-control" id="password" name="password"
						style="width: 85%;" data-rule-required="true"
						placeholder="영문, 숫자, 특수문자 2가지 이상 10~20자 조합으로 입력해주세요.">
				</div>
			</div>
			<div class="form-group" id="divPasswordCheck">
				<label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드
					확인<span class="must">*</span>
				</label>
				<div class="col-lg-10 form-inline">
					<input type="password" required="required" maxlength="20"
						class="form-control" id="passwordCheck" name="password"
						data-rule-required="true" placeholder="패스워드 확인" maxlength="30"
						style="width: 85%;">
				</div>
			</div>
			<div class="form-group" id="divName">
				<label for="inputName" class="col-lg-2 control-label">이름<span
					class="must">*</span></label>
				<div class="col-lg-10 form-inline">
					<input type="text" required="required"
						class="form-control onlyHangul" id="name" name="name"
						data-rule-required="true" placeholder="한글만 입력 가능합니다."
						maxlength="15" style="width: 85%;">
				</div>
			</div>
			<div class="form-group" id="divEmail">
				<label for="inputEmail" class="col-lg-2 control-label">이메일<span
					class="must">*</span></label>
				<div class="col-lg-10">
					<input type="email" required="required"
						class="form-control form-inline" id="email" name="email"
						data-rule-required="true"
						placeholder="@가 포함된 올바른 이메일 형식으로 입력해주세요." maxlength="40"
						style="width: 85%;">
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호<span class="must">*</span></label>
				<div class="col-lg-10 form-inline">
					<input type="tel" class="form-control onlyNumber" name="phoneNumber" id="phoneNumber"
						data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요."
						maxlength="11" style="width: 85%;"> &nbsp;
					<button type="button" id="phoneAuth" class="btn btn-primary"
						onclick="ajaxSendSms()">휴대폰 인증</button>
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">인증
					번호</label>
				<div class="col-lg-10 form-inline">
					<input type="tel" class="form-control onlyAlphabetAndNumber"
						id="authNum" data-rule-required="true" maxlength="11"
						style="width: 65%;"> <input type="tel"
						class="form-control onlyAlphabetAndNumber" id="authNumRslt"
						data-rule-required="true" maxlength="11" style="width: 20%;"
						readonly="readonly"> &nbsp;
					<button type="button" class="btn btn-primary" id="authNumBtn">확인</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10 bottom">
					<div class="errMsg">
						<span id="err"></span>
					</div>
					<div>
						<button type="button" id="joinBtn"
							class="btn btn-lg btn-success joinBtn">가입하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div class="row">
		<div class="col-md-12">
			<%-- <c:import url="footer.jsp"></c:import> --%>
		</div>
	</div>

</body>
</html>