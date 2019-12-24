<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurant Reservation</title>
<c:import url="../layout/reservation/bootStrap.jsp" />
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	<c:import url="../layout/reservation/header.jsp" />
		 <div class="section">
		      <div class="container">
		      <form role="form" id="fgoreservation" name="fgoreservation"  method="POST">
				 <div class="row" style="height: 200px;">
					<div clss="1">
					<h5>예약 날짜를 선택해서 테이블보기를 눌러 주세요.</h5>
					</div>
					<div class="form-group">  

						 <div class="input-group mb-3">
						<div class="input-group-prepend">
                              <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                            </div>
							<input type="date" class="form-control" id="rev_date" name="rev_date">
						 </div>
						 	<a class="genric-btn primary" onclick="freservation()" style="font-style: italic;">테이블 보기</a>
					 </div>
				</div>	 			
				<!-- 예약 등록시 적용해야하는 변수들 -->
       			<input type="hidden" name="rest_num" id="rest_num" value="${vo.rest_num}">
			 </form> 
			 </div>  
		</div>
<c:import url="../layout/reservation/footer.jsp" />
<script type="text/javascript">
	
var freservation=function(){
	
	if(!fgoreservation.rev_date.value)
	{
		alert("날짜를 입력하세요.");
		fgoreservation.rev_date.focus();
		return;
	}
		fgoreservation.action="./calendar?rest_num=${vo.rest_num}";
		fgoreservation.submit();
}
	
</script>