<%@page import="java.util.ArrayList"%>
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
<title>Insert title here</title>
<style type="text/css">

	#btnTbl
	{
		text-align : center;
	}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".adminBtn").on("click", function()
		{
			// 확인
			alert("확인 되었습니다.");
			
			var spa_req_cd = $(this).val();
			
			//alert(spa_req_cd);
			
			$.post("ajaxcpcheck.action",
	        {
				spa_req_cd : $(this).val()
	        }
			, function(data)
	        {
	           alert(data);
	        });
			
			//새로고침
			setTimeout('location.reload()',0);
			
		});
		
		$(".okBtn").on("click", function()
		{
			var result = confirm("정말 승인하시겠습니까?");
			
			if(result)
			{
				alert("승인 되었습니다.");
				
				$.post("ajaxcpconfirm.action",
		        {
					admin_cd : '${sessionScope.id}'
					,spa_req_cd : $(this).val()
					,check_type_cd : 'CHET1001'
		        }
				, function(data)
		        {
		           alert(data);
		        });
			}
			else if(result==null)
			{
				return;
			}
			
			//새로고침
			setTimeout('location.reload()',0);
					
		});
		
		$(".noBtn").on("click", function()
		{
			var result = confirm("정말 거부하시겠습니까?");
			
			if(result)
			{
				alert("거부 되었습니다.");
				
				$.post("ajaxcpconfirm.action",
		        {
					admin_cd : '${sessionScope.id}'
					,spa_req_cd : $(this).val()
					,check_type_cd : 'CHET1002'
		        }
				, function(data)
		        {
		           alert(data);
		        });
			}
			else if(result==null)
			{
				return;
			}
			
			
			//새로고침
			setTimeout('location.reload()',0);
			
		});
		
		// 검색 버튼 클릭 시
		$("#searchBtn").click(function()
		{
			f = document.searchForm;
			f.action = "<%=cp %>/admin_com_appeal_list.action";
			f.submit();
			
		});
		
		
	});
	
	
</script>
</head>
<body>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">업체 요청 관리</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <!-- 검색 영역 -->
					<div class="col-md-12">
					<div class="form-inline search">
					
					<form name="searchForm" method="post">
						<select name="searchKey" class="form-control selectField" style="width: 20%;">
							<option value="SPA_NAME">업체명</option>
							<option value="SPA_ID">업체아이디</option>
							<option value="SPA_ID">회원명</option>
							<option value="TYPE">요청확인</option>
							<option value="ADM_NAME">처리관리자</option>
						</select>
						
						<input type="text" name="searchValue" placeholder="업체명 또는 처리관리자명으로 검색하세요!" class="form-control boxTF" style="width: 70%;">
						<input type="button" value="검색" class="btn btn-primary searchBtn" id="searchBtn" style="width: 9%">
					</form>
						<!-- <input type="text" class="form-control tag" id="tag" placeholder="기술 태그">
						<input type="text" class="form-control title" id="title" placeholder="스터디방 제목">
						<button type="button" id="searchBtn" class="btn btn-primary searchBtn">검색</button> -->
					</div>
					</div>
					<br>
                  <thead>
                    <tr>
                      <th>요청코드</th>
                      <th>업체명</th>
                      <th>업체아이디</th>
                      <th>회원명</th>
                      <th>요청일자</th>
                      <th>요청확인</th>
                      <th>처리상태</th>
                      <th>처리관리자</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  <c:forEach var="ComApList" items="${ComApList }">
					<tr>
						<td>${ComApList.spa_req_cd }</td>
						<td>${ComApList.spa_name }</td>
						<td>${ComApList.spa_id }</td>
						<td>${ComApList.com_name }</td>
						<td>${ComApList.req_date }</td>
						
						<td>
						<c:if test="${ComApList.type == null}">
						<button type="button" class="adminBtn" 
						value=${ComApList.spa_req_cd }>확인</button>
						</c:if>
						<c:if test="${ComApList.type == 'CHECK'}">
						<button type="button" id="okBtn" class="okBtn" 
						value=${ComApList.spa_req_cd }>승인</button>
						<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#staticBackdrop">거부</button> 
						value=${ComApList.spa_req_cd }>거부</button>
						</c:if>
						<c:if test="${ComApList.type == 'YES'}">
							승인완료
						</c:if>
						<c:if test="${ComApList.type == 'NO'}">
							거부완료
						</c:if>
						</td>
					
						<td>
						<c:if test="${ComApList.prcs_date == null}">
						미확인
						</c:if>
						<c:if test="${ComApList.prcs_date != null}">
						${ComApList.prcs_date }
						</c:if>
						</td>
					
						<td>
						<c:if test="${ComApList.adm_name == null}">
						미확인
						</c:if>
						<c:if test="${ComApList.adm_name != null}">
						[관리자]${ComApList.adm_name }
						</c:if>
						</td>
						
					 </tr>	
					</c:forEach>
					
                  </tbody>
                </table>
              </div>
              <!-- 페이징 영역 -->
				<div class="row paging" style="float: right;">
				<div class="col-md-12">
					<!-- 페이징 처리에 따른 페이지 인덱스 적용 -->
					<c:if test="${dataCount != 0 }">
						<div align="center">
							${pageIndexList }
						</div>
					</c:if>
					<!-- IMAGEBOARD 테이블에 데이터가 존재하지 않을 경우 -->
					<c:if test="${dataCount == 0 }">
						등록된 자료가 존재하지 않습니다.
					</c:if>
				</div>
				</div><!-- 페이징 영역 끝 -->
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      
</body>
</html>