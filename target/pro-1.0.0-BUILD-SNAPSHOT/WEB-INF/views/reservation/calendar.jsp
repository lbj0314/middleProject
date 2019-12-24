<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurant Reservation List</title>
<style type="text/css">
#a{
	margin: 0 auto;
}
</style>
<c:import url="../layout/restaurant/bootStrap.jsp" />
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	<c:import url="../layout/restaurant/header.jsp" />

	<div class="section">

		<div class="container">
			<form class="form-horizontal" role="form" id="goreservation"
				name="goreservation" method="POST">

				<div class="row">
					<span>
						<h5>표시된 시간은 예약가능 시작 시간입니다. 1시간 단위로 테이블을 선택해 예약하실 수 있습니다.</h5>
						<h5>ex) 10:00 -> 10:00 ~ 11:00</h5>
					</span> <br>
					<div class="form-group" id="a">
						<h5>예약 날짜 :</h5>
						<div class="col-md-8 text-left">
							<input type="date" class="form-control" id="rev_date"
								name="rev_date" value="${param.rev_date}" style="font-size: 16px" readonly>
						</div>
						<div class="col-md-4 text-left">
							<a class="genric-btn info-border"
								href="./reservationForm?rest_num=${param.rest_num}">되돌아가기</a>
						</div>

						<div class="col-md-3">
							<a class="genric-btn success-border">예약 O</a>
						</div>
						<div class="col-md-3">
							<a class="genric-btn danger">예약 X</a>
						</div>

					</div>

				</div>
				<!-- 테이블 보여주기 -->
				<div class="row">


					<!-- 테이블 정보 보여주는 for -->
					<c:forEach items="${table}" var="ta" varStatus="i">
						<div class="col-md-12">
							<h5>${ta.table_user}인용테이블&nbsp${i.count}</h5>
							<br>
							<!-- 시간을 보여주는 for -->
							<c:forEach items="${tarr}" var="t" varStatus="k">
								<!-- 등록된 테이블과 각 시간을 표현하는 테이블의 넘버가 같을 떄-->
								<c:if test="${t.table_num eq ta.table_num }">
									<!-- 출력 -->

									<!-- 날짜, 테이블번호, 예약 시간 -->
									<a id="i${k.index}" class="genric-btn success-border"
										onclick="reservation('${t.rev_time }','${t.table_num }')">
										${t.rev_time} </a>

									<c:forEach items="${table2}" var="ta2">
										<!-- 예약된 시간 -->
										<c:if
											test="${ta2.rev_date eq param.rev_date  and ta2.table_num eq t.table_num and ta2.rev_time eq t.rev_time}">

											<script type="text/javascript">
									
										$('#i${k.index}').addClass('genric-btn danger').attr('onclick', '').unbind('click');
									</script>
										</c:if>
									</c:forEach>

								</c:if>
							</c:forEach>
						</div>
					</c:forEach>
				</div>

				<!-- 예약 등록시 적용해야하는 변수들 -->
				<input type="hidden" name="member_num" id="member_num"
					value="${member.member_num}"> <input type="hidden"
					name="member_name" id="member_name" value="${member.name}">
				<input type="hidden" name="rest_num" id="rest_num"
					value="${param.rest_num}">
				<%-- <input type="hidden" name="rest_name" id="rest_name" value="${param.rest_name}"> --%>
				<input type="hidden" name="table_num" id="table_num" value="${t.table_num}"> 
					<input type="hidden" name="rev_time" id="rev_time" value="${t.rev_time }">
				<!-- ----- -->
				<input type="hidden" name="name" id="name" value="${member.name}">
				<input type="hidden" name="email" id="email" value="${member.email}">
				<input type="hidden" name="tel" id="tel" value="${member.tel}">
				<!-- 다음 예약 내역 보여줄 폼 ->가게번호, 가게 위치 -->
				<%-- <input type="hidden" name="rest_tel" id="rest_tel" value="${vo.rest_tel}"> --%>
				<input type="hidden" name="rest_name" id="rest_name"
					value="${vo.rest_name}">

			</form>

		</div>

	</div>
	<c:import url="../layout/restaurant/footer.jsp" />
	<script type="text/javascript">
		var reservation = function(vtime, vtable) {

			if (!goreservation.rev_date.value) {
				alert("날짜를 입력하세요.");
				goreservation.rev_date.focus();
				return;
			}

			var yn = window.confirm(vtable + "번 테이블 " + vtime + "에 예약하십니까?");
			if (yn) {
				goreservation.table_num.value = vtable;
				goreservation.rev_time.value = vtime;
				goreservation.action = "./pay";
				goreservation.submit();
			}

		}
	
		

	</script>

</body>
</html>