<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/notice/header.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/notice/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
<div class="container">
	<div id="drm">
	<form action="./noticeUpdate" method="post">
			<input type="hidden" id="id" name="id" value="${vo.id}">
		<div class="form-group">
			<label for="title">Title : </label> 
			<input type="text" name="title"
				class="form-control" id="title" placeholder="Enter title" value="${vo.title}">
			<input type="hidden" name="notice_num" value="${vo.notice_num}">
		</div>
		<div class="form-group">
			<label for="title">Writer : </label> 
			<input type="text" name="writer"
				class="form-control" id="writer" value="${member.id}" readonly="readonly">
		</div>
		<div class="form-group">
			<label for="contents">Contents : </label>
			<textarea rows="20" cols="" name="contents" class="form-control"
				id="contents" placeholder="Enter contents">${vo.contents}</textarea>
		</div>
	

		<button type="submit" class="btn btn-default" 
		style="color: #fff; background: #f8b600; border: 1px solid transparent;">Update</button>
	</form>
	</div>
</div>	
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<!--=============== footer =================-->
	<c:import url="../layout/notice/footer.jsp" />

<script type="text/javascript">
		
	</script>			
</body>
</html>
