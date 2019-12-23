<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<div class="container">
		<div id="drm">
		<form class="form-horizontal" action="./qnaReply" method="post" enctype="multipart/form-data">
		

			<input type="hidden" class="form-control" id="num" name="qna_num" readonly="readonly" value="${vo.qna_num }">
			<input type="hidden" class="form-control" id="hit" name="hit" readonly="readonly" value="${vo.hit }">
			<input type="hidden" class="form-control" id="ref" name="ref" readonly="readonly" value="${vo.ref }">
			<input type="hidden"class="form-control" id="step" name="step" readonly="readonly" value="${vo.step }"> 
			<input type="hidden" class="form-control" id="depth" name="depth" readonly="readonly" value="${vo.depth }">

		
				<div class="form-group">
					<label for="title">Title : </label> 
					<input type="text" name="title" class="form-control ipt" id="title" placeholder="Enter title">
					<input type="hidden" name="id" value="${member.id}">
				</div>

				<div class="form-group">
					<label for="writer">Writer : </label>
					<input type="text" name="writer" class="form-control ipt" id="writer" placeholder="Enter writer" value=" ${member.id}" readonly="readonly">
				</div>

				<div class="form-group">
					<label for="contents">Contents : </label>
					<textarea rows="30" cols="50" name="contents" class="form-control ipt" id="contents" placeholder="Enter contents"></textarea>
	
				</div>


				<button class="btn btn-info" id="btn" 
				style="color: #fff; background: #f8b600; border: 1px solid transparent;">저장하기</button>
			</form>


	</div>
</div>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->	
	<!--=============== footer =================-->
	<c:import url="../layout/footer.jsp" />
</body>
</html>
