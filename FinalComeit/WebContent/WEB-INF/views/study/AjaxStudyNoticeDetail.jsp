<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- 상세내용 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table class="table detail">
				<tr>
					<th>제목</th>
					<td colspan="6">${noticeDetail.title }</td>
				</tr>
				<tr class="tit">
					<th>작성자</th>
					<td>${noticeDetail.stu_join_name }</td>
					<th>작성일</th>
					<td>${noticeDetail.crt_date }</td>
					<th>조회수</th>
					<td>${noticeDetail.hits }</td>
				</tr>
				<tr class="content">
					<td colspan="6">${noticeDetail.content }</td>
				</tr>
				<tr>
					<td colspan="6">이전글 : 공지사항의 아홉 번째 게시글 제목입니다.</td>
				</tr>
				<tr>
					<td colspan="6">다음글 : 없음</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 상세내용 영역 끝 -->
	
	<!-- 버튼 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="repBtn">
				<button type="button" class="btn btn-link">
				신고
				</button>
			</div>
			
			<div class="btns">
				<c:if test="${sessionScope.mem_cd == noticeDetail.mem_cd }">
				<div class="leftBtn">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
				</c:if>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary goListBtn">
						목록
					</button>
				</div>
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 버튼 영역 끝-->
	
	<!-- 댓글 목록 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8 reList">
			<div class="count">
			댓글 2
			</div>
			<table class="table">
				<tr>
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
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>
	
	<!-- 댓글 등록 영역 -->
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
		
			<table class="table re">
				<tr class="reAdd">
					<th class="reTh">댓글내용 * </th>
					<td class="textArea">
					<textarea rows="3" class="form-control text"></textarea>
					</td>
					<td class="addBtn">
					<button type="submit" class="btn btn-primary btn-lg">등록</button>
					</td>
				</tr>
			</table>
		</div>
		<div class="col-md-2">
		</div>
	</div>