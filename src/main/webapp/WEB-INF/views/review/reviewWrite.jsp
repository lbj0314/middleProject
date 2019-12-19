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
			<div class="review_score_button">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg"								
				id="dudwo123wjs" class="1 afkn100"/>
					<span class = "reviewpicker_label dudwo123wjs">최고입니다!</span>
			</div>
		</li>
		
		<li class="reviewpicker_item">
			<div class="review_score_button">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg"								
				id="dudwo321wjs" class="2 afkn100"/>
				<span class = "reviewpicker_label dudwo321wjs">보통입니다.</span>
			</div>
		</li>	
		
		<li class="reviewpicker_item">
			<div class="review_score_button">
				<img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg"				
				id="dudwo231wjs" class="3 afkn100"/>
				<span class = "reviewpicker_label dudwo231wjs">최악입니다;</span>
			</div>
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
			
				 <div id = "review_score_good" class="dudwo987wjs">
						<img alt="pink brand lipstick" 
						src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg">
				 </div>
				
					<span class = "reviewpicker_label dudwo987wjs">최고에요!</span>
				
			</div>	
			
			
			
			
			
						
		</div><!-- review_info  <= div박스 -->
						
			<!-------------- 출력해야할 상자 end-------------->	
		 <div id = "review_contents">
					${r.contents}	
			</div> 
		</article>
		</c:forEach>
		
		
	</div>
	
	
	
	
	
	
<%-- 	<c:forEach items="${list}" var="r">
		 <div class="row blog_item go_rivewSlect" id = "test" > 
                           <div class="col-md-3">
                               <div class="blog_info ">
                                    <ul class="blog_meta list text-right">
                                        <li><a >${r.writer}<i class="fa fa-user-o"></i></a></li>
                                        <li><a>${r.reg_date}<i class="fa fa-calendar-o"></i></a></li>
                                        <li><a>${r.score}<i class="fa fa-eye"></i></a></li>
                                        <li><a href="#">06 Comments<i class="fa fa-comment-o"></i></a></li> 
                                    </ul>
                                </div>
                           </div>
                            <div class="col-md-9" >
                                <div class="blog_post">     
                                    <img src="assets/images/blog/main-blog/m-blog-5.jpg" alt="">
                                    <div class="blog_details">
                                 	<a href="blog-details.html"><h4></h4></a>
                                        <p>${r.contents}</p>
                                    </div>
                                </div>
                            </div>
                             <!--            <a href="blog-details.html" class="template-btn" style="padding-right: 0px">더보기</a> -->
                </div> 
	</c:forEach> --%>
	
	
	
	
	
	
	<ul class="pagination justify-content-center" style="margin: 20px 0">
		<c:if test="${ pager.curBlock gt 1 }">

			<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
		</c:if>
		<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }"
			var="i">
			<li class="page-item"><span id="${i}"
				class="list genric-btn link">${i}</span></li>
		</c:forEach>
		<c:if test="${ pager.curBlock lt pager.totalBlock }">
			<li><span id="${pager.lastNum + 1 }" class="list">다음</span></li>
		</c:if>
	</ul>
</div>
<!-- ------------reviewList 페이지 옮긴 부분---------------- -->



<button class="btn">1</button>
<button class="btn">2</button>
<button class="btn">3</button>

<input id="btn_val" type="text">

<script type="text/javascript">


$('.btn').click(function(){
    var $obj = $('#btn_val');//대상을 변수 $obj에 설정						
    var val = $obj.val();//$obj의 value 값 추출							
//     if(val) {//$obj에 기존 value 값이 있다면
//         var arr = val.split(',');//기존값을 콤마로 분리하여 배열에 담기
//         arr.push($(this).text());//배열에 새로운 원소로 버튼 값을 추가
//         $obj.val(arr.join(','));//콤마로 합친 전체 문자열을 $obj의 value 값으로 
//     }
//     else {//$obj에 기존 value 값이 없다면
        $obj.val($(this).text());//버튼 값을 $obj의 value 값으로
//    }
    //alert($(this).text() + "(이)가 선택되었습니다.");
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
    
    var to2 = true;
    $("#dudwo321wjs").on('click',function () {
    	var score = $(this).attr('class');
    	//alert(score);
        if (!to2) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");  
            $(".dudwo987wjs").attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg")
          	//글자 색 변경(회색)
            $(".dudwo321wjs").css("color", "#CBCBCB");
            $(".dudwo231wjs").css("color", "#CBCBCB");
            $(".dudwo123wjs").css("color", "#CBCBCB");
            $(".dudwo987wjs").css("color", "#CBCBCB");
            to2 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_active_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo231wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            $(".dudwo987wjs").attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_active_face.svg")
            //글자색 변경(1번만 주황, 나머지 회색)
            $(".dudwo321wjs").css("color", "#ff7100");
            $(".dudwo231wjs").css("color", "#CBCBCB");
            $(".dudwo123wjs").css("color", "#CBCBCB");
            $(".dudwo987wjs").css("color", "#ff7100");
            to2 = false;
        }

        //$("#panel").slideToggle("slow");
    });
    
    var to3 = true;
    $("#dudwo231wjs").on('click',function () {
    	var score = $(this).attr('class');
    	//alert(score);
        if (!to3) {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $(".dudwo987wjs").attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg")
          	//글자 색 변경(회색)
            $(".dudwo231wjs").css("color", "#CBCBCB");
            $(".dudwo321wjs").css("color", "#CBCBCB");
            $(".dudwo123wjs").css("color", "#CBCBCB");
            $(".dudwo987wjs").css("color", "#CBCBCB");
            to3 = true;
        } else {
            $(this).attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_active_face.svg");
            $("#dudwo123wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg");
            $("#dudwo321wjs").attr("src", "https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_ok_face.svg");
            $(".dudwo987wjs").attr("src","https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_not_recommend_active_face.svg")
            //글자색 변경(1번만 주황, 나머지 회색)
            $(".dudwo231wjs").css("color", "#ff7100");
            $(".dudwo321wjs").css("color", "#CBCBCB");
            $(".dudwo123wjs").css("color", "#CBCBCB");
            $(".dudwo987wjs").css("color", "#ff7100");
            to3 = false;
        }

        //$("#panel").slideToggle("slow");
    });
    

    
    
    
    
    
    
    
</script>


</body>
</html>


