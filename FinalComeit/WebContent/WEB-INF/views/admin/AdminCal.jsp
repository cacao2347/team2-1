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
<title>1_AdminCal.jsp</title>
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
		<h1 class="h3 mb-2 text-gray-800">정산 관리</h1>
		<p class="mb-4">
			정산 목록을 볼 수 있는 페이지입니다. <a target="_blank"
				href="https://datatables.net"> official DataTables documentation</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">강사명단</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>정산코드</th>
								<th>강의코드</th>
								<th>강사아이디</th>
								<th>수익금액</th>
								<th>환불금액</th>
								<th>정산금액</th>
								<th>정산일자</th>
								<th>정산처리</th>
								<th>관리자</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>정산코드</th>
								<th>강의코드</th>
								<th>강사아이디</th>
								<th>수익금액</th>
								<th>환불금액</th>
								<th>정산금액</th>
								<th>정산일자</th>
								<th>정산처리</th>
								<th>관리자</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
								<td></td>
							</tr>
							<tr>
								<td>LCAL001</td>
								<td>LEC0001</td>
								<td>cacao2347</td>
								<td>300,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td></td>
								<td id="btnTbl"><button type="button">정산하기</button></td>
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