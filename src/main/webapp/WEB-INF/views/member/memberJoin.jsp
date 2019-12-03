<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Page Title -->
    <title>Elements</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../resources/images/logo/favicon.png" type="image/x-icon">

    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/animate-3.7.0.css">
    <link rel="stylesheet" href="../resources/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="../resources/fonts/flat-icon/flaticon.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="../resources/css/owl-carousel.min.css">
    <link rel="stylesheet" href="../resources/css/nice-select.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/member/member.css">
    
</head>
<body>
    <!-- Preloader Starts -->
    <div class="preloader">
        <div class="spinner"></div>
    </div>
    <!-- Preloader End -->

    <!-- Header Area Starts -->
	<header class="header-area header-area2">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo-area">
                        <a href="index.html"><img src="../resources/images/logo/logo2.png" alt="logo"></a>
                    </div>
                </div>
                <div class="col-lg-10">
                    <div class="custom-navbar">
                        <span></span>
                        <span></span>
                        <span></span>
                    </div>  
                    <div class="main-menu main-menu2">
                        <ul>
                            <li class="active"><a href="index.html">home</a></li>
                            <li><a href="about.html">about</a></li>
                            <li><a href="menu.html">menu</a></li>
                            <li><a href="#">blog</a>
                                <ul class="sub-menu">
                                    <li><a href="blog-home.html">Blog Home</a></li>
                                    <li><a href="blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">contact</a></li>
                            <li><a href="elements.html">Elements</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->
 <!-- Banner Area Starts -->
    <section class="banner-area banner-area2 blog-page text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1><i>Elements</i></h1>
                    <a href="index.html">home</a>
                    <span class="mx-2">/</span>
                    <a href="elements.html">elements</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->
         
            <div class="section-top-border">
                <div class="row">
                    <div class="col-lg-8 col-md-8" id=join-form>
                        <h3 class="mb-30 title_color">Create account</h3>
                      	
                        <form action="./memberJoin" method="post" id = "frm">
                      <div class="single-element-widget">
                            <h5 class="mb-30 title_color">회원선택</h5>
                              <div class="switch-wrap d-flex justify-content-between">
                                <p id=check_pri>개인회원</p>
                                <div class="primary-radio">
                                    <input type="radio" id="primary-radio" name="grade" value="1" checked="checked">
                                  <label for="primary-radio"></label>
                                </div>
                            </div>
                            <div class="switch-wrap d-flex justify-content-between">
                                <p id = check_cor>기업회원</p>
                                <div class="confirm-radio">
                                    <input type="radio" id="confirm-radio" name="grade" value="2">
                                    <label for="confirm-radio"></label>
                                </div>
                            </div>
                            </div>
                                                     	
                                              
                            <div class="mt-10">
                                <input type="text" id ="id" name="id" placeholder="Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'" required class="single-input-primary">                         
                            	<div id ="text"></div>
                            </div>
                            <div class="mt-10">
                                <input type="password" id = "pw" name="pw" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input-primary">
                            	<div id = "pw_check"></div>
                            </div>
                            <div class="mt-10">
                                <input type="password" id = "pw2" name="pw2" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" required class="single-input-primary">
                          	  <div id="pw2_check"></div>
                            </div>
                     
                            <div></div>
                            <div class="mt-10 form-group">
                                <input type="email" name="email" id="email"  placeholder="Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required class="single-input-primary">
                            	<div id = "email_check"></div>
                            	 <div id = "email_chk_btn">
                                  <a href="#" class="genric-btn success-border medium" >인증하기</a>
                            	</div>
                            </div>
                               <div class="mt-10">
                                <input type="text" name="name" id="name" placeholder="Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required class="single-input-primary">
                            	<div id = "name_check"></div>
                            </div>
                            <div class="mt-10">
                                <input type="text" name="tel" id="tel" placeholder="010-***-****" onfocus="this.placeholder = ''" onblur="this.placeholder = '010-***-****'" required class="single-input-primary">
                           		<div id = "tel_check"></div>
                            </div>                                                                  
                            <div class="mt-10">
                                <input type="text" id="reg_number"  name="reg_number" placeholder="reg_number" onfocus="this.placeholder = 'reg_number'" onblur="this.placeholder = 'reg_number'"  class="single-input-primary">
                            </div>                        
                            	<div id = "btn-form">
                  			  <input type="submit" class="genric-btn primary radius" id = "btn" value= "Create your account">            
                  			   </div>
                        </form>
                    </div>
                   
                        </div>
                    </div>
       
    <!-- End Align Area -->
  
  
  <script type="text/javascript"> 
   
  /**** 기업번호div활성화 *****/   
    $("#reg_number").hide();
    
	$('input:radio[name=grade]').click(function() {
		if($('input:radio[id=confirm-radio]').is(":checked")){
			$("#reg_number").show();
		}else{
			  $("#reg_number").hide();	
			  $('#reg_number').val('0');
		}		
	});
    	
	
