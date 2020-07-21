<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String searchPwd = (String)session.getAttribute("searchPwd");
	session.setAttribute("searchPwd", searchPwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SearchPw.jsp</title>
<link rel="stylesheet" href="<%=cp %>/assets/css/searchpw.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<!-- CSS -->
<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/loginstyle.css">
 -->
<style type="text/css">
.login
{
	max-width: 70% !important;
	padding: 0px !important;
}
</style>

</head>

<body>

	<div class="container register">
		<div class="row">
			<div class="col-md-3 register-left">
				<img src="<%=cp %>/assets/images/data.png" alt="" />
				<h3>Welcome</h3>
				<p>COME-IT에 가입하세요!</p>
				<input type="submit" name="" value="로그인하기" /><br />
			</div>
			<div class="col-md-9 register-right">
				<div class="col-sm-6 col-sm-offset-3 form-box login">
					<div class="form-top">
						<div class="form-top-left">
						<c:set var = "type" scope = "session" value = "<%=searchPwd %>"/>
		           		 <c:choose>
		           		 <c:when  test="${type eq 'memPwdSearch'}">
							<h3>회원 PW 찾기</h3>
						 </c:when>
						 <c:when  test="${type eq 'spaPwdSearch'}">
						    <h3>업체 PW 찾기</h3>
						 </c:when>
						 </c:choose>
							
							<br>
							<p>가입시 입력한 실명, 아이디, 전화번호를 입력해 주세요.</p>
						</div>
						<div class="form-top-right"></div>
					</div>
					<div class="form-bottom">
						<form role="form" action="" method="post" class="login-form">
							<!-- <div class="form-group form-inline">
								<label class="sr-only" for="form-username">Username</label> <span>실명</span>
								<input type="text" name="form-username"
									placeholder="가입시 입력한 실명" class="form-username form-control"
									id="form-username">
							</div>
							<div class="form-group form-inline">
								<label class="sr-only" for="form-password">Password</label> <span>전화번호</span>
								<input type="password" name="form-password"
									placeholder="가입시 입력한 전화번호" class="form-password form-control"
									id="form-password">
								<button type="submit" class="btn">문자발송</button>
							</div>
							<div class="form-group form-inline">
								<label class="sr-only" for="form-oknumber">Oknumber</label> <span>인증번호</span>
								<input type="text" name="form-oknumber"
									placeholder="인증번호" class="form-oknumber form-control"
									id="form-oknumber">
								<button type="submit" class="btn">문자발송</button>
							</div> -->
							<table class="inputForm">
								<tr>
									<th>실명</th>
									<td>
									<label class="sr-only" for="form-username">Username</label>
									<input type="text" name="form-username"
									placeholder="가입시 입력한 실명" class="form-username form-control"
									id="form-username">
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td>
									<label class="sr-only" for="form-userid">UserId</label>
									<input type="text" name="form-userid"
									placeholder="가입시 입력한 아이디" class="form-userid form-control"
									id="form-userid">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>
									<label class="sr-only" for="form-password">Password</label>
									<input type="text" name="form-password"
									placeholder="가입시 입력한 전화번호" class="form-password form-control"
									id="form-password">
									</td>
									<td>
									<button type="submit" class="btn">문자발송</button>
									</td>
								</tr>
								<tr>
									<th>인증번호</th>
									<td>
									<label class="sr-only" for="form-oknumber">Oknumber</label>
									<input type="text" name="form-oknumber"
									placeholder="인증번호" class="form-oknumber form-control"
									id="form-oknumber">
									</td>
									<td>
									<button type="submit" class="btn">인증하기</button>
									</td>
								</tr>
							</table>
							<div class="resultArea">
								<div class="resultMsg">
								인증이 성공되었습니다. 
								</div>
								<button type="submit" class="btn btn-primary searchBtn">PW 받기</button>
							</div>
						</form>
						<div class="row2 login-form">
				          	<div >
				           	<a class="long-form-btn">
				           	<input type="hidden" id="admType" name="loginType" value="memIpSearch"> 
				           		<button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberlogin.action'">로그인</button>
				           	</a>
<!-- 				           	<a class="long-form-btn">
				           	<input type="hidden" id="admType" name="loginType" value="memPwdSearch"> 
				           		<button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='searchId.action'">ID 찾기</button>
				           	</a> -->
				           	<a class="long-form-btn">
				           	<input type="hidden" id="admType" name="loginType" value="join"> 
				           		 <c:set var = "type" scope = "session" value = "<%=searchPwd %>"/>
				           		 <c:choose>
				           		 <c:when  test="${type eq 'memPwdSearch'}">
				           		 <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='memberjoin.action'">회원가입</button>
				           		 </c:when >
				           		 <c:when  test="${type eq 'spaPwdSearch'}">
				           		 <button type="submit" class="btn" style="background: none; color: gray;" onClick="location.href='spajoin.action'">회원가입</button>
				           		 </c:when>
				           		 </c:choose>
				           	</a>
				          	</div>
				        </div>
					</div>
			</div>
			</div>
		</div>
	</div>
</body>

</html>