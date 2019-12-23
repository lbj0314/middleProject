<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
<c:import url="../layout/summerNote.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<div class="container">
		<div id="drm">

	<form action="./${qna}Write" method="post" enctype="multipart/form-data" id="frm" onsubmit="">
		
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
<!-- --------------------------------------------------------------------- -->	
<!--=============== footer =================-->
<c:import url="../layout/footer.jsp" />

<script type="text/javascript">
	$("#btn").click(function() {
		var check = true;
		$(".ipt").each(function() {
			if($(this).val() == "" ){
				alert("입력값을 넣으세요");
				$(this).focus();
				check = false;
			}
			if(check){
				function go() {
					$("#frm").submit();
				}
			}
		});
	});
	
// 	$("#contents").summernote({
// 		height : 150,
// 	});
	
	
</script>
</body>
</html>