<%@ page contentType="text/html; charset=UTF-8"%>
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
			<td colspan="6">이전글 : 산출물의 아홉 번째 게시글 제목입니다.</td>
		</tr>
		<tr>
			<td colspan="6">다음글 : 없음</td>
		</tr>
</table>
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
				<div class="leftBtn">
					<button type="button" class="btn">
						수정
					</button>
					<button type="button" class="btn">
						삭제
					</button>
				</div>
				
				<div class="rightBtn">
					<button type="button" class="btn btn-primary">
						목록
					</button>
				</div>
			</div>
			
		</div>
		<div class="col-md-2">
		</div>
	</div><!-- 버튼 영역 끝-->