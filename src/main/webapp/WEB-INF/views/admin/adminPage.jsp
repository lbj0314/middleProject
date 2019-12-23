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



</style>

<c:import url="../layout/admin/header.jsp"></c:import>

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

	<div class="container" style="height: 700px;">

		<div class="nav nav-tabs ">
			<a class="test" data-toggle="tab" href="#allmember"><button class="genric-btn primary-border">회원관리</button></a>
			<a data-toggle="tab" href="#franchising"><button class="genric-btn primary-border">기업주 관리</button></a>
			<a data-toggle="tab" href="#notice"><button class="genric-btn primary-border">공지 게시판 관리</button></a>
			<a data-toggle="tab" href="#qna"><button class="genric-btn primary-border">문의 게시판 관리</button></a>
		</div>

		<div class="tab-content container " style="height: 500px; background-color: #EEEEEE;">
			<div id="allmember" class="tab-pane fade in active">
					<div>
					<a href="${pageContext.request.contextPath}/admin/allmember"><button class="genric-btn primary-border">회원 목록</button></a>	
					</div>	
					<div style="width:1080px; height:450px; text-align: center; background-color: white;">
	

		

					
					</div>
            			
				</div>					
			</div>
			
			
			<div id="franchising" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/"><button class="genric-btn primary-border">가맹주 목록</button></a>	
				</div>
				<div style="width:1080px; height:250px; text-align: center; background-color: white;">222</div>	
			</div>	
			
					
			<div id="notice" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/notice/noticeList"><button class="genric-btn primary-border">공지 게시판</button></a>	
				</div>
				<div style="width:1080px; height:250px; text-align: center; background-color: white;">333</div>	
			</div>
			
			
			<div id="qna" class="tab-pane fade">
				<div>
					<a href="${pageContext.request.contextPath}/qna/qnaList"><button class="genric-btn primary-border">문의 게시판</button></a>	
				</div>
				<div style="width:1080px; height:250px; text-align: center; background-color: white;">444</div>	
			</div>
			
			
		</div>
	</div>




	<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<!--=============== footer =================-->
	<c:import url="../layout/admin/footer.jsp" />
	

</body>
</html>
