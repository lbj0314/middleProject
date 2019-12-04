<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>

	<!--================Blog Categorie Area =================-->
	<section class="blog_categorie_area" id="categorie_area">
		<div class="container" id="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
					<div class="categories_post" id="post1">
						<img src="../resources/images/blog/cat-post/cat-post-2.jpg"
							alt="post" class="post_img">
						<div class="categories_details">
							<div class="categories_text">
								<a href="./memberMylist"><h5>Politics</h5></a>
								<!-- member_num, 파라미터 -->
								<div class="border_line"></div>
								<p>Be a part of politics</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="categories_post" id="post2">
						<img src="../resources/images/blog/cat-post/cat-post-1.jpg"
							alt="post" class="post_img">
						<div class="categories_details">
							<div class="categories_text">
								<a href="blog-details.html"><h5>Food</h5></a>
								<div class="border_line"></div>
								<p>Let the food be finished</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Categorie Area =================-->

	<!-- Footer Area Starts -->
	<c:import url="../layout/footer.jsp" />
</body>
</html>
