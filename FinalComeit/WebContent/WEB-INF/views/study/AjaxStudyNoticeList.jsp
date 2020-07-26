<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="studyNoticeLists" items="${studyNoticeList }">
		<tr>
			<td>${studyNoticeLists.row_num }</td>
			<td>
			<button class="btn btn-link listTitle" value="${studyNoticeLists. stu_ntc_pnt_cd}">${studyNoticeLists.title }</button>
			</td>
			<td>${studyNoticeLists.stu_join_name }</td>
			<td>${studyNoticeLists.crt_date }</td>
			<td>${studyNoticeLists.hits }</td>
		</tr>
	</c:forEach>
		</tbody>
</table>