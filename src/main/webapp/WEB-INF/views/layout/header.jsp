<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <!-- Favicon -->
    <link rel="shortcut icon" href="resources/images/logo/favicon.png" type="image/x-icon">
   
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
                        <a href="${pageContext.request.contextPath}/"><img src="../resources/images/logo/logo2.png" alt="logo"></a>
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
                            <li class="active"><a href="#">home</a></li>
                            <li><a href="./restaurant/restList">restaurant</a></li>
                            <li><a href="./menu/menuList">menu</a></li>
                            <li><a href="#">blog</a>
                                <ul class="sub-menu">
                                    <li><a href="#">Blog Home</a></li>
                                    <li><a href="#">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="contact-us.html">contact</a></li>
                             <li><a href="#">My Page</a>
                               <ul class="sub-menu">
                                	<c:if test= "${empty member}">                            
                                    <li><a href="${pageContext.request.contextPath}/member/memberLogin">마이페이지</a></li>
                                    <li><a href="${pageContext.request.contextPath}/member/memberLogin">예약확인하기</a></li>
                               		</c:if>
                               		
                               		<c:if test= "${not empty member}">
                               		  <li><a href="${pageContext.request.contextPath}/member/memberMylist">마이페이지</a></li>                                   
                                    <li><a href="${pageContext.request.contextPath}/member/memberMypage">예약확인하기</a></li>
                                    <li><a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a></li>
                                    </c:if>
                            
                               </ul>
                            </li>
                                  	<li><a href="#">Reservation</a></li>
                               <li><a href="#">게시판</a> 
                               	<ul class="sub-menu">    	
                                  	<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지 게시판</a></li>
                              		<li><a href="${pageContext.request.contextPath}/qna/qnaList">문의 게시판</a></li>  
                              	  </ul>
                           		</li>	                            		
                              		<c:if test="${member.grade ==3}">
                              		<li><a href="${pageContext.request.contextPath}/admin/adminPage">관리자</a></li>
                              		</c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Area End -->