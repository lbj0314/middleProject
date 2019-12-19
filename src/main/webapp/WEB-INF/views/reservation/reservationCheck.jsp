<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Reservation Check</title>
<c:import url="../layout/restaurant/bootStrap.jsp" />
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	<c:import url="../layout/restaurant/header.jsp" />
	<div class="container">

		<%-- <input type="hidden" name="member_num" value="${rest.member_num}"> --%>
		<table class="table ">

			<tr>
				<!-- <th><input type="checkbox" class="primary-checkbox"
					name="allCheck" id="allCheck"> <strong>전체선택</strong></th> -->
				<th>예약 번호</th>
				<th>가게 이름</th>
				<th>예약자명</th>
				<th>테이블 번호</th>
				<th>예약 날짜</th>
				<th>예약 시간</th>
				<th>예약자 전화 번호</th>
				<th>예약자 이메일</th>
				<th>예약 취소</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<%-- <td><input type="checkbox" class="primary-checkbox check"
						name="check" id="check${vo.rev_num}" value="${vo.rev_num}"></td> --%>
					<td>${vo.rev_num}</td>
					<td>${vo.rest_name}</td>
					<td>${vo.member_name}</td>
					<td>${vo.table_num}</td>
					<td>${vo.rev_date}</td>
					<td>${vo.rev_time}</td>
					<td>${vo.tel}</td>
					<td>${vo.email}</td>
					<%-- <td><button type="button"
							class="genric-btn danger delete${vo.rev_num}e
							data-rev_num="${vo.rev_num}">취소</button></td> --%>
					<td><a class="genric-btn danger" href="./reservationDelete?rev_num=${vo.rev_num}">취소</a></td>
				</tr>
			</c:forEach>
		</table>
		<%-- <div>
			<!-- session member, memberDTO -->
			<c:if test="${member.member_num eq rest.member_num}">
				<input type="button" value="SELECT DELETE" class="genric-btn danger"
					id="selectDelete"></input>
			</c:if>
		</div> --%>

	</div>
	<c:import url="../layout/restaurant/footer.jsp" />

	<script type="text/javascript">
	/* 	$("#allCheck").click(function() {

			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		});
		$(".check").click(function() {
			$("#allCheck").prop("checked", false);
		});
		var rev_num = '${rev.rev_num}';
		$(".delete"+rev_num).click(function() {
			var confirm_val = confirm("정말 삭제하시겠습니까?");

			if (confirm_val) {
				var checkArr = new Array();

				checkArr.push($(this).attr("data-rev_num"));

				$.ajax({
					url : "/reservation/reservationDelete",
					type : "post",
					data : {
						check : checkArr
					},
					success : function() {
						location.href = "/reservation/reservationCheck";
					}
				});
			}
		}); */
	</script>
</body>
</html>