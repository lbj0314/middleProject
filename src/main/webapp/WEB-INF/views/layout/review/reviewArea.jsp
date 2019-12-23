<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="comments-area col-lg-8 col-md-8">
		<h4>Review</h4>
		<div class="comment-list">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="../resources/images/blog-details/c1.jpg" alt="">
					</div>
					<div class="desc">
					<c:forEach items="${list}" var="vo">
						<h5>
							${vo.writer}
						</h5>
						<p class="date">${vo.reg_date}</p>
						<p class="comment">${vo.contents}</p>
					</c:forEach>
					</div>
				</div>
				
				
				<div class="reply-btn">
					<a href="" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>		
		</div>
		
		<div class="comment-list left-padding">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="../resources/images/blog-details/c2.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Elsie Cum</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
		<div class="comment-list left-padding">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="../resources/images/blog-details/c3.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Annie Steph</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
		<div class="comment-list">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="../resources/images/blog-details/c4.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Maria Luna</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
		<div class="comment-list">
			<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
					<div class="thumb">
						<img src="../resources/images/blog-details/c5.jpg" alt="">
					</div>
					<div class="desc">
						<h5>
							<a href="#">Ina Hayes</a>
						</h5>
						<p class="date">December 4, 2017 at 3:12 pm</p>
						<p class="comment">Never say goodbye till the end comes!</p>
					</div>
				</div>
				<div class="reply-btn">
					<a href="" class="btn-reply text-uppercase">reply</a>
				</div>
			</div>
		</div>
	</div>