/**** id 형식 & 중복확인*****/			
	$("#id").blur(function(id) {
		var id = $('#id').val();
		var idRule = /^[a-z0-9]{4,12}$/;
		var query = {id :  $('#id').val()};	
		$.ajax({
			url:"memberCheckId",
			type: "post",
			data: query,
			success:function(data){
				if(data == 1){
					$("#text").text("사용중인 아이디입니다.");
					$("#text").css("color","red");
					$("#btn").attr("disabled",true);										
				}else{
					if(idRule.test(id)){
						$('#text').text(" ");
						$("#btn").attr("disabled",false);			
					}else if(id ==""){					
							$('#text').text('필수 정보입니다.');
							$('#text').css('color','red');
							$("#btn").attr("disabled",true);					
					}else{
						$('#text').text("아이디는 소문자와 숫자, 4~12자리만 가능합니다.");
						$('#text').css('color','red');
						$('#btn').attr("disabled",true);
						return false;					
					}					
				 /* 	$("#text").text("사용가능한 아이디입니다.");
					$("#text").css("color","green");
					$("#btn").attr("disabled",false);  */
				}
			},error:function(){
				
			}			
		});						
	});
	
   
/******* 비밀번호 형식 ******/	
	$("#pw").blur(function(pw) {
		var pw = $('#pw').val();
		var pwRule = /^[A-Za-z0-9]{6,12}$/;
		
		if(pwRule.test(pw)){
			$('#pw_check').text(" ");
			$("#btn").attr("disabled",false);
		}else if(pw ==""){
			$("#pw_check").html("필수 정보입니다.");		
			$("#pw_check").css("color","red");	
			$("#btn").attr("disabled",true);
		}else{
				$("#pw_check").html("비밀번호는 문자와 숫자 포함, 6~12자리만 가능합니다.");		
				$("#pw_check").css("color","red");			
				$("#btn").attr("disabled",true);
				return false;			
			}			
	});
	
/****** 비밀번호 일치 ******/  
 	 $("#pw2").blur(function() {
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();	
			
			if(pw == pw2){
					if(pw !="" && pw2 != ""){
						$("#pw2_check").html("사용가능한 비밀번호입니다.")
						$("#pw2_check").css("color","green")
					}else{		
						}
					}else{
						$("#pw2_check").html("비밀번호가 일치하지 않습니다.");		
						$("#pw2_check").css("color","red");
						$("#btn").attr("disabled",true);
					}			
			});
 
 	 	 $("#pw").change(function() {
			$("#pw2").val("");
			$("#pw2_check").html("");
		});
 	 	  	
/********** Email 형식 *********/ 	 	

