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
	<%-- <div class="comments-area" id="mylist_area">
		<h4>My page</h4>
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
						<p class="comment">${member.id}</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="./memberDelete?id=${member.id}"
						class="btn-reply text-uppercase">탈퇴하기</a>
				</div>
			</div>
			<div class="desc" id="etc">
				<p class="date">가입날짜 : December 4, 2017 at 3:12 pm</p>
			</div>
		</div>
		<div class="comment-list left-padding">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="desc">
						<h5>
							<p>Name</p>
						</h5>
						<p class="comment">${member.name}</p>
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
						<p class="comment">${member.tel}</p>
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
						<p class="comment">${member.email}</p>
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
							<p class="comment">${member.reg_number}</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>


		<div id="post_btn">
			<a href="./memberUpdate?id=${member.id}#upd_area"
				class="genric-btn info">회원정보수정</a> <a href="../"
				class="genric-btn danger" id="danger_btn">Cancel</a>
		</div>
	</div> --%>
	
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
                                             
                        <div class="p-t-30">
                            <a href="./memberUpdate?id=${member.id}#upd_area" class="btn btn--radius btn--green" >수정</a>          
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

  
	<!--=============== footer =================-->
	<c:import url="../layout/footer.jsp" />

</body>
</html>
