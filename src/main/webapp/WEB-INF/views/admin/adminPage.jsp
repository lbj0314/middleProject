<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.genric-btn.primary-border {
    color: #f8b600;
    border: 1.5px solid #f8b600;
    background: #fff;
    font-weight: 500;  
}
#aaa{

}


</style>

<c:import url="../layout/admin/header.jsp"></c:import>
<c:import url="../layout/admin/bootStrap.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
<script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
<script src="../resources/js/vendor/wow.min.js"></script>
<script src="../resources/js/vendor/owl-carousel.min.js"></script>
<script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
<script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
<script src="../resources/js/main.js"></script>
</head>
<body>
	<c:import url="../layout/admin/header_area.jsp"></c:import>
	<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">	
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	<h4 style="text-align: center; font: 700 28px NEXON Gothic; color: #17191d;">관리자 페이지</h4>
	
	</div>	
<!-- ------------------------------------------------------------------------ -->

			<!-- <a href="./allmember">회원 관리</a> -->

	<div class="container" style="height: 700px; width: 1200">

		<div class="nav nav-tabs ">
			<a class="test" data-toggle="tab" href="#allmember"><button class="genric-btn primary-border">회원관리</button></a>
			<a data-toggle="tab" href="#franchising"><button class="genric-btn primary-border">기업주 관리</button></a>
			<a data-toggle="tab" href="#notice"><button class="genric-btn primary-border">공지 게시판 관리</button></a>
			<a data-toggle="tab" href="#qna"><button class="genric-btn primary-border">문의 게시판 관리</button></a>
		</div>

		<div class="tab-content container " style="height: 600px; background-color: #EEEEEE;">
			<div id="allmember" class="tab-pane fade in active">
					<div>
					<a href="${pageContext.request.contextPath}/admin/allmember"><button class="genric-btn primary-border">회원 목록 수정하기</button></a>	
					</div>	
					<div style="width:1150px; height:550px;  background-color: white;">
<!-- ------------------------------------------------------------------------------------------------------- -->
<div class="container">
	<c:if test="${member.grade ==3}">
	<table class="table ">

								<tr>
									<th>아이디</th>
									<th>패스워드</th>
									<th>이름</th>
									<th>이메일</th>
									<th>전화번호</th>
									<th>가입 날짜</th>
									<th>등급</th>

								</tr>
								<c:forEach items="${list2}" var="vo" varStatus="c">
									<tr>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.id }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.pw }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.name }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.email }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.tel }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="1" end="1"></c:forEach>
											</c:catch> ${ vo.joindate }</td>
										<!-- ------------------- -->
										<td><c:catch>
												<c:forEach begin="2" end="${ vo.depth }"></c:forEach>
											</c:catch> ${ vo.grade }</td>
										<!-- ------------------- -->
									</tr>
								</c:forEach>

							</table>

<!-- 페이징 -->
		<div>
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1 }">

					<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${ pager.curBlock lt pager.totalBlock }">
				<li><span id="${pager.lastNum + 1 }" class="list ">다음</span></li>
				</c:if>
			</ul>
		</div><!--페이징 처리 -->				
	</c:if>
</div><!-- 출력문 s박스 container -->
<!-- ------------------------------------------------------------------------------------------------------- -->					
					</div> <!-- b출력박스 -->         			
				</div>	<!-- allmember -->				
			
			
			<div id="franchising" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/"><button class="genric-btn primary-border">가맹주 수정하기</button></a>	
				</div>
				<div style="width:1150px; height:550px; text-align: center; background-color: white;">
				222
				</div>	
			</div>	<!-- franchising -->
			
					
			<div id="notice" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/notice/noticeList"><button class="genric-btn primary-border">공지 게시판 수정하기</button></a>	
				</div>
				<div style="width:1150px; height:550px; background-color: white;">
				<br>
				<h5 style="font: bold;">현재 게시판 현황</h5>
				<br>
				현재 공지 게시판 등록 수 : 19개
				<br>
				<br>
				<h5  style="font: bold;">게시판 등록 예정 목록</h5>
				<br>
				<h5>공지 예정 : 12/25(수) 농협은행 체크카드 결제 서비스 점검 안내</h5>
				<br>
				<h5>▣ 점검시간과 작업영향</h5>
				<br>
				<br>
				- 12월 14일(토) 오전 1시 ~ 오전 4시 (3시간)
				<br>
				<br>
   			     : 전북은행 체크카드 결제 서비스를 이용할 수 없습니다.
				<br>
				<br>
				안내 드리는 내용 참고하셔서 이용에 불편 없으시길 바랍니다.
				<br>
				<br>
				감사합니다
				<br>
				<br>
				</div>	
			</div><!-- notice -->
			
			
			<div id="qna" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/qna/qnaList"><button class="genric-btn primary-border">문의 게시판 수정하기</button></a>	
				</div>
				<div style="width:1150px; height:550px; text-align: center; background-color: white;">
				<br>
				<br>
				<h5  style="font: bold;">FoodFun 이용정책 현황</h5>
				<br>
				<br>
				<br>
				<a href="${pageContext.request.contextPath}/notice/noticeTermsofUse"><button class="genric-btn primary-border">▣ 이용약관</button></a>
				<br>
				<br>
				<a href="${pageContext.request.contextPath}/notice/noticeNonmemberUserPolicy"><button class="genric-btn primary-border">▣ 비회원 이용자 이용정책</button></a>
				<br>
				<br>
				<a href="${pageContext.request.contextPath}/notice/noticePrivacyPolicy"><button class="genric-btn primary-border">▣ 개인정보 처리 방침</button></a>
				<br>
				<br>
				<a href="${pageContext.request.contextPath}/notice/noticeLocationBasedServiceTerms"><button class="genric-btn primary-border">▣ 위치기반서비스 이용약관</button></a>
				<br>
				<br>
				<a href="${pageContext.request.contextPath}/notice/noticeCommunityGuidelines"><button class="genric-btn primary-border">▣ 커뮤니티 가이드라인</button></a>
				<br>
				</div>	
			</div><!-- qna -->
			
			</div>
			
		</div><!-- boos box -->



	<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<!--=============== footer =================-->
	<c:import url="../layout/admin/footer.jsp" />
	

</body>
</html>
