<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/review/review.css">


</head>
<body>


<div class="comments-area col-lg-7 col-md-7" style="margin: 0 auto">

	<div class="comment-list">
		<form action="../review/reviewWrite" method="post" id="frm">
		<input type="hidden" id="member_num" name="member_num" value="${member.member_num}">
		<input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">

			<c:if test="${ not empty member  }">
				<input type="text" id="writer" name="writer" value="${member.name}" readonly="readonly">
				<select name="score" id="score">
					<option value="1">★☆☆☆☆</option>
					<option value="2">★★☆☆☆</option>
					<option value="3">★★★☆☆</option>
					<option value="4">★★★★☆</option>
					<option value="5">★★★★★</option>
				</select>
			</c:if>
			<div class="single-comment justify-content-between d-flex">
				<br>
				<textarea id="contents" name="contents"
					placeholder="리뷰 작성"
					style="width: 100%; max-height: 100px; min-height: 100px; margin: 5px 0; background-color: white;"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '리뷰 작성'"
					required class="single-input"></textarea>


				<!-- session member, memberVO -->
				<div class="reply-btn">
					<%-- <c:if test="${ not empty member  }"> --%>
					<button type="submit" class="btn-reply text-uppercase">REPLY</button>
					<%-- </c:if> --%>
				</div>
			</div>
		</form>
	</div>

</div>

<div id="review_write_form">
<!-- <div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
  </div> -->

 	<ul id = "review_write_score">
 	
		<li class="reviewpicker_item">
			<div class="review_score_button" id = "bad_btn">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg"				
				onclick="this.src='https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_active_face.svg'"
				id="dudwo123wjs"/>
				<span class = "reviewpicker_label" id="dudwo321wjs">: 최고</span>
			</div>
		</li>
		
		<li class="reviewpicker_item">
			<div class="review_score_button" id = "bad_btn">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg"				
				onclick="this.src='https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_active_face.svg'"
				id="dudwo321wjs"/>
				<span class = "reviewpicker_label" id="dudwo321wjs">: 보통</span>
			</div>
		</li>	
		
		<li class="reviewpicker_item">
			<div class="review_score_button" id = "bad_btn">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg"				
				onclick="this.src='https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_active_face.svg'"
				id="dudwo231wjs"/>
				<span class = "reviewpicker_label" id="dudwo321wjs">: 최악</span>
			</div>
		</li>
	
	</ul> 

<textarea id="review_editor" 
	placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
	maxlength="10000" 
	required class="single-input"></textarea>
<button class ="genric-btn primary" id= "review_btn">리뷰쓰기</button>


</div>








<script type="text/javascript">

// $(document).ready(function () {
// });
    var to1 = true;
    $("#dudwo123wjs").on('click',function () {
        if (!to1) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            to1 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_active_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");            
            
            to1 = false;
        }

        $("#panel").slideToggle("slow");
    });
    var to2 = true;
    $("#dudwo321wjs").on('click',function () {
        if (!to2) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            to2 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_active_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            
            to2 = false;
        }

        $("#panel").slideToggle("slow");
    });
    var to3 = true;
    $("#dudwo231wjs").on('click',function () {
        if (!to3) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            to3 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_active_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            
            to3 = false;
        }

        $("#panel").slideToggle("slow");
    });
</script>


</body>
</html>


