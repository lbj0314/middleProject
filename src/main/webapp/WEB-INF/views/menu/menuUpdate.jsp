<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <c:import url="../layout/menu/bootStrap.jsp"/>
	<link href="../resources/css/menu/menu.css" rel="stylesheet">	
</head>

<body> 
	<c:import url="../layout/menu/header.jsp"/>
	
	<form action="./menuUpdate" method="post" enctype="multipart/form-data">
	
		<div id = "inner">
		
		</div>
		
		<div id = "menu_view">
			<div class = "menu_view_img" id = menuUpdate_img_form>
		<c:forEach end="1" items="${vo.files}" var = "file">
			 <img id = "menuUpdate_img" alt="${file.oname}" src="../resources/upload/menu/${file.fname}"
				width="100%" height="100%">		
		</c:forEach>
						
				<input type="file" id = "file" name="file" style="padding-top: 10px" >
				
			</div>
			
			
			<div id = "menu_view_detail">
				<div id = "myAssignZone">
					<h4>
					<input type="text" placeholder="${vo.menu_name}" class = "menuUpdate_input" name="menu_name" id="menu_name" onfocus="this.value = this.value"
					value = "${vo.menu_name}">
					<%-- ${vo.menu_name} --%>
					<br>
					</h4>
					<p class = "t1">
					<input type="text" placeholder="${vo.price}" value = "${vo.price}" class = "menuUpdate_input" name="price" id="price"
					>
						<%-- ${vo.price} 원 --%>
						<br>
					</p>
				</div>
				<div class="product_view_info">
					<div class = "product_info_content">
					<input type="text" placeholder="${vo.menu_contents}" value = "${vo.menu_contents}" class = "menuUpdate_input" name="menu_contents" id="menu_contents"
					>
						<%-- ${vo.menu_contents} --%>
					</div>
					<div class = "product_factor">
						<p><input type="text" placeholder="${vo.origin}" value = "${vo.origin}" class = "menuUpdate_input" name="origin" id="origin"
					></p>
					
					</div>				
				
				</div>
					<input type="hidden" name="menu_num" value="${vo.menu_num}">
				<!-- <input type="submit" class="genric-btn info" value="확인"> -->
				<button type="submit" class="genric-btn info">확인</button>
				<input type="button" class="genric-btn danger" id="danger_btn"
					onclick="history.go(-1)" value="취소">
			</div>				
		</div>
				
		
	</form>	
	
	<c:import url="../layout/menu/footer.jsp"/>

<script type="text/javascript">
  
$("#menu_name").focus();

/* $('#file').change(function() {
	
	
}); */

function readURL(input) {
	if(input.files && input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#menuUpdate_img').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
	
}

$('#file').change(function() {
	readURL(this);
	
});
 
	
</script>	
	
</body>

</html>