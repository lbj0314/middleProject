<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
.reply{
	background-color: #fff;
    color: #131230;
    border: 1px solid #eee;
    padding: 5px 18px;
    display: block;
    font-weight: 600;
    transition: .5s;
    height: 350px;
    width: 638px;

}

</style>

<c:import url="../layout/admin/header.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../resources/js/vendor/jquery-2.2.4.min.js"></script>
<script src="../resources/js/vendor/bootstrap-4.1.3.min.js"></script>
<script src="../resources/js/vendor/wow.min.js"></script>
<script src="../resources/js/vendor/owl-carousel.min.js"></script>
<script src="../resources/js/vendor/jquery.datetimepicker.full.min.js"></script>
<script src="../resources/js/vendor/jquery.nice-select.min.js"></script>
<script src="../resources/js/main.js"></script>
</head>
<body>
	<c:import url="../layout/admin/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	<h4 style="padding-top:100px; padding-left: 465px; font: 700 28px NEXON Gothic; color: #17191d;">관리자 페이지</h4>
	</div>	
<!-- ------------------------------------------------------------------------ -->
       
       
       
       
       
       
       
       
       <div class="comments-area" style="height: 500px;">         
    	 <c:if test="${member.grade ==3}">
 
    	<div>
   		<button class="template-btn template-btn2 mt-4" id="enter">회원 관리</button>
			<button class="template-btn template-btn2 mt-4" id="enter2">기업주 관리</button>
			<button class="template-btn template-btn2 mt-4" id="enter3">공지 게시판 관리</button>
			<button class="template-btn template-btn2 mt-4" id="enter4">질문 게시판 관리</button> 
   	  	</div>
		
		
		
    	 <div>
    	 	<div class="reply">
    	 	2
    	 	</div>
			<!-- <a href="../restaurant/allrestaurant" class="template-btn template-btn2 mt-4">기업주 관리</a> -->
    	 </div>
    
    
    
    
	 	</c:if>	   
  	 </div>   
  	 

<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	<!--=============== footer =================-->
	<c:import url="../layout/admin/footer.jsp" />
	
	
<script type="text/javascript">
$("#enter").click(function (){
    $.ajax({
      type : "GET",
      url : "./adminPage",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function() {
      }
    });
  });
  
$("#enter2").click(function (){
    $.ajax({
      type : "GET",
      url : "./adminPage2",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function() {
      }

    });
  });  
  
$("#enter3").click(function (){
    $.ajax({
      type : "GET",
      url : "./adminPage3",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function() {
      }

    });
  });  
  
$("#enter4").click(function (){
    $.ajax({
      type : "GET",
      url : "./adminPage4",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function() {
      }

    });
  }); 
</script>
	
</body>
</html>
