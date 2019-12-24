<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <li class="active"><a href="${pageContext.request.contextPath}/">home</a></li>
                            <li><a href="${pageContext.request.contextPath}/restaurant/restList">restaurant</a></li>
                              <li><a href="${pageContext.request.contextPath}/notice/noticeList">notice</a></li>
                            <li><a href="${pageContext.request.contextPath}/qna/qnaList">Q&A</a></li>
                        <c:choose>
							<c:when test="${not empty member}">
								<li><a href="${pageContext.request.contextPath}/member/memberMylist">MyPage</a></li>
									<c:if test="${member.grade ==3}">
                              			<li><a href="${pageContext.request.contextPath}/admin/adminPage">Admin</a></li>
                              		</c:if>
								<li><a href="${pageContext.request.contextPath}/member/memberLogout">LogOut</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/member/memberJoin">Sign In</a></li>
								<li><a href="${pageContext.request.contextPath}/member/memberLogin">Sign Up</a></li>
							</c:otherwise>
						</c:choose>
					
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
                    <h1 style="color: white;"><i>관리자 페이지입니다.</i></h1>
                   
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Area End -->