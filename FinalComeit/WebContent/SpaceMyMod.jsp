<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body
{
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}

.row
{
	width: 100%;
}
.register{
	background:none;
    margin-top: 7%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
}
</style>
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
                <img src="images/data.png" alt=""/>
                <h3>홍길동님</h3>
                <p>정보를 수정하세요!<br> 단, 올바르지 못한 정보로 수정시 불이익이 있을 수 있습니다.</p>
                <input type="submit" name="" value="돌아가기"/><br/>
            </div>
            <div class="col-md-9 register-right">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="register-heading">Changing information</h3>
                        <div class="row register-form">
                            <div class="col-md-6">
                            	<div class="form-group">
                                    <input type="email" class="form-control" value="id(수정불가)" disabled="disabled" />
                                </div><br>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password *" value="" />
                                </div><br>
                                <div class="form-group">
                                    <input type="password" class="form-control"  placeholder="Confirm Password *" value="" />
                                </div><br>
                            </div>
                            <div class="col-md-6">
                           	 	<div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" value="" />
                                </div><br>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" value="" />
                                </div><br>
                                <div class="form-group">
                                    <input type="text" minlength="10" maxlength="10" name="txtPhone" class="form-control" placeholder="Your Phone *" value="" />
                                </div>
                                <input type="submit" class="btnRegister"  value="수정하기"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>