<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
<c:import url="../layout/header_mypage.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>

	<!--================Blog Area =================-->
	<div class="comments-area " id="upd_area">
		<h4>My page</h4>
		<form action="./memberUpdate" method="post">
			<div class="comment-list">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="thumb">
							<img src="../resources/images/blog-details/c1.jpg" alt="">
						</div>
						<div class="desc">
							<h5>
								<p>Id</p>
							</h5>
							<input type="hidden" class="form-control upd_input" id="id"
								name="id" value="${member.id}">
							<p class="comment">${member.id}</p>
						</div>
					</div>
				</div>
				<div class="desc" id="etc">
					<p class="date"></p>
				</div>
			</div>
			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="desc">
							<h5>
								<p>Password</p>
							</h5>
							<input type="hidden" id="pw" name="pw" value="${member.pw}">
							<input type="password" id="pw" name="pw"
								class="form-control upd_input" placeholder="새비밀번호"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '새비밀번호'">
							<div id=pw_update></div>
							<input type="password" id="pw2" name="pw2"
								class="form-control upd_input pw2_input" placeholder="새비밀번호 확인"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '새비밀번호 확인'">
							<div id=pw2_update></div>
						</div>

					</div>
				</div>
			</div>
			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="desc">
							<h5>
								<p>Name</p>
							</h5>
							<div>
								<input type="text" id="name" name="name" value="${member.name}"
									class="form-control upd_input" placeholder="${member.name}"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '${member.name}'" required>
								<div id="name_check"></div>
							</div>
						</div>

					</div>
				</div>
			</div>

			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="desc">
							<h5>
								<p>Phone Number</p>
							</h5>
							<input type="text" id="tel" name="tel" value="${member.tel}"
								class="form-control upd_input" placeholder="${member.tel}"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = '${member.tel}'" required>
							<div id="tel_check"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="comment-list left-padding">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<div class="desc">
							<h5>
								<p>Email</p>
							</h5>
							<input type="text" id="email" name="email"
								value="${member.email}" class="form-control upd_input"
								placeholder="${member.email}" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '${member.email}'" required>
							<div id="email_check"></div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${member.grade == 2}">
				<div class="comment-list left-padding">
					<div class="single-comment justify-content-between d-flex">
						<div class="user justify-content-between d-flex">
							<div class="desc">
								<h5>
									<p>corporate registration number</p>
								</h5>
								<input type="text" id="reg_number" name="reg_number"
									value="${member.reg_number}" class="form-control upd_input"
									placeholder="${member.reg_number}"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '${member.reg_number}'" required>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<div id="post_btn">
				<button class="genric-btn info">application</button>
				<input type="submit" class="genric-btn info" value="application">
				<input type="button" class="genric-btn danger" id="danger_btn"
					onclick="history.go(-1)" value="Cancel">
			</div>
		</form>
	</div>
	
	<!-- new -->
	   <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo" id="page-wrapper">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Member Info</h2>
                    <form action="./memberUpdate" method="POST">
                    
                        <div class="input-group">  
                       		<div class="input--style-2 column">아이디</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="text" placeholder="${member.id}" name="id" 
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '${member.id}'">
                       		</div>      
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">비밀번호</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="password" placeholder="새비밀번호" name="pw" 
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '새비밀번호'">
                       		</div>  
                       
                       		<div class="input--style-2 column" id=pw_update></div>  
                       		<div class="update_div" >                                 
                            <input class="input--style-2 list member_update" type="password" placeholder="새비밀번호 확인" name="pw2" 
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '새비밀번호 확인'">
                       		</div>    
                        </div>
                        
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">이름</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.name}" name="name" >
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">이메일</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.email}" name="email" >
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">핸드폰번호</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.tel}" name="tel" >
                        </div>
                        
                        <c:if test="${member.grade == 2}">
                         <div class="input-group">  
                       		<div class="input--style-2 column">사업자번호</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.reg_number}" name="reg_number">
                        </div>
                        </c:if>
                                             
                        <div class="p-t-30">
                            <a href="./memberUpdate?id=${member.id}#upd_area" class="btn btn--radius btn--green" >수정</a>          
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	
	
	
	
	
	<!---------------- script ----------------->
	<script type="text/javascript">
   
   /* 비밀번호 */
	$("#pw").blur(function(pw) {
		var pw = $('#pw').val();
		var pwRule = /^[A-Za-z0-9]{6,12}$/;
		
		if(pwRule.test(pw)){
			$('#pw_update').text(" ");
		}else if(pw == ""){
			$('#pw_update').text(" ");	
		}
		else{
				$("#pw_update").html("비밀번호는 문자와 숫자 포함, 6~12자리만 가능합니다.");		
				$("#pw_update").css("color","red");			
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
							$("#pw2_update").html("사용가능한 비밀번호입니다.")
							$("#pw2_update").css("color","green")
						}else{
							$("#pw2_update").html("비밀번호가 일치하지 않습니다.");		
							$("#pw2_update").css("color","red");
							$("#btn").attr("disabled",true);			
						}	
				}
			});

	 	 $("#pw").change(function() {
			$("#pw2").val("");
			$("#pw2_update").html("");
		});
   
	 	 
	 	 
 /* email */ 
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

 	
/********* Tel 형식 *************/
 $("#tel").blur(function(tel) {
		var tel = $('#tel').val();
 		var telRule = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			
		if(telRule.test(tel)){
			$('#tel_check').text(" ");
			$("#btn").attr("disabled",false);
		}else{
				$("#tel_check").html("형식에 맞지 않는 번호입니다.");		
				$("#tel_check").css("color","red");			
				$("#btn").attr("disabled",true);
				return false;			
			}			
	});
 
	 	 
	 	 
   
   </script>




	<!--=============== footer =================-->
	<c:import url="../layout/footer.jsp" />

</body>
</html>
