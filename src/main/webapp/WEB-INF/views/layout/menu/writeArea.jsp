<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu Write</title>
<c:import url="../layout/restaurant/bootStrap.jsp" />
<c:import url="../layout/summernote.jsp" />
<style type="text/css">
#write-div {
	margin: 0 auto;
	max-width: 100%;
}

#btn-form {
	margin-top: 50px;
	text-align: center;
}

</style>
</head>
<body>

	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->

	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8" id="write-div">
				<h3 class="mb-30 title_color">Menu Write</h3>
				<form action="./menuWrite" method="post" id="frm"
					enctype="multipart/form-data">

					<div class="mt-10" id="menu">
						<div id="menu2">
					<input type="hidden" id="rest_num" name="rest_num" value="${vo.rest_num}">
							<div class="mt-10">
								<input type="text" id="menu_name" name="menu_name"
									placeholder="메뉴 이름" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '메뉴 이름'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" id="menu_contents" name="menu_contents"
									placeholder="메뉴 설명" onfocus="this.placeholder = ''"
									onblur="this.placeholder = '메뉴 설명'" required
									class="single-input">
							</div>
							
							<div class="mt-10">
								<input type="text" id="price" name="price" placeholder="메뉴 가격"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '메뉴 가격'" required
									class="single-input">
							</div>
							<div class="mt-10">
								<input type="text" id="origin" name="origin" placeholder="원산지"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '원산지'" required
									class="single-input">
							</div>

						
							

							<div class="form-group" title="parent">
								<input type="file" name="file" class="mt-10" id="file">
								<input type="button" class="genric-btn danger del" value="Del">
							</div>
						</div>
					</div>
						<input type="button" class="genric-btn info" value="Add Menu"
							id="add">
							
						
					<button type="submit" class="genric-btn primary">WRITE</button>
				</form>
			</div>
		</div>
	</div>

	<script>
		var menu = $("#menu").html();
		var num = 0;
		//var index = 1;

		$("#menu").empty();

		$("#menu").on("click", ".del", function() {

			//$(this).parent().remove();
			$(this).parents("#menu2").remove();
			//var i = $(this).attr('title');
			//$("#"+i).remove();
			num--;
		});

		$("#add").click(function() {
			//var files='<div id="f'+index+'"><input type="file"><input type="button" title="f'+index+'" class="del" value="del">';
			if (num > 4) {
				alert("메뉴의 개수는 6개까지 올릴 수 있습니다.");
			}
			$("#menu").append(menu);
			num++;
		});
	</script>
</body>
</html>