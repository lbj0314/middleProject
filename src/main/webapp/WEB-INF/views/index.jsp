<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <!-- Page Title -->
    <title>Test</title>

<c:import url="./layout/bootStrap.jsp"/>  
<c:import url="./layout/header.jsp"/>
</head>
<body>
<c:import url="./layout/banner.jsp"/>
<c:import url="./layout/topArea.jsp"/>
<c:import url="./layout/foodArea.jsp"/>
<c:import url="./layout/reservationArea.jsp"/>
<c:import url="./layout/deshArea.jsp"/>



<c:import url="./review/reviewMain.jsp"/>


<c:import url="./layout/updateArea.jsp"/>
<c:import url="./layout/tableArea.jsp"/>
<c:import url="./layout/footer.jsp"/>

 <script type="text/javascript">
 
/*  $(document).ready(function(){
	 
	$.ajax({
		type:"Get",
		url:"./review/reviewMain",
		error: function() {
			alert("실패")
		},
		success : function(data) {
			
		}
		
	});
	 
	 
 }); 
  */
 
 
 </script>
 
 
 
</body>
</html>
