<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>

	<!-- Align Area Start -->
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8" id=join-form>
				<h3 class="mb-30 title_color">Create account</h3>

				<form action="./memberJoin" method="post" id="frm">
					<div class="single-element-widget">
						<h5 class="mb-30 title_color">회원선택</h5>
						<div class="switch-wrap d-flex justify-content-between">
							<p id=check_pri>개인회원</p>
							<div class="primary-radio">
								<input type="radio" id="primary-radio" name="grade" value="1"
									checked="checked"> <label for="primary-radio"></label>
							</div>
						</div>
						<div class="switch-wrap d-flex justify-content-between">
							<p id=check_cor>기업회원</p>
							<div class="confirm-radio">
								<input type="radio" id="confirm-radio" name="grade" value="2">
								<label for="confirm-radio"></label>
							</div>
						</div>
					</div>

					<div class="mt-10">
						<input type="text" id="id" name="id" placeholder="Id"
							onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'"
							required class="single-input-primary">
						<div id="text"></div>
					</div>
					<div class="mt-10">
						<input type="password" id="pw" name="pw" placeholder="Password"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Password'" required
							class="single-input-primary">
						<div id="pw_check"></div>
					</div>
					<div class="mt-10">
						<input type="password" id="pw2" name="pw2" placeholder="Password"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Password'" required
							class="single-input-primary">
						<div id="pw2_check"></div>
					</div>


				
					<div class="mt-10 form-group">
						<input type="email" name="email" id="email"
							placeholder="Email address" onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Email address'" required
							class="single-input-primary">
						 <div id="email_check"></div>
						 <div id="email_chk_btn"></div> 
					</div>
					<!-- <div>
						<a href="./memberEmailConfirm" id="email_chk_btn" class="genric-btn success-border medium">인증하기</a>						
					</div> -->



					<div class="mt-10">
						<input type="text" name="name" id="name" placeholder="Name"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'Name'" required
							class="single-input-primary">
						<div id="name_check"></div>
					</div>
					<div class="mt-10">
						<input type="text" name="tel" id="tel" placeholder="010-***-****"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '010-***-****'" required
							class="single-input-primary">
						<div id="tel_check"></div>
					</div>
					<div class="mt-10">
						<input type="text" id="reg_number" name="reg_number"
							placeholder="reg_number"
							onfocus="this.placeholder = 'reg_number'"
							onblur="this.placeholder = 'reg_number'"
							class="single-input-primary">
					</div>
					<div id="btn-form">
						<input type="submit" class="genric-btn primary radius" id="btn"
							value="Create your account">
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- End Align Area -->


	<script type="text/javascript"> 
	/***** email인증  ******/
/* 	$("#email_chk_btn").click(function(){
				var email = $('#email').val();
		$.ajax(
			{
				type: "GET",
				url: "./memberEmailConfirm",
				data: email,
				success: function(data) {
					data = data.trim();					
				} 
				,error:function(data){
				console.log(data);
				alert("다시 시도해주세요.");
				return false;
			}	
				
			}
		)//ajax끝 						
	}); */
	
   
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
		var idRule = /^[a-z0-9]{4,12}$/;
		var id = $('#id').val();
	
		$.ajax({
			url: "memberCheckId?id="+id,
			type: "get",
		
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
						console.log(data);
							$('#text').text('필수 정보입니다.');
							$('#text').css('color','red');
							$("#btn").attr("disabled",true);					
					}else{
						$('#text').text("아이디는 소문자와 숫자, 4~12자리만 가능합니다.");
						$('#text').css('color','red');
						$('#btn').attr("disabled",true);
						return false;					
					}					
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
			var pwRule = /^[A-Za-z0-9]{6,12}$/;
			
			if(pw == pw2 && pwRule.test(pw2)){
					if(pw !="" && pw2 != ""){
						$("#pw2_check").html("사용가능한 비밀번호입니다.")
						$("#pw2_check").css("color","green")
					}else{
						$("#pw2_check").html("비밀번호가 일치하지 않습니다.");		
						$("#pw2_check").css("color","red");
						$("#btn").attr("disabled",true);
					}			
			}
			});
 
 	 	 $("#pw").change(function() {
			$("#pw2").val("");
			$("#pw2_check").html("");
		});
 	 	  	
/********** Email 형식 *********/ 	 	

 $("#email").blur(function() {
	var email = $('#email').val(); 
	var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var query = {email :  $('#email').val()};	
	
	$.ajax({
		url: 'memberCheckEmail',
		type: 'POST',
		data: email,
		
		success:function(data){
		/* 	 if(data == 1){
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
				}	  */	
				
			 if(email ==""){
				$('#email_check').text('필수 정보입니다.');
				$('#email_check').css('color','red');
				$("#btn").attr("disabled",true);										
				console.log(data);
			}else{
				if(data == 0){
					$("#email_check").text("이미 사용중인 이메일입니다.");
					$("#email_check").css("color","red");
					$("#btn").attr("disabled",true);
				}else{
					if(emailRule.test(email)){
						$('#email_check').text(" ");
						$("#btn").attr("disabled",false);	
					}else{
						$('#email_check').text("이메일 주소를 다시 확인해주세요.");
						$('#email_check').css('color','red');
						$('#btn').attr("disabled",true);
						return false;																		
						}
					}					
				}	
		},error:function(){		
			
		}
				
	});		//ajax끝				
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

/* $("#tel").keyup(function(tel) {
	var telRule = 
	
});
 */
 
 $("#tel").blur(function(tel) {
		var tel = $('#tel').val();
 		var telRule = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
 		tel = tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");		
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


	<!--------------- Footer ----------------->
	<c:import url="../layout/footer.jsp" />


</body>
</html>