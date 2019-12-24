<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Modal -->
<div id="review_write_form" style="margin: 0 auto; background-color: white;">

		<div class="comment-list">
			<form action="../review/reviewWrite" method="post" id="frm">
				<input type="hidden" id="member_num" name="member_num"value="${member.member_num}">
				 <input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">

				<c:if test="${ not empty member }">
					<input type="text" id="writer" name="writer" value="${member.name}"
						readonly="readonly" style="margin-left: 20px; border: none;">
					<select name="score" id="score">
						<option value="1">★☆☆☆☆</option>
						<option value="2">★★☆☆☆</option>
						<option value="3">★★★☆☆</option>
						<option value="4">★★★★☆</option>
						<option value="5">★★★★★</option>
					</select>
				</c:if>


				<textarea class="review_editor" name = "contents"
					placeholder="주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!" maxlength="10000"
					required class="single-input"></textarea>
				<button class="genric-btn primary" id="review_btn">리뷰쓰기</button>

		</form>
		</div>
	</div>
