<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.reply{
	background-color: #fff;
    color: #131230;
    border: 1px solid #eee;
    padding: 5px 18px;
    display: block;
    font-weight: 600;
    transition: .5s;
    height: 350px;
    width: 638px;
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

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#allmember">회원관리</a></li>
			<li><a data-toggle="tab" href="#franchising">기업주 관리</a></li>
			<li><a data-toggle="tab" href="#notice">공지 게시판 관리</a></li>
			<li><a data-toggle="tab" href="#qna">질문 게시판 관리</a></li>
		</ul>

		<div class="tab-content container" style="height: 500px; background-color: gray;">
			<div id="allmember" class="tab-pane fade in active">
				<div>
					<h3 herf="./allmember">allmember</h3>
				</div>
			</div>
			<div id="franchising" class="tab-pane fade">
				<div>
					<h3 herf="#">franchising</h3>
				</div>
			</div>			
			<div id="notice" class="tab-pane fade">
				<div>
					<h3 herf="../notice/noticeList">notice</h3>
				</div>
			</div>
			<div id="qna" class="tab-pane fade">
				<div>
					<h3 herf="../qna/qnaList">qna</h3>
				</div>
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
