
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="comments-area col-lg-7 col-md-7" style="margin: 15px auto; background-color: white;" >
	<h4>Review</h4>
	<div class="comment-list">
		<div class="single-comment justify-content-between d-flex">
		
	
			<c:forEach items="${list}" var="r">
		 	<div class="user justify-content-between d-flex">
					<div class="desc">
						<h5>${r.writer}</h5>
						<p class="score">${r.score}</p>
						<p class="date">${r.reg_date}</p>
						<p class="comment">${r.contents}</p>
					</div>
				</div>
				<div class="reply-btn"> 
				 	<c:if test="${member.member_num eq r.member_num }">
						 <a href="./reviewUpdate?review_num=${r.review_num }"
							class="btn-reply text-uppercase">update</a>
						<a href="./reviewDelete?review_num=${r.review_num }"
							class="btn-reply text-uppercase">delete</a> 
					 </c:if> 
				 </div> 
			</c:forEach>
			
			
		</div>
	</div>
	<c:forEach items="${list}" var="r">
		 <div class="row blog_item"> 
                           <div class="col-md-3">
                               <div class="blog_info text-right">
                                    <div class="post_tag">
                                   <!--      <a href="#">Food,</a>
                                        <a class="active" href="#">Technology,</a>
                                        <a href="#">Politics,</a>
                                        <a href="#">Lifestyle</a> -->
                                    </div>
                                    <ul class="blog_meta list">
                                        <li><a >${r.writer}<i class="fa fa-user-o"></i></a></li>
                                        <li><a>${r.reg_date}<i class="fa fa-calendar-o"></i></a></li>
                                        <li><a>${r.score}<i class="fa fa-eye"></i></a></li>
                                        <li><a href="#">06 Comments<i class="fa fa-comment-o"></i></a></li>
                                    </ul>
                                </div>
                           </div>
                            <div class="col-md-9" style="border-bottom: 1px solid #DBDBDB">
                                <div class="blog_post">
                                    <img src="assets/images/blog/main-blog/m-blog-5.jpg" alt="">
                                    <div class="blog_details">
                                 	<a href="blog-details.html"><h4></h4></a>
                                        <p>${r.contents}</p>
                                    </div>
                                </div>
                            </div>
                                        <a href="blog-details.html" class="template-btn">더보기</a>
                </div> 
	</c:forEach>
	
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

