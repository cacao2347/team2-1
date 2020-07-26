<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table detail">
		<tr>
			<th style="text-align: center; background-color: #EEEEEE">제목</th>
			<td colspan="6">${detail.title }</td>
		</tr>
		<tr class="tit" style="text-align: center;">
			<th>작성자</th>
			<td>${detail.name }</td>
			<th>작성일</th>
			<td>${detail.crt_date }</td>
			<th>조회수</th>
			<td>${detail.hits }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="6">회의록.doc</td>
		</tr>
		<tr class="content" style="vertical-align: top; height: 400px;">
			<td colspan="6">${detail.content }</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align: left;">이전글 : 산출물의 아홉 번째 게시글 제목입니다.</td>
		</tr>
		<tr>
			<td colspan="6" style="text-align: left;">다음글 : 없음</td>
		</tr>
</table>
<!-- 버튼 영역 -->
	<div class="row">
		
		<div class="col-md-12">
		<!-- 
			<div class="repBtn">
				<button type="button" class="btn btn-link">
				신고
				</button>
			</div>
		 -->	
			<div class="btns">
			
			
			<c:if test="${detail.mem_cd eq sessionScope.mem_cd }"> 
				<div class="leftBtn" style="display: inline-block;">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
			</c:if>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary" style="float: right;">
						목록
					</button>
				</div>
			</div>
			
		</div>
		
	</div><!-- 버튼 영역 끝-->