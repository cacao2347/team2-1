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
<title>.jsp</title>
  <!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/mainpage.css">

</head>
<body>
<c:import url="header.jsp"></c:import>
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
  <!-- Page Content -->
  <div class="container">
    <!-- Jumbotron Header -->
    <header class="jumbotron my-4">
      <h1 class="display-3">COME-IT!</h1><br><br>
      <p class="lead">스터디의 장점 부분 어쩌구 저쩌구 환영합니다.스터디의 장점 부분 어쩌구 저쩌구 환영합니다. 스터디의 장점 부분 어쩌구 저쩌구 환영합니다.</p>
    </header>


    <!-- Page Features -->
    <h4 style="margin-top: 30px;">#최신 스터디</h4>
    <div class="row text-center">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">스터디명</h4>
            <p class="card-text">스터디 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">스터디명</h4>
            <p class="card-text">스터디 데이터부분</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">스터디명</h4>
            <p class="card-text">스터디 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">스터디명</h4>
            <p class="card-text">스터디 데이터부분</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
     <!-- Page Features -->
    <h4 style="margin-top: 30px;">#최신 프로젝트</h4>
    <div class="row text-center">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">프로젝트명</h4>
            <p class="card-text">프로젝트 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">프로젝트명</h4>
            <p class="card-text">프로젝트 데이터부분</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">프로젝트명</h4>
            <p class="card-text">프로젝트 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">프로젝트명</h4>
            <p class="card-text">프로젝트 데이터부분</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
    <!-- Page Features -->
    <h4 style="margin-top: 30px;">#인기 강의</h4>
    <div class="row text-center">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
     <!-- Page Features -->
    <h4 style="margin-top: 30px;">#인기 공간</h4>
    <div class="row text-center">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">공간명</h4>
            <p class="card-text">공간 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img class="card-img-top" src="http://placehold.it/500x325" alt="">
          <div class="card-body">
            <h4 class="card-title">강의명</h4>
            <p class="card-text">강의 데이터부분</p>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->
    
  </div>
  <!-- /.container -->

<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
<c:import url="footer.jsp"></c:import>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>