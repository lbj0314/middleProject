<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<c:import url="../layout/header_mypage.jsp"></c:import>
<c:import url="../layout/member/bootStrap.jsp"/>
</head>
<body><!-- Preloader Starts -->
    <div class="preloader">
        <div class="spinner"></div>
    </div>
    <!-- Preloader End -->
<c:import url="../layout/member/header.jsp"/>

	<!-- new -->
	   <div class="page-wrapper bg-red p-t-180 p-b-100 font-robo" id="page-wrapper">
        <div class="wrapper wrapper--w960">
            <div class="card card-2">
                <div class="card-heading"></div>
                <div class="card-body">
                    <h2 class="title">Member Info</h2>
                    <form method="POST">
                    
                        <div class="input-group">  
                       		<div class="input--style-2 column">아이디</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.id}" name="id" readonly="readonly">
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">이름</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.name}" name="name" readonly="readonly">
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">이메일</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.email}" name="email" readonly="readonly">
                        </div>
                        
                         <div class="input-group">  
                       		<div class="input--style-2 column">핸드폰번호</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.tel}" name="tel" readonly="readonly">
                        </div>
                        
                        <c:if test="${member.grade == 2}">
                         <div class="input-group">  
                       		<div class="input--style-2 column">사업자번호</div>                                            
                            <input class="input--style-2 list" type="text" placeholder="${member.reg_number}" name="reg_number" readonly="readonly">
                        </div>
                        </c:if>
                                             
                        <div class="p-t-30" align="center">
                            <a href="./memberUpdate?id=${member.id}#page-wrapper" class="genric-btn info" >수정</a>
                            <a href="../reservation/reservationCheck2?member_num=${member.member_num}" class="genric-btn primary">예약 확인</a>        
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

  
	<!--=============== footer =================-->
	<c:import url="../layout/member/footer.jsp" />

</body>