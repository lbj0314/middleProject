<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" />
    <link href="../resources/css/search.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>restaurant List</title>
<c:import url="../layout/restaurant/bootStrap.jsp"/>
</head>
<body>
<!-- Preloader Starts -->
    <div class="preloader">
        <div class="spinner"></div>
    </div>
    <!-- Preloader End -->
<c:import url="../layout/restaurant/header.jsp"/>

<div class="container">
<%-- <!-- search -->
		<div>
			<form id="frm" action="./restList" method="get">
			<input type="hidden" id="curPage" value="1" name="curPage">
			<select name="kind">
				<option id="kn" value="kn">name</option>
				<option id="kc" value="kc">contents</option>
			</select>
			<input type="text" id="search" name="search" value="${pager.search }">
			<button class="genric-btn success circle">SEARCH</button>
			</form>
		</div> --%>
		<%-- <table class="table ">

			<tr>
				<th>NUM</th>
				<th width="60%">NAME</th>
				<th>DATE</th>
				<th>HIT</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${ vo.rest_num }</td>	
					<td>

					<a href="restSelect?rest_num=${ vo.rest_num }">${ vo.rest_name }</a>
					</td>
					<td>${ vo.reg_date }</td>
					<td>${ vo.hit }</td>
				</tr>
			</c:forEach>
		</table> --%>
		<div class="s003" >
      <form action="./restList" method="get" id="frm" >
      <input type="hidden" id="curPage" value="1" name="curPage">
        <div class="inner-form" >
          <div class="input-field first-wrap">
            <div class="input-select">
              <select data-trigger="" name="kind">
            <!--     <option placeholder="">Category</option> -->
                <option id="kn" value="kn">Name</option>
                <option id= "kc" value="kc">Contents</option>
              
              </select>       
            </div>
          </div>
          <div class="input-field second-wrap">
            <input class="single-input-secondary" id="search" type="text" name="search" placeholder="Enter Keywords?" name="search" value="${pager.search }" />
          </div>
          <div class="input-field third-wrap">
            <button class="btn-search" style="background-color: #ffb606">click
              <svg class="svg-inline--fa fa-search fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="search" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
       		  <path fill="currentColor" d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
              </svg>
            </button>
            </div>
        </div>
      </form>
 </div> 
            
            
            <div class="row">
            	<c:forEach items="${list}" var="vo" varStatus="i">
                <div class="col-md-4">
                    <div class="single-food">
                   
                  	
                        <div class="food-img">
                            <a href="restSelect?rest_num=${ vo.rest_num }"><img src="../resources/upload/restaurant/food${i.index}.jpg" class="img-fluid" alt="food${i.index }.jpg"></a>
                        </div>
                     
                        <div class="food-content">
                            <a href="restSelect?rest_num=${ vo.rest_num }" class="template-btn3 mt-2"><h5>${vo.rest_name}</h5></a>
                           
                         
                		 </div>
                    </div>
                    </div>
                    </c:forEach>
                </div>
		<div>
			<!-- session member, memberDTO -->
			<c:if test="${ member.grade eq 2  }">
				<button type="button" class="genric-btn primary" id="btn_write">WRITE</button>
			</c:if>
		</div>
			<ul class="pagination justify-content-center" style="margin:20px 0">
				<c:if test="${ pager.curBlock gt 1 }">

					<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }" var="i">
					<li class="page-item"><span id="${i}" class="list genric-btn link">${i}</span></li>
				</c:forEach>
				<c:if test="${ pager.curBlock lt pager.totalBlock }">
				<li><span id="${pager.lastNum + 1 }" class="list">다음</span></li>
				</c:if>
			</ul>
		</div>
		
<c:import url="../layout/restaurant/footer.jsp"/>
	<script type="text/javascript">
		$("#btn_write").click(function() {
			location.href = "restWrite";
		});	
		var kind = '${pager.kind}';
		if(kind == ''){
			kind = "kn";
		}
		$("#"+kind).prop("selected", true);
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		
		});
	</script>
	<script src="../resources/js/extention/choices.js"></script>
 <script>
      const choices = new Choices('[data-trigger]',
      {
       searchEnabled: false,
     itemSelectText: '', 
      });
      
    </script>
</body>
</html>