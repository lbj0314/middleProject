 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- Food Area starts -->
    <section class="food-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-md-5">
                    <div class="section-top">
                        <h3><span class="style-change">we serve</span> <br>delicious food</h3>
                        <p class="pt-3">They're fill divide i their yielding our after have him fish on there for greater man moveth, moved Won't together isn't for fly divide mids fish firmament on net.</p>
                    </div>
                </div>
            </div>
            <div class="row">
            
            <c:forEach items = "${list}" var = "vo">
      
                <div class="col-md-4 col-sm-6 menu-list" >
                    <div class="single-food mt-5 mt-sm-">
                        <div class="food-img">
                           <img src="../resources/upload/menu/${file.fname}" class="img-fluid" alt=""> 
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>${vo.menu_name}</h5>               
                                <span class="style-change">${vo.price}</span>
                            </div>
                            <p class="pt-3">${vo.menu_contents}</p>
                        </div>
                    </div>
           <%--      <input class = "menu_num" type="hidden" value="${vo.menu_num}"> --%>
                <a href = "./menuSelect?menu_num=${vo.menu_num}">더보기</a>
                </div>   
                
                </c:forEach>

                
               <script type="text/javascript">
             /*   	$('.menu-list').click(function submitForm() {
		
            			var num = $(this).find(".menu_num").val();
                		 $(this).find(".menu_num").val();
						location.href="./menuSelect?menu_num="+num; 
						/* location.href="./menuSelect?menu_num=10";  */
						
					});  */
                
              
                </script> 
                
                
         <!--     <div class="col-md-4 col-sm-6">
                    <div class="single-food mt-5 mt-sm-0">
                        <div class="food-img">
                            <img src="../resources/images/food2.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>chicken burger</h5>
                                <span class="style-change">$9.50</span>
                            </div>
                            <p class="pt-3">Face together given moveth divided form Of Seasons that fruitful.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-food mt-5 mt-md-0">
                        <div class="food-img">
                            <img src="../resources/images/food3.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>topu lasange</h5>
                                <span class="style-change">$12.50</span>
                            </div>
                            <p class="pt-3">Face together given moveth divided form Of Seasons that fruitful.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-food mt-5">
                        <div class="food-img">
                            <img src="../resources/images/food4.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>pepper potatoas</h5>
                                <span class="style-change">$14.50</span>
                            </div>
                            <p class="pt-3">Face together given moveth divided form Of Seasons that fruitful.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-food mt-5">
                        <div class="food-img">
                            <img src="../resources/images/food5.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>bean salad</h5>
                                <span class="style-change">$8.50</span>
                            </div>
                            <p class="pt-3">Face together given moveth divided form Of Seasons that fruitful.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="single-food mt-5">
                        <div class="food-img">
                            <img src="../resources/images/food6.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="food-content">
                            <div class="d-flex justify-content-between">
                                <h5>beatball hoagie</h5>
                                <span class="style-change">$11.50</span>
                            </div>
                            <p class="pt-3">Face together given moveth divided form Of Seasons that fruitful.</p>
                        </div>
                    </div>
                </div>  -->
            </div>
        </div>
    </section>
    <!-- Food Area End -->
<!-- <script type="text/javascript">
	var kind = '${pager.kind}';
	if(kind == ''){
		kind = "kn";
	}
	$("#"+kind).prop("selected", true);
	$(".list").click(function() {
		$("#curPage").val($(this).attr("id"));
		$("#frm").submit();

});
</script> -->