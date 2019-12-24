<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/admin/header.jsp"></c:import>
<c:import url="../layout/admin/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/admin/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
<h4 style="padding-left: 510px; font: 700 28px NEXON Gothic; color: #17191d;">회원 명단</h4>
 <div class="container">
	<c:if test="${member.grade ==3}">
	<table class="table ">
		
			<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름 </th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입 날짜</th>
				<th>등급</th>
				<th>수정</th>
				<th>삭제</th>
				
			</tr>
			<c:forEach items="${list}" var="vo" varStatus="c">
			<tr>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch> 
						<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.id }</a>
							</c:when>
							<c:otherwise>
								${ vo.id }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.pw }</a>
							</c:when>
							<c:otherwise>		
								${ vo.pw }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.name }</a>
							</c:when>
							<c:otherwise>		
								${ vo.name }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.email }</a>
							</c:when>
							<c:otherwise>		
								${ vo.email }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.tel }</a>
							</c:when>
							<c:otherwise>		
								${ vo.tel }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="1" end="1"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.joindate }</a>
							</c:when>
							<c:otherwise>		
								${ vo.joindate }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><c:catch>
							<c:forEach begin="2" end="${ vo.depth }"></c:forEach>
						</c:catch>
					<c:choose>
							<c:when test="${c.index lt 1 }">
								<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;"> ${ vo.grade }</a>
							</c:when>
							<c:otherwise>		
								${ vo.grade }
							</c:otherwise>
						</c:choose></td>
					<!-- ------------------- -->
					<td><a href="./allmemberUpdate?id=${vo.id}">수정</a></td>
					<td><a href="./allmemberDelete?id=${vo.id}">삭제</a></td>
					
			</tr>
			</c:forEach>
			
	</table>

		<div>
			<form id="frm" action="./allmember" method="get">
			<input type="hidden" id="curPage" value="1" name="curPage">
			<select name="kind">
				<option id="kt" value="kt">회원 이름</option>
				<option id="kw" value="kw">회원 ID</option>
				<option id="kc" value="kc">가입 날짜</option>
			</select>
			<input type="text" id="search" name="search" value="${pager.search }">
			<button class="btn btn-info" 
			style="    color: #fff; background: #f8b600; border: 1px solid transparent;">검색</button>
			</form>
		</div>

		<div>
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1 }">

					<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${ pager.curBlock lt pager.totalBlock }">
				<li><span id="${pager.lastNum + 1 }" class="list ">다음</span></li>
				</c:if>
			</ul>
		</div>
		
		
	<div class="container" style="height: 100px;">
		<a href="./adminPage" class="btn btn-info"
		style="color: black; background: #f8b600; border: 1px solid transparent;">뒤로</a>	
	</div>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
	</c:if>
</div>
<script type="text/javascript">
		var board = 'allmember';
		$("#btn_write").click(function() {
			location.href = board;
			});	
		var kind = '${pager.kind}';
		if(kind == ''){
			kind = "kt";
		}
		$("#"+kind).prop("selected", true);
		$(".list").click(function() {
			$("#curPage").val($(this).attr("id"));
			$("#frm").submit();
		
		});
</script>
<!-- --------------------------------------------------------------------- -->	
	<!--=============== footer =================-->
	<c:import url="../layout/admin/footer.jsp" />

</body>
</html>
