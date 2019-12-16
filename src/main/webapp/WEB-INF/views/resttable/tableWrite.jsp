<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurant Write</title>
<c:import url="../layout/restaurant/bootStrap.jsp"/>
<c:import url="../layout/summernote.jsp"/>
<style type="text/css">
#write-div {
	margin: 0 auto;
	max-width: 100%;
}

#btn-form {
	margin-top: 50px;
	text-align: center;
}
.rest{
display:block;
width:100%;
line-height:40px;
border:none;
outline:none;
background:#f9f9ff;
padding:0 20px
}

</style>
</head>
<body>

	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	<c:import url="../layout/restaurant/header.jsp" />
	
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8" id="write-div">
				<h3 class="mb-30 title_color">Table Write</h3>
				<form action="./tableWrite" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">
					<input type="hidden" id="member_num" name="member_num" value="${member.member_num}">
					<div class="mt-10">
						<input type="text" id="table_user" name="table_user" placeholder="테이블에 앉을 최대 인원 수"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '테이블에 앉을 최대 인원 수'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" id="quantity" name="quantity" placeholder="테이블의 수"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '테이블의 개수'" required
							class="single-input">
					</div>
					<h3 class="mb-30 title_color">Break Time이 있을 경우 나눠서 기재</h3>
					<div class="mt-10">
						<input type="text" id="open_time1" name="open_time1" placeholder="오픈 시간1"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'open time1'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" id="close_time1" name="close_time1" placeholder="마감 시간1"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '테이블의 개수'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" id="open_time2" name="open_time2" placeholder="오픈 시간2"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = 'open time1'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" id="close_time2" name="close_time2" placeholder="마감 시간2"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '테이블의 개수'" required
							class="single-input">
					</div>
				
				<!-- session member, memberVO -->
				<div class="mt-10">
					<c:if test="${ not empty member  }">
						<button type="submit" class="genric-btn primary">WRITE</button>
					</c:if>
				</div>
			</form>
			</div>
		</div>
	</div>

	<c:import url="../layout/restaurant/footer.jsp" />
	
</body>
</html>