/*  $("#email").blur(function(email) {
	var email = $('#email').val();
	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(emailRule.test(email)){
		$('#email_check').text(" ");
		$("#btn").attr("disabled",false);
	}else if(email ==""){
		$("#email_check").html("필수 정보입니다.");		
		$("#email_check").css("color","red");	
		$("#btn").attr("disabled",true);
	}else{
			$("#email_check").html("이메일 주소를 다시 확인해주세요.");		
			$("#email_check").css("color","red");			
			$("#btn").attr("disabled",true);
			return false;			
		}			
});  */


 $("#email").blur(function(email) {
	var email = $('#email').val();
	var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var query= {email: $('#email').val()};	
	$.ajax({
		url:"memberCheckEmail",
		type: "post",
		data: query,
		success:function(data){
			if(data == 1){
				$("#email_check").text("이미 사용중인 이메일입니다.");
				$("#email_check").css("color","red");
				$("#btn").attr("disabled",true);										
			}else{
				if(emailRule.test(email)){
					$('#email_check').text(" ");
					$("#btn").attr("disabled",false);			
				}else if(email ==""){					
						$('#email_check').text('필수 정보입니다.');
						$('#email_check').css('color','red');
						$("#btn").attr("disabled",true);					
				}else{
					$('#email_check').text("이메일 주소를 다시 확인해주세요.");
					$('#email_check').css('color','red');
					$('#btn').attr("disabled",true);
					return false;					
				}		
			}	
		},error:function(){		
			
		}
				
	});						
}); 


/******* Name 형식 *********/
$("#name").blur(function(name) {
	var name = $('#name').val();
	if(name == ""){
		$("#name_check").html("필수 정보입니다.");		
		$("#name_check").css("color","red");	
		$("#btn").attr("disabled",true);
	}else
		$('#name_check').text(" ");
		$("#btn").attr("disabled",false);
});

 	
/********* Tel 형식 *************/
 $("#tel").blur(function(tel) {
		var tel = $('#tel').val();
 		var telRule = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			
		if(telRule.test(tel)){
			$('#tel_check').text(" ");
			$("#btn").attr("disabled",false);
		}else if(tel ==""){
			$("#tel_check").html("필수 정보입니다.");		
			$("#tel_check").css("color","red");	
			$("#btn").attr("disabled",true);
		}else{
				$("#tel_check").html("형식에 맞지 않는 번호입니다.");		
				$("#tel_check").css("color","red");			
				$("#btn").attr("disabled",true);
				return false;			
			}			
	});



 </script>
    

    <!-- Footer Area Starts -->
    <footer class="footer-area">
        <div class="footer-widget section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-widget single-widget1">
                            <a href="index.html"><img src="../resources/images/logo/logo2.png" alt=""></a>
                            <p class="mt-3">Which morning fourth great won't is to fly bearing man. Called unto shall seed, deep, herb set seed land divide after over first creeping. First creature set upon stars deep male gathered said she'd an image spirit our</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget2 my-5 my-md-0">
                            <h5 class="mb-4">contact us</h5>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-map-marker"></i>
                                </div>
                                <div class="info-text">
                                    <p>1234 Some St San Francisco, CA 94102, US 1.800.123.4567 </p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="info-text">
                                    <p>(123) 456 78 90</p>
                                </div>
                            </div>
                            <div class="d-flex">
                                <div class="into-icon">
                                    <i class="fa fa-envelope-o"></i>
                                </div>
                                <div class="info-text">
                                    <p>support@axiomthemes.com</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="single-widget single-widget3">
                            <h5 class="mb-4">opening hours</h5>
                            <p>Monday ...................... Closed</p>
                            <p>Tue-Fri .............. 10 am - 12 pm</p>
                            <p>Sat-Sun ............... 8 am - 11 pm</p>
                            <p>Holidays ............. 10 am - 12 pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-6">
                        <span><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <div class="social-icons">
                            <ul>
                                <li class="no-margin">Follow Us</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Area End -->


    <!-- Javascript -->
    <script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="../resources/js/vendor/wow.min.js"></script>
    <script src="../resources/js/vendor/owl-carousel.min.js"></script>
    <script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
    <script src="../resources/js/main.js"></script>
</body>
</html>


</body>
</html>