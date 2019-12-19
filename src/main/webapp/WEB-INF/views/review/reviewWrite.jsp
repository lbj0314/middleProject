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
			<button class="btn"><div class="review_score_button">최고에요!</div></button>
			<button class="btn"><div class="review_score_button">괜찮아요.</div></button>
			<button class="btn"><div class="review_score_button">별로에요;</div></button>
		</li>
		



	
	</ul> 

<textarea id="review_editor" 
	placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
	maxlength="10000" 
	required class="single-input"></textarea>
<button class ="genric-btn primary" id= "review_btn">리뷰쓰기</button>


</div>
<!-- ------------reviewList 페이지 옮긴 부분---------------- -->
 <div class="comments-area col-lg-7 col-md-7" style="margin: 15px auto; background-color: white; border: " >
	<div class="comment-list">
		<div class="single-comment justify-content-between d-flex">
			<div id = "review_header">
				<div id = "review_ul_wrap">
				<ul id="review_header_ul">
					<li class="review_header_li">최신순</li>
					<li class="review_header_li">높은별점순</li>
					<li class="review_header_li">낮은 별점순</li>
				</ul>
				</div>
			</div>			
		</div> 
	</div> 
	
	<div id="review_wrapper">				
		<c:forEach items="${list}" var="r">	
		<article id="review">
		<div id = "review_info">
			<div id= "review_info_left">
				<div id = "review_writer">
					<span id = "review_writer_span">${r.writer}</span>
				</div>
				<div id = "review_score">				
				</div>
				<div id = "review_date">
					${r.reg_date}
				</div>
			</div>	
			
			
			<!-------------- 출력해야할 상자 start-------------->	
			<div id = "review_info_right">
			
				 <div id = "review_score_good" class="dudwo987wjs" type="text">
					<input id="btn_val" type="text">	
				 </div>				
			</div>	




					
		</div>
						
			<!-------------- 출력해야할 상자 end-------------->	
		 <div id = "review_contents">
					${r.contents}	
			</div> 
		</article>
		</c:forEach>
		
		
	</div>


<!-- ------------reviewList 페이지 옮긴 부분---------------- -->

<script type="text/javascript">


$('.btn').click(function(){
    var $obj = $('#btn_val');					
    var val = $obj.val();						
        $obj.val($(this).text());
});


    var to1 = true;
    $("#dudwo123wjs").on('click',function () {
    	
    	var score = $(this).attr('class');
    	//alert(score);
        if (!to1) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg"); 
            $(".dudwo987wjs").attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg")
           	//글자 색 변경(회색)
            $(".dudwo123wjs").css("color", "#CBCBCB");
            $(".dudwo231wjs").css("color", "#CBCBCB");
            $(".dudwo321wjs").css("color", "#CBCBCB");  
            $(".dudwo987wjs").css("color", "#CBCBCB");
            to1 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_active_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");    
            $('.dudwo987wjs').attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_active_face.svg")
           //글자색 변경(1번만 주황, 나머지 회색)
            $(".dudwo123wjs").css("color", "#ff7100");
            $(".dudwo231wjs").css("color", "#CBCBCB");
            $(".dudwo321wjs").css("color", "#CBCBCB");
            $(".dudwo987wjs").css("color", "#ff7100");
            to1 = false;
        }

        //$("#panel").slideToggle("slow");
    });
 
</script>


</body>
</html>


