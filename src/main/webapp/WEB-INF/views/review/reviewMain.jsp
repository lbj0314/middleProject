<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<section class="testimonial-area section-padding4">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-top2 text-center">
					<h3>
						Customer <span>says</span>
					</h3>
					<p>
						<i>Beast kind form divide night above let moveth bearing
							darkness.</i>
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="testimonial-slider owl-carousel reviewMain_box">
				
					<c:forEach items="${list}" var="vo">
						<div class="single-slide d-sm-flex">
						<!-- 	<div class="customer-img mr-4 mb-4 mb-sm-0">
							 <img src="resources/images/customer1.png" alt="">
							</div> -->
							<div class="customer-text">
								<h5>${vo.writer}</h5>
								<span><i>${vo.score}</i></span> <span><i>${vo.writer}</i></span>
								<p class="pt-3">${vo.contents}</p>
							</div>
						</div>
					</c:forEach>
					
					
				</div>
			</div>
		</div>
	</div>
</section>
