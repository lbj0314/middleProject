<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Welcome Area Starts -->
    <section class="welcome-area section-padding2">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 align-self-center">
                    <div class="welcome-img">
                        <img src="./resources/images/welcome-bg.png" class="img-fluid" alt="">
                    </div>
                </div>
                <div class="col-md-6 align-self-center">
                    <div class="welcome-text mt-5 mt-md-0">
                        <h3><span class="style-change">welcome</span> <br>to food fun</h3>
                        <p class="pt-3">빅데이터로 내 취향에 맞는 맛집을 골라주는 맛집 '망고플레이트'는 광고와 홍보 글 없이 뜨는 맛집과 핫플레이스를 모두 볼 수 있어서 믿을만한 맛집 어플로 주목받고 있습니다.</p>
                        <p>언제 어디서나 맛집을 쉽고 빠르게 검색할 수 있는 망고플레이트, 앱에서도 확인해보세요!</p>
                        <c:if test= "${empty member}">
                        <a href="${pageContext.request.contextPath}/member/memberJoin" class="template-btn mt-3">회원가입</a>                      	
                        <a href="${pageContext.request.contextPath}/member/memberLogin" class="template-btn mt-3" id = "home_login_btn">로그인</a>
                  		</c:if>
                  		<c:if test="${member.grade ==3}">
                  		<a href="./admin/adminPage" class="template-btn mt-3" >관리자 페이지 이동</a>
                  		</c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Welcome Area End -->