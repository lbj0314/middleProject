<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class="form-horizontal" role="form" id="reservation"
				name="reservation" method="POST">
	<!-- 예약 등록시 적용해야하는 변수들 -->
				<input type="hidden" name="member_num" id="member_num" value="${member.member_num}">
				<input type="hidden" name="member_name" id="member_name" value="${member.name}">
					<input type="hidden" name="rev_time" id="rev_time" value="${param.rev_time}">
				<input type="hidden" name="rest_name" id="rest_name" value="${param.rest_name}">		
				<input type="hidden" name="rest_num" id="rest_num" value="${vo.rest_num}">
				<input type="hidden" name="table_num" id="table_num" value="${param.table_num}"> 
					<input type="hidden" name="rev_date" id="rev_date" value="${param.rev_date}">
				<button id="btn"></button>
</form>
<script type="text/javascript">
	$("#btn").click(function() {
		reservation.action = "./reservationWrite";
		reservation.submit();
	}
</script>
</body>
</html>