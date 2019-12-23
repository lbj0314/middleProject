<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                              <li><a href="#">My Page</a>
                                <ul class="sub-menu">                                                             		                             	
                               		  <li><a href="${pageContext.request.contextPath}/member/memberMylist">마이페이지</a></li>                                   
                                    <li><a href="${pageContext.request.contextPath}/member/memberMypage">예약확인하기</a></li>
                                     <li><a href="${pageContext.request.contextPath}/member/memberLogout">Logout</a></li>                               
                                </ul>
                            </li>    
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
                    <h1><i>Club Foodfun</i></h1>
                    <a href="index.html">home</a>
                    <span class="mx-2">/</span>
                    <a href="blog-details.html">blog details</a>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->