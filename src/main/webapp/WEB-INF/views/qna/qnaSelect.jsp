<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/qna/header.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/qna/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
<div class="container">
	<table class="table">
			
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>회원 번호</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			
			<tr>
				<td>${vo.qna_num } </td>
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
		<c:if test="${member.id == vo.id or member.id == 'admin'}">
			<a href="./${board}qnaUpdate?qna_num=${vo.qna_num }" class="btn btn-info" 
			style="color: blue; background: #f8b600; border: 1px solid transparent;">수정</a>
			
			<a href="./${board}qnaDelete?qna_num=${vo.qna_num }" class="btn btn-info"
			style="color: red; background: #f8b600; border: 1px solid transparent;">삭제</a>
			
			<a href="./${board}qnaReply?qna_num=${vo.qna_num }" class="btn btn-info"
			style="color: green; background: #f8b600; border: 1px solid transparent;">답글 달기</a>
		</c:if>
			
			<a href="./${board}qnaList" class="btn btn-info" 
			style="color: black; background: #f8b600; border: 1px solid transparent;">목록</a>

		</div>
	</div>
	
	
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->	
	<!--=============== footer =================-->
	<c:import url="../layout/qna/footer.jsp" />
	<script type="text/javascript">

	</script>
		
</body>
</html>
