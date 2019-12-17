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
			<img alt="" src="../resources/images/food1.jsp">
		
			<div id = "menu_view_img">
			
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
					</div>
					<div class = "product_factor">
						<p>${vo.origin}</p>
					
					</div>				
				
				</div>
			</div>
			
		</div>
		
		
	</div>
	<c:import url="../layout/menu/footer.jsp"/>
</body>

</html>
