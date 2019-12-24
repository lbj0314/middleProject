<
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Favicon -->
<link rel="shortcut icon" href="resources/images/logo/favicon.png"
	type="image/x-icon">

<!-- Preloader Starts -->
<div class="preloader">
	<div class="spinner"></div>
</div>
<!-- Preloader End -->

<!-- Header Area Starts -->
<header class="header-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="logo-area">
					<a href="./"><img src="resources/images/logo/logo.png"
						alt="logo"></a>
				</div>
			</div>
			<div class="col-lg-10">
				<div class="custom-navbar">
					<span></span> <span></span> <span></span>
				</div>
				<div class="main-menu">
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
