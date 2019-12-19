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
					
			<input type="button" class = "genric-btn primary del_file" value = "기존이미지 삭제하고 수정하기" id= "${file.fnum}" style="margin-top: 10px">	
		</c:forEach>
			
				<input type="file" id = "file" name="file" style="padding-top: 10px; display: none;">
		
			</div>
			
			
			<div id = "menu_view_detail">
				<div id = "myAssignZone">
					<h4>
					<input type="text"  class = "menuUpdate_input" name="menu_name" id="menu_name" onfocus="this.value = this.value"
					value = "${vo.menu_name}">
					<%-- ${vo.menu_name} --%>
					<br>
					</h4>
					<p class = "t1">
					<input type="text"  value = "${vo.price}" class = "menuUpdate_input" name="price" id="price"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" placeholder="숫자만 입력하세요">
						<%-- ${vo.price} 원 --%>
						<br>
					</p>
				</div>
				<div class="product_view_info">
					<div class = "product_info_content">
					<input type="text"  value = "${vo.menu_contents}" class = "menuUpdate_input" name="menu_contents" id="menu_contents"
					>
						<%-- ${vo.menu_contents} --%>
					</div>
					<div class = "product_factor">
						<p><input type="text" value = "${vo.origin}" class = "menuUpdate_input" name="origin" id="origin"
					></p>
					
					</div>				
				
				</div>
					<input type="hidden" name="menu_num" value="${vo.menu_num}">
				<!-- <input type="submit" class="genric-btn info" value="확인"> -->
				<button id = "menuUpdate_btn" type="submit" class="genric-btn info">확인</button>
				<input type="button" class="genric-btn danger" id="danger_btn"
					onclick="history.go(-1)" value="취소">
			</div>				
		</div>
				
		
	</form>	
	
	<c:import url="../layout/menu/footer.jsp"/>

<script type="text/javascript">
  
$("#menu_name").focus();

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


$(".del_file").click(function() {
	var fnum = $(this).attr("id");	
		
	$.post("./fileDelete", {fnum:fnum},function(data){
		data = data.trim();

		
	}); 
	
	$('#file').show();
	$('.del_file').hide();
	
});


$('#menuUpdate_btn').click(function() {

	var menu_name  = $('#menu_name').val();
	var menu_contents = $('#menu_contents').val();
	var price = $('#price').val();
	var origin = $('#origin').val();
	
	if(menu_name == "" || menu_contents == "" || price == "" || origin ==""){
		alert("정보를 입력해주세요.");
		return false;
	}else if(menu_name != "" && menu_contents != "" && price != "" && origin !=""){
		
	}
			
	
	
});
 
	
</script>	
	
</body>

</html>