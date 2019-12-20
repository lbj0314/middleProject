<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../layout/menu/bootStrap.jsp" />
</head>
<body>
	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<c:import url="../layout/restaurant/header.jsp" />
	<c:import url="../layout/restaurant/selectArea.jsp" />
	<c:import url="../review/reviewWrite.jsp"></c:import>
	<c:import url="../review/reviewList.jsp" />
	<c:import url="../layout/restaurant/footer.jsp" />
</body>
</html>