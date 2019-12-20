
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="comments-area col-lg-7 col-md-7" style="margin: 15px auto">
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
				<%-- 	<c:if test="${member.member_num eq r.member_num }"> --%>
						<a href="./reviewUpdate?review_num=${r.review_num }"
							class="btn-reply text-uppercase">update</a>
						<a href="./reviewDelete?review_num=${r.review_num }"
							class="btn-reply text-uppercase">delete</a>
					<%-- </c:if> --%>
				</div>
			</c:forEach>
		</div>
	</div>
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