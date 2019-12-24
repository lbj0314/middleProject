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
	<div>
	
		<div id = "inner">
		
		</div>
		
		<div id = "menu_view">
			<div class = "menu_view_img">
			<c:forEach items="${vo.files}" var="file">
			 <img alt="${file.oname}" src="../resources/upload/menu/${file.fname}"
				width="100%" height="100%"> 
			</c:forEach>
			
			</div>
			
			
			<div id = "menu_view_detail">
				<div id = "myAssignZone">
					<h4>
					${vo.menu_name}
					<br>
					</h4>
					<p class = "t1">
						${vo.price} 원
						<br>
					</p>
				</div>
				<div class="product_view_info">
					<div class = "product_info_content">
						${vo.menu_contents}
					</div>
					<div class = "product_factor">
						<p>${vo.origin}</p>
					
					</div>				
				
				</div>
				<c:if test="${rest.rest_id eq member.id}">
				 <a href="./menuUpdate?menu_num=${vo.menu_num}" class="genric-btn success">수정하기</a>
				  <a href="./menuDelete?menu_num=${vo.menu_num}" class="genric-btn danger">삭제하기</a>
				</c:if>
			</div>
			
		</div>
		
		
	</div>
	<c:import url="../layout/menu/footer.jsp"/>
</body>

</html>
