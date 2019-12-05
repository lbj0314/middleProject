<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
<c:import url="../layout/restaurant/foodArea.jsp"/>
<div class="container">
<!-- search -->
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
		</div>
		<table class="table ">

			<tr>
				<th>NUM</th>
				<th width="60%">NAME</th>
				<th>DATE</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${ vo.rest_num }</td>	
					<td>

					<a href="restSelect?rest_num=${ vo.rest_num }">${ vo.rest_name }</a>
					</td>
					<td>${ vo.reg_date }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<!-- session member, memberDTO -->
			<c:if test="${ not empty member  }">
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
<c:import url="../layout/restaurant/footer.jsp"/>


</body>
</html>