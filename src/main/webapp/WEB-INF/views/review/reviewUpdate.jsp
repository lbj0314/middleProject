<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/review/review.css">

    <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

 
    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/animate-3.7.0.css">
    <link rel="stylesheet" href="../resources/css/font-awesome-4.7.0.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.1.3.min.css">
    <link rel="stylesheet" href="../resources/css/owl-carousel.min.css">
    <link rel="stylesheet" href="../resources/css/jquery.datetimepicker.min.css">
    <link rel="stylesheet" href="../resources/css/style.css">
    <link rel="stylesheet" href="../resources/css/nice-select.css">
    <link rel="stylesheet" href="../resources/fonts/flat-icon/flaticon.css">
    
    <!-- Javascript -->
    <script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
	<script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
    <script src="../resources/js/vendor/wow.min.js"></script>
    <script src="../resources/js/vendor/owl-carousel.min.js"></script>
    <script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
    <script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
    <script src="../resources/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<body>



	<div id="review_write_form" style="width: 700px; margin-top: 50px">

		<div class="comment-list">
			<form action="./reviewUpdate" method="post" name="frm">
			
				<input type="hidden" id="member_num" name="member_num"value="${member.member_num}">
				 <input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">
				 <input type="hidden" id="review_num" name="review_num" value="${vo.review_num}">

				
					<input type="text" id="writer" name="writer" value="${member.name}"
						readonly="readonly" style="margin-left: 20px; border: none;">
					
		 		<select name="score" id="score">
						<option value="1" <c:if test="${vo.score == 1}">selected</c:if>>★☆☆☆☆</option>
						<option value="2" <c:if test="${vo.score == 2}">selected</c:if>>★★☆☆☆</option>
						<option value="3" <c:if test="${vo.score == 3}">selected</c:if>>★★★☆☆</option>
						<option value="4" <c:if test="${vo.score == 4}">selected</c:if>>★★★★☆</option>
						<option value="5" <c:if test="${vo.score == 5}">selected</c:if>>★★★★★</option>
					</select> 
	


			<textarea class="review_editor" name = "contents" 
					placeholder="" maxlength="10000" 
					required class="single-input" id="contents">${vo.contents}</textarea> 
			
				<button class="genric-btn primary" id="review_update_btn">확인</button>
				 <input type="button" class="genric-btn primary danger" onclick="window.close()" value="취소"> 
		</form>
				
		</div>
	</div>

<script type="text/javascript">

 			
	  	$('#review_update_btn').click(function() {
	  		
 			var member_num = $('#member_num').val();
 			var rest_num = $('#rest_num').val();
 			var review_num = $('#review_num').val();
 			var writer = $('#writer').val();
 			var sccore = $('#score').val();
 			var contents = $('#contents').val();
 		
 		var allData= {"member_num":member_num, "rest_num":rest_num, "review_num":review_num, "writer":writer, "score":score, "contents":contents}
 		
 				
 			$.ajax({
 				url: "reviewUpdate",
 				type: "post",
 				data:  {"member_num":member_num, "rest_num":rest_num, "review_num":review_num, "writer":writer, "score":score, "contents":contents},
 				success:function(data){
 					alert('댓글이 수정되었습니다.');
 					window.close();
 					opener.document.location.reload();
 					
 					
 				},error:function(){
 					alert('댓글 수정에 실패하였습니다.')
 					
 				}
				
 			}); 

	}); 
</script>




</body>
</html>
