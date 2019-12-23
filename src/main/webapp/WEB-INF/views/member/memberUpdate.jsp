<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/member/bootStrap.jsp" />
<c:import url="../layout/header.jsp"></c:import>
<c:import url="../layout/header_mypage.jsp"></c:import>
</head>
<body>

	<!--================Blog Area =================-->	
	<!-- new -->
	   <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo" id="page-wrapper">
        <div class="wrapper wrapper--w960" id="upd_area">
            <div class="card card-2">
                <div class="card-heading" ></div>
                <div class="card-body" >
                    <h2 class="title" >Member Info</h2>
                    <form action="./memberUpdate" method="POST">
                    
						<div class="input-group">  
                       		<div class="input--style-2 column">아이디</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.id}" name="id" value="${member.id}" >
                        </div>
                        
        
                         <div class="input-group">  
                         	<div class="input--style-2 column"></div>
                         	<div class="update_div">                                     
                            <input class="input--style-2 list member_update" type="password" placeholder="새비밀번호" name="pw" id="pw" value="${member.pw}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '새비밀번호'">
                  			</div>
                       		
                       		 
                       		<div class="input--style-2 column">비밀번호</div>  
                       		<div class="update_div">                                          
                            <input class="input--style-2 list member_update" type="password" placeholder="새비밀번호 확인" name="pw2" id="pw2"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '새비밀번호 확인'">
                       		</div>
           
                       		<div   class="input--style-2 column" ></div> 
                       		<div   class="input--style-2 column" id="pw_update" ></div>    
                       	
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">이름</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="text" placeholder="${member.name}" name="name" id="name" value="${member.name}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '${member.name}'">
                       		</div>      
                        </div>
                        
                        <%--   <div class="input-group">  
                       		<div class="input--style-2 column">이메일</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="text" placeholder="${member.email}" name="email" id="email" value="${member.email}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '${member.email}'">
                       		</div>   
                       		
                       		<div   class="input--style-2 column" ></div> 
                       		<div   class="input--style-2 column" id="email_update" ></div>    
                        </div> --%>
                        
                        <div class="input-group">  
                       		<div class="input--style-2 column">이메일</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.email}" name="email" value="${member.email}" >
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">핸드폰번호</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="text" placeholder="${member.tel}" name="tel" id="tel" id="tel" value = "${member.tel}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '${member.tel}'">                         
                       		</div>      
                            <div  class="input--style-2 column" ></div> 
                       		<div  class="input--style-2 column" id="tel_update" ></div>   
                        </div>
                        
                        <c:if test="${member.grade == 2}">
                         <div class="input-group">  
                       		<div class="input--style-2 column">사업자번호</div>     
                       		<div class="update_div">                                 
                            <input class="input--style-2 list member_update" type="text" placeholder="${member.reg_number}" name="reg_number" id="reg_number" value = "${member.reg_number}"
                            onfocus="this.placeholder = ''" onblur="this.placeholder = '${member.reg_number}'">
                       		</div>      
                        </div>
                        </c:if>
                        
                        
 	                  	<div class="p-t-30">
			                  <button class="btn btn--radius btn--green" id="btn">적용</button>
			                 
			                  <input type="button" class="btn btn--radius btn--red" id = "btn--red" onclick="history.back()" value="취소">             
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
		var pw2 = $("#pw2").val();
		var pwRule = /^[A-Za-z0-9]{6,12}$/;
				
		if(pwRule.test(pw)){
			$('#pw_update').text(" ");
			$("#btn").attr("disabled",false);			
		}else if(pw ==""){
				$('#pw_update').text(" ");	
				$("#btn").attr("disabled",false);
		}else if(!pwRule.test(pw)){
			$('#pw_update').text("비밀번호는 문자와 숫자 포함, 6~12자리만 가능합니다.");	
			$("#pw_update").css("color","red");
			$("#btn").attr("disabled",true);
		}
		
	}); 
   
   
   
	$("#pw2").blur(function() {	
			var pw = $('#pw').val();
			var pw2 = $("#pw2").val();
			var pwRule = /^[A-Za-z0-9]{6,12}$/;
					
			if(pwRule.test(pw)){
				$('#pw_update').text(" ");
				$("#btn").attr("disabled",false);
				if(pw2 !="" && pw == pw2){
					$("#pw_update").text("사용가능한 비밀번호입니다.")
					$("#pw_update").css("color","green")
					$("#btn").attr("disabled",false);
				}else if(pw2 !="" && pw != pw2){
					$("#pw_update").html("비밀번호가 일치하지 않습니다.");		
					$("#pw_update").css("color","red");
					$("#btn").attr("disabled",true);				
				}			
				
			}else if(pw ==""){
					$('#pw_update').text(" ");	
			}else if(!pwRule.test(pw)){
				$('#pw_update').text("비밀번호는 문자와 숫자 포함, 6~12자리만 가능합니다.");	
				$("#pw_update").css("color","red");
				$("#btn").attr("disabled",true);
			}
			});	
			
	 	 $("#pw").change(function() {
			$("#pw2").val("");
			$("#pw2_update").html("");
		});
   
	 	 
	 	 
 /* email */ 
 
/*  $("#email").blur(function(email) {
	var email = $('#email').val();
	var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;		
	var query= {email: $('#email').val()};
	
	$.ajax({
		url:"memberCheckEmail",
		type: "post",
		data: query,
		success:function(data){
			if(data == 1){
				$("#email_update").text("이미 사용중인 이메일입니다.");
				$("#email_update").css("color","red");
				$("#btn").attr("disabled",true);	
				
			}else{
				
				if(emailRule.test(email)){
					$('#email_update').text(" ");	
					$("#btn").attr("disabled",false);
				}else if(email ==""){
					$('#email_update').text(" ");
					$("#btn").attr("disabled",false);
				}else if(!emailRule.test(email)){
					$('#email_update').text("이메일 주소를 다시 확인해주세요.");
					$('#email_update').css('color','red');
					$('#btn').attr("disabled",true);
					return false;					
					
				}		
			}
			
		},error:function(){		
			
		}
				
	});						
}); 
 */
 	
/********* Tel 형식 *************/
  $("#tel").blur(function(tel) {
		var tel = $('#tel').val();
 		var telRule = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			
		if(telRule.test(tel)){
			$('#tel_update').text(" ");
			$("#btn").attr("disabled",false);
		}else if(tel ==""){
			$('#tel_update').text(" ");
			$("#btn").attr("disabled",false);
		}else if(!telRule.test(tel)){
				$("#tel_update").html("형식에 맞지 않는 번호입니다.");		
				$("#tel_update").css("color","red");			
				$("#btn").attr("disabled",true);		
			}			
	}); 


	 $('#tel').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this);
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 3) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 8) {
		            $text.val($text.val() + '-');
		        }
		    }
		 
		    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
		});

	/*********** 사업자 번호 *************/
	  $('#reg_number').keydown(function (event) {
	             var key = event.charCode || event.keyCode || 0;
	             
	             $text = $(this); 
	             
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 3){
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 6){
	                     $text.val($text.val() + '-');
	                 }
	             }

	             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
				 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	         });


	/*   /^[a-z]{0,10}$/ */

	
	
  </script>


	<!--=============== footer =================-->
	<c:import url="../layout/footer.jsp" />

</body>
</html>
