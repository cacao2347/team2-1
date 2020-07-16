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
<title>SpaceDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/assets/css/space-detail.css">
</head>
<body>
<c:import url="header.jsp"></c:import>
<%-- <jsp:include page="header.jsp"></jsp:include> --%>
<!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- Post Content Column -->
      <div class="col-lg-8">

        <!-- Title -->
        <h1 class="mt-4">업체명</h1>

        <!-- Author -->
        <p class="lead">
          	상호명
        </p>

        <hr>

        <!-- Preview Image -->
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

        <hr>

        <!-- Post Content -->
        <div class="lead">
        <h4>#태그1 #태그2 #태그3</h4><h5>스터디카페</h5>
        </div>
        <br><br>
        
        <!-- 공간 정보 부분 -->
        <div class="row">
		<div class="col-md-12">
			<dl>
				<dt>
					한줄 소개
				</dt>
				<dd>
					A description list is perfect for defining terms.
				</dd>
				<dt>
					상세 소개
				</dt>
				<dd>
					Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.
				</dd>
				<dd>
					Donec id elit non mi porta gravida at eget metus.
				</dd>
				<dt>
					예약시 주의사항
				</dt>
				<dd>
				  주의사항 내용 부분
				</dd>
				<dt>
					시설 안내
				</dt>
				<dd>
				<div class="row">
					<div class="col-md-12">
						<ul>
							<li class="list-item">
								시설안내1
							</li>
							<li class="list-item">
								시설안내2
							</li>
							<li class="list-item">
								시설안내3
							</li>
							<li class="list-item">
								시설안내4
							</li>
						</ul>
					</div>
				</div>
				</dd>
			</dl>
		</div>
	</div><!-- end row -->
        

        <!-- Comments Form -->
        <div class="card my-4 feedback">
        	<div  class="card-header">
          <h3>Feedback</h3>
          <form>
              <button type="submit" class="btn btn-primary">등록하기</button>
            </form>
            </div>
          <div class="card-body">
            
        
		<br>
		<br>

        <!-- Single Comment -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">김길동</h5>
          	  좋아요!
          </div>
        </div>

        <!-- Comment with nested comments -->
        <div class="media mb-4">
          <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
          <div class="media-body">
            <h5 class="mt-0">장길동</h5>
            	깔끔해요!
          </div>
        </div>
        <!-- 페이징 영역 -->
			<div class="row paging">
				<div class="col-md-12">
					<nav>
						<ul class="pagination">
			            <li class="page-item"><a href="#" class="page-link">Previous</a></li>
			            <li class="page-item"><a href="#" class="page-link">1</a></li>
			            <li class="page-item"><a href="#" class="page-link">2</a></li>
			            <li class="page-item"><a href="#" class="page-link">3</a></li>
			            <li class="page-item"><a href="#" class="page-link">4</a></li>
			            <li class="page-item"><a href="#" class="page-link">5</a></li>
			            <li class="page-item"><a href="#" class="page-link">6</a></li>
			            <li class="page-item"><a href="#" class="page-link">7</a></li>
			            <li class="page-item"><a href="#" class="page-link">8</a></li>
			            <li class="page-item"><a href="#" class="page-link">9</a></li>
			            <li class="page-item"><a href="#" class="page-link">10</a></li>
			            <li class="page-item"><a href="#" class="page-link">Next</a></li>
			            </ul>
					</nav>
				</div>
			</div>
		</div>
        </div>
      </div>

      <!-- Sidebar Widgets Column -->
      <div class="col-md-4">


        <!-- Search Widget -->
        <div class="card my-4">
          <h5 class="card-header">업체 정보</h5>
          <div class="card-body">
          	<dl>
          		<dt>대표자명</dt>
          		<dd>홍길동</dd>
          		<dt>전화번호</dt>
          		<dd>(123) 456-7890</dd>
          		<dt>영업 정보</dt>
          		<dd>요일 : 월요일<br>영업 시간 : 오후 1시 ~ 8시<br>최대 이용 시간 : 3시간</dd>
          	</dl>
          </div>
        </div>

        <!-- Side Widget -->
        <div class="card my-4">
          <h5 class="card-header">위치</h5>
          <div class="card-body">
          <!-- 지도넣는 부분 -->
          	지도
          <address>
				 <strong>업체 주소</strong><br /> 795 Folsom Ave, Suite 600<br /> San Francisco, CA 94107<br />
			</address>
			<button type="submit" class="btn btn-primary">예약하기</button>
          
          </div>
        </div>

	<button type="button" id="report" class="btn btnEvent">
		<img src="images/report.png" alt="btnImages" class="btnImages" style="width: 35px;">
	</button>
    </div>
    <!-- /.row -->
    

</div>
  </div>
  <!-- /.container -->

<div class="row">
	<div class="col-md-12">
	<c:import url="footer.jsp"></c:import>
	</div>
</div>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=cp %>/assets/js/jquery.min.js"></script>
  <script src="<%=cp %>/assets/js/bootstrap.bundle.min.js"></script>

</body>
</html>