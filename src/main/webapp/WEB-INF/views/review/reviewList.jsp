<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <link rel="stylesheet" href="../resources/css/review/review.css">

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
			
			
			<!-- 상자 -->	
			<div id = "review_info_right">
				 <div id = "review_score_good" class="">
				 <img alt="pink brand lipstick" 
				src="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/restaurant_recommend_face.svg">
				 </div>
				<span class = "reviewpicker_label dudwo123wjs">최고입니다!</span>
			</div>
					
		</div>
			
			

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








