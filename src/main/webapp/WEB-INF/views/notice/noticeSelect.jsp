<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/notice/header.jsp"></c:import>
</head>
<body>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
<div class="container">

	<table class="table">		
			<tr>
				<th>공지</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			
			<tr>
				<td>${vo.title }</td>
				<td>${vo.id }</td>
				<td>${vo.reg_date }</td>
				<td>${vo.hit } </td>
			</tr>				
	</table>
	
	
	<div>
		<textarea rows="30" cols="154" readonly="readonly">${ vo.contents } </textarea>
	</div>	
	
		<div>
		<c:if test="${member.grade ==3}">
			<a href="./noticeUpdate?notice_num=${vo.notice_num }" class="btn btn-info"
			style="color: blue; background: #f8b600; border: 1px solid transparent;">수정</a>
			
			<a href="./noticeDelete?notice_num=${vo.notice_num }" class="btn btn-info"
			style="color: red; background: #f8b600; border: 1px solid transparent;">삭제</a>
			
		 </c:if> 
			<a href="./noticeList" class="btn btn-info"
			style="color: black; background: #f8b600; border: 1px solid transparent;">목록</a>
		</div>
	</div>
	
	
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<!--=============== footer =================-->
	<c:import url="../layout/notice/footer.jsp" />
	
</body>
</html>
