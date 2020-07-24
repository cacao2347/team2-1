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
<title>1_AdminReport.jsp</title>
<style type="text/css">
#btnTbl {
	text-align: center;
}
</style>
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">신고 목록</h1>
		<p class="mb-4">
			신고 목록을 볼 수 있는 페이지 입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">신고 목록</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>신고코드</th>
								<th>신고날짜</th>
								<th>신고사유</th>
								<th>신고아이디</th>
								<th>신고당한 아이디</th>
								<th>신고 카테고리</th>
								<th>신고 유형</th>
								<th>승인/거부</th>
								<th>처리 상태</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>신고코드</th>
								<th>신고날짜</th>
								<th>신고사유</th>
								<th>신고아이디</th>
								<th>신고당한 아이디</th>
								<th>신고 카테고리</th>
								<th>신고 유형</th>
								<th>승인/거부</th>
								<th>처리 상태</th>
								<th>관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0002</td>
								<td>2020-07-10</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>신고 승인</td>
								<td>[관리자]신재민</td>
							</tr>
							<tr>
								<td>REP0003</td>
								<td>2020-06-01</td>
								<td>욕설을 했습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>댓글</td>
								<td>욕설</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>신고 거부</td>
								<td>[관리자] 신재민</td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
							<tr>
								<td>REP0001</td>
								<td>2020-07-12</td>
								<td>영리목적의 글을 올렸습니다.</td>
								<td>abc123</td>
								<td>def456</td>
								<td>게시글</td>
								<td>영리목적</td>
								<td id="btnTbl">
									<input type="button" value="승인">
									<input type="button" value="거절">
								</td>
								<td>미확인</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->



</body>

</html>