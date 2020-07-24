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
                  <tfoot>
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
                  </tfoot>
                  <tbody>
          
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>미확인</td>
                      <td></td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>미확인</td>
                      <td></td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>미확인</td>
                      <td></td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>미확인</td>
                      <td></td>
                    </tr>
                    
                    <tr>
                      <td><a href="admin_com_appeal_detail.action">R0001</a></td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>확인중</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>확인중</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체거절</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체거절</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
                    </tr>
                    
                    <tr>
                      <td>R0001</td>
                      <td>우리스터디카페</td>
                      <td>cacao2347</td>
                      <td>신재민</td>
                      <td>2020-02-14</td>
                      <td id="btnTbl"><button type="button" id="adminAddBtn">확인</button></td>
                      <td>업체승인</td>
                      <td>[관리자]신재민</td>
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