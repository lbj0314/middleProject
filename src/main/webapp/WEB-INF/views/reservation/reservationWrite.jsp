<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
		 <div class="section">
		      <div class="container">
		      <form role="form" id="fgoreservation" name="fgoreservation"  method="POST">
				 <div class="row">
					<h2>예 약</h2>
					<h5>(예약 날짜를 선택해서 테이블보기를 눌러 주세요.)</h5>
					<br><br>
					<h4>예약 날짜 설정</h4>
					<div class="form-group">  
					
						 <div class="col-md-5 text-left">
							
							<input type="date" class="form-control" id="frev_date" name="frev_date">
							     
							<br>
						 	<a class="btn btn-default" onclick="freservation()">테이블 보기</a>
						 </div>
						 <div class="col-md-5 text-left">
						 영업시간 : ${vo.rest_time }
						 </div>
					 </div>
				</div>	 			
				<!-- 예약 등록시 적용해야하는 변수들 -->
       			<input type="hidden" name="rest_num" id="rest_num" value="${vo.rest_num}">
			 </form> 
			 </div>  
		</div>

<script type="text/javascript">
	
var freservation=function(){
	
	if(!fgoreservation.frev_date.value)
	{
		alert("날짜를 입력하세요.");
		fgoreservation.frev_date.focus();
		return;
	}
		fgoreservation.action="../layout/reservation/Calendar?rest_num=${rest_num}";
		fgoreservation.submit();
}
	
</script>