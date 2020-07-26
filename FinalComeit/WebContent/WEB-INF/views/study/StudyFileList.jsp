<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String stu_cd = request.getParameter("stu_cd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudyFileList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/bootstrap/bootstrap.min.css" >
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/studyfilelist.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	
	$(function() 
	{
		// ajax 처리
		ajaxStudyFileList();
		
	});
	
	
	function ajaxStudyFileList() 
	{
		var params = "stu_cd=" + $("#studyCode").val();
		
		$.ajax(
		{
			type : "POST"
			, url : "studyfilelist.action"
			, data : params
			, dataType : "text"
			, async:false
			, success : function(data)
			{
				
				$(".container").html(data);
				
				$(".listTitle").click(function()
				{
					var send = params + "&oput_cd=" + $(this).val();
					
					$.ajax(
					{
						type : "POST"
						, url : "studyfiledetail.action"
						, data : send
						, dataType : "text"
						, async:false
						, success : function(args)
						{
							$(".container").html(args);
						}
					});
				});
				
				
				
			}
			, error : function(e)
			{
				alert(e.responseText + "에러");
			}
		});
		
		
	}
	
	
</script>

</head>
<body>

<input type="hidden" id="studyCode" value="<%=stu_cd%>">

<div class="container-fluid">

	<div class="row">
		
		
		<div class="col-md-12 container">
		
			<!-- 게시글이 나올 div 영역 -->
      
		</div><!-- end .col-md-12 container -->
		
	</div><!-- end .row -->

</div><!-- end .container-fluid -->

</body>
</html>