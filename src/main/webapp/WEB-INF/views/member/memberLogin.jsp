<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>

	<!-- Contact Form Starts -->
	<section class="contact-form section-padding3">
		<div class="container" id="test">
			<div class="row">
				<div class="col-lg-9" id = "login_box">
					<h3 class="mb-30 title_color">Login</h3>
					
					<form action="./memberLogin" method="post">
						<div class="left" id="left">
							<input type="text" id="id" name="id" placeholder="Enter your id"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter your id'" required>
								
							<input type="password" id = "pw" name="pw"
								placeholder="Enter your password"
								onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Enter your password'" required>
						</div>

						<button type="submit" class="template-btn" id="login_btn">Login</button>
						
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact Form End -->


	<!-- Footer Area Starts -->
	<c:import url="../layout/footer.jsp" />
</body>
</html>
