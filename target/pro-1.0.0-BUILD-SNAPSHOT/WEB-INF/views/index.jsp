<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <!-- Page Title -->
    <title>Test</title>
 <!-- Required Meta Tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<c:import url="./layout/bootStrap.jsp"/>  
<c:import url="./layout/header.jsp"/>
</head>
<body>
<c:import url="./layout/banner.jsp"/>
<c:import url="./layout/topArea.jsp"/>
<c:import url="./layout/foodArea.jsp"/>
<c:import url="./layout/reservationArea.jsp"/>
<c:import url="./layout/deshArea.jsp"/>


<%-- <c:import url="./review/reviewMain.jsp"/> --%>
  <section class="testimonial-area section-padding4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3>Customer <span>says</span></h3>
                        <p><i>Beast kind form divide night above let moveth bearing darkness.</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="testimonial-slider owl-carousel a">
             
              
                    </div>
                </div>
            </div>
        </div>
    </section>



<c:import url="./layout/updateArea.jsp"/>
<c:import url="./layout/tableArea.jsp"/>
<c:import url="./layout/footer.jsp"/>

 <script type="text/javascript">
 
  $(document).ready(function(){
	 
	$.ajax({
		type:"Get",
		url:"./review/reviewMain",
		
		error: function() {
			alert("실패")
		},
		success : function(data) {
			$(".a").html(data);
		}
		
	});
	 
	 
 }); 
  
 
 
 </script>
 
 
 
</body>
</html>
