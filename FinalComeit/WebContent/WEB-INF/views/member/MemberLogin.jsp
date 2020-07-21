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
<link rel="stylesheet" href="<%=cp %>/assets/css/login.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<!-- CSS -->
<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/loginstyle.css">
 -->
<script type="text/javascript">
	$(document).ready(function () {
		
	    var navListItems = $('div.setup-panel div a'),
	        allWells = $('.setup-content'),
	        allNextBtn = $('.nextBtn');
	
	    allWells.hide();
	
	    navListItems.click(function (e) {
	        e.preventDefault();
	        var $target = $($(this).attr('href')),
	            $item = $(this);
	
	        if (!$item.hasClass('disabled')) {
	            navListItems.removeClass('btn-success').addClass('btn-default');
	            $item.addClass('btn-success');
	            allWells.hide();
	            $target.show();
	            $target.find('input:eq(0)').focus();
	        }
	    });
	
	    allNextBtn.click(function () {
	        var curStep = $(this).closest(".setup-content"),
	            curStepBtn = curStep.attr("id"),
	            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	            curInputs = curStep.find("input[type='text'],input[type='url']"),
	            isValid = true;
	
	        $(".form-group").removeClass("has-error");
	        for (var i = 0; i < curInputs.length; i++) {
	            if (!curInputs[i].validity.valid) {
	                isValid = false;
	                $(curInputs[i]).closest(".form-group").addClass("has-error");
	            }
	        }
	
	        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
	    });
	
	    $('div.setup-panel div a.btn-success').trigger('click');
	});

	jQuery(document).ready(function(){
	    var select = $("select#mm");
	    select.change(function(){
	        var select_name = $(this).children("option:selected").text();
	        $(this).siblings("label").text(select_name);
	    });
	});
	
</script>
 </head>

    <body>

<div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="<%=cp %>/assets/images/data.png" alt=""/>
                        <h3>Welcome</h3>
                        <p>You are 30 seconds away from earning your own money!</p>
                        <input type="submit" name="" value="Login"/><br/>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="mem-tab" data-toggle="tab" href="#mem" role="tab" aria-controls="mem" aria-selected="true">회원</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="spa-tab" data-toggle="tab" href="#spa" role="tab" aria-controls="spa" aria-selected="false">업체</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="adm-tab" data-toggle="tab" href="#adm" role="tab" aria-controls="adm" aria-selected="false">관리자</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="mem" role="tabpanel" aria-labelledby="mem-tab">
                                <div class="col-sm-6 col-sm-offset-3 form-box login">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>회원 Login</h3><br>
		                            		<p>Enter your username and password to log on:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        		</div>
		                            </div>
                                 <div class="form-bottom">
				                    <form role="form" action="login.action" method="post" class="login-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text" name="formUsername" placeholder="Username..." class="form-username form-control" id="formUsername">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="formPassword" placeholder="Password..." class="form-password form-control" id="formPassword">
				                        </div>
				                        <button type="submit" class="btn">Sign in!</button>
				                    </form>
		                   		 </div>
                            </div>
                            </div>
                            <div class="tab-pane fade show" id="spa" role="tabpanel" aria-labelledby="spa-tab">
                                <div class="col-sm-6 col-sm-offset-3 form-box login">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>업체 Login</h3><br>
		                            		<p>Enter your username and password to log on:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        		</div>
		                            </div>
                                 <div class="form-bottom">
				                    <form role="form" action="" method="post" class="login-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text" name="form-username" placeholder="Username..." class="form-username form-control" id="form-username">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
				                        </div>
				                        <button type="submit" class="btn">Sign in!</button>
				                    </form>
		                   		 </div>
                            </div>
                            </div>
                            <div class="tab-pane fade show" id="adm" role="tabpanel" aria-labelledby="adm-tab">
                                <div class="col-sm-6 col-sm-offset-3 form-box login">
		                        	<div class="form-top">
		                        		<div class="form-top-left">
		                        			<h3>관리자 Login</h3><br>
		                            		<p>Enter your username and password to log on:</p>
		                        		</div>
		                        		<div class="form-top-right">
		                        		</div>
		                            </div>
                                 <div class="form-bottom">
				                    <form role="form" action="" method="post" class="login-form">
				                    	<div class="form-group">
				                    		<label class="sr-only" for="form-username">Username</label>
				                        	<input type="text" name="form-username" placeholder="Username..." class="form-username form-control" id="form-username">
				                        </div>
				                        <div class="form-group">
				                        	<label class="sr-only" for="form-password">Password</label>
				                        	<input type="password" name="form-password" placeholder="Password..." class="form-password form-control" id="form-password">
				                        </div>
				                        <button type="submit" class="btn">Sign in!</button>
				                    </form>
		                   		 </div>
                            </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
						<div class="row2 login-form">
                        	<div >
	                        	<a class="long-form-btn " href="#">
	                        		ID찾기
	                        	</a>
	                        	<a class="long-form-btn" href="#">
	                        		PW 찾기
	                        	</a>
	                        	<a class="long-form-btn" href="#">
	                        		 회원가입
	                        	</a>
                        	</div>
                        </div>
            </div>
    </body>

</html>