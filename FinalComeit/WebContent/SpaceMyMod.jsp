<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>     
<!-- CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="<%=cp %>/assets/css/login2.css">
<link rel="stylesheet" href="<%=cp %>/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=cp %>/assets/css/form-elements.css">
<link rel="stylesheet" href="<%=cp %>/assets/css/loginstyle.css">
 </head>

    <body>

        <!-- Top content -->
        <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3>00님 정보수정</h3>
                            		<p>단, 올바르지 못한 정보로 수정시 불이익이 있을 수 있습니다.</p>
                        		</div>
                        		<div class="form-top-right">
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username*</label>
			                        	<input type="text" name="form-username" placeholder="Username" class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password*</label>
			                        	<input type="password" name="form-password" placeholder="Password" class="form-password form-control" id="form-password">
			                        </div>
			                    
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Confirm Password *</label>
			                        	<input type="password" name="form-password" placeholder="Password" class="form-password form-control" id="form-password">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Your Email *</label>
			                        	<input type="password" name="form-password" placeholder="Email" class="form-password form-control" id="form-password">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Your Phone *"</label>
			                        	<input type="password" name="form-password" placeholder="Phone" class="form-password form-control" id="form-password">
			                        </div>
			                        <button type="submit" class="btn" style="width: 100px;">수정</button>
			                        <button type="submit" class="btn" style="width: 100px;">취소</button>
			                    </form>
		                    </div>
                        </div>
                    </div>
                </div>
            </div>
            


        <!-- Javascript -->
        <script src="<%=cp %>/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<%=cp %>/assets/js/bootstrap.min.js"></script>
        <script src="<%=cp %>/assets/js/jquery.backstretch.min.js"></script>
        <script src="<%=cp %>/assets/js/scripts.js"></script>

    </body>

</html>