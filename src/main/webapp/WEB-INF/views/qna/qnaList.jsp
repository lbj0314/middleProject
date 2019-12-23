<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/header.jsp"></c:import>
<style type="text/css">
#young{
color: black;
}
</style>
<c:import url="../layout/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->	
	<!-- Asked Area Starts -->
    <div class="deshes-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3><span>문의 </span> 및 <span> 건의 </span> 페이지 </h3>
                        <p><i>FoodFun은 분야별 전문상담사를 통해 보다 정확한 상담을 제공합니다. FoodFun의 고객센터를 이용해주셔서 감사합니다.</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 col-md-6 align-self-center">
                    <h1>01.</h1>
                    <div class="deshes-text">
                        <h3><span>정기 점검</span></h3><br> <h4>정기 점검 시간 및 안내 사항</h4>
                        <p class="pt-3"><h4>기간 : </h4> 매주 금요일은 FoodFun 정기점검으로 <br>
                       	 오전 1시부터 7시까지 FoodFun 홈페이지를 이용할 <br>
                       	 수 없습니다.고객 여러분들의 너그러운 양해 부탁드리며<br>
						자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</p>
                        <a href="${pageContext.request.contextPath}/notice/noticeList" class="template-btn3 mt-3" 
                        style="font-weight: 500; background-color: white; color: #ff4e59; font-size:1.2em;">
                        <b>공지사항 페이지 이동</b><span><i class="fa fa-long-arrow-right"></i></span></a>
                    </div>
                    <!-- --------------- -->
                </div>
                <div class="col-lg-5 offset-lg-2 col-md-6 align-self-center mt-4 mt-md-0">
                    <img src="../resources/images/deshes1.png" alt="" class="img-fluid">
                </div>
            </div>
            <div class="row mt-5">
                <div class="col-lg-5 col-md-6 align-self-center order-2 order-md-1 mt-4 mt-md-0">
                    <img src="../resources/images/deshes2.png" alt="" class="img-fluid">
                </div>
                <div class="col-lg-5 offset-lg-2 col-md-6 align-self-center order-1 order-md-2">
                    <!-- --------------- -->
                    <h1>02.</h1>
                    <div class="deshes-text">
                        <h4><span>점검 시간 이용 불가 목록</span></h4>
                        <p class="pt-3"><h4>오전 1시 ~ 오전 7시(6시간)</h4><br>
							1. FoodFun 로그인을 할 수 없습니다.<br>
							2. 회원 가입/탈퇴/ 서비스를 이용할 수 없습니다.<br>
							3. FoodFunPlug 내 메신저를 이용할 수 없습니다.<br>
							4. Last Order 혜택 서비스를 이용할 수 없습니다.<br>
							5. 예약를 이용할 수 없습니다.<br>
							6. 식당 블로그를 이용할 수 없습니다.<br>
							7. 식당 홈페이지를 이용할 수 없습니다.<br>
							8. FoodFun 홈페이지를 이용할 수 없습니다.<br>
							: 보안서비스(FoodFun-OTP)를 이용할 수 없습니다.</p>
                        <a href="${pageContext.request.contextPath}/" 
                        class="template-btn3 mt-3" 
                        style="font-weight: 500; background-color: white; color: #ff4e59; font-size:1.2em;">
                       <b> 홈페이지 이동 </b><span><i class="fa fa-long-arrow-right"></i></span></a>
                    </div>
                    <!-- --------------- -->         
                </div>
            </div>
        </div>
    </div>	
<!-- ------------------------------------------------------------------------ -->
	<h4 style="padding-left: 510px; font: 700 28px NEXON Gothic; color: #17191d;">문의 게시판</h4>
	<div class="container">
	
		
		<table class="table">
			<tr>
				<th>No</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th> 
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="vo">
				<tr>
					<td>${ vo.qna_num }</td>	
					<td>
					<c:catch>
					<c:forEach begin="1" end="${ vo.depth }">⇘</c:forEach>
					</c:catch>
					<a href="${qna}Select?qna_num=${ vo.qna_num }">${ vo.title }</a>
					</td>
					<td>${ vo.id }</td>
					<td>${ vo.reg_date }</td>
					<td>${ vo.hit }</td>
				</tr>
			</c:forEach>

		</table>
	
		<div>
			<form id="frm" action="./${qna}List" method="get">
			<input type="hidden" id="curPage" value="1" name="curPage">
			<select name="kind">
				<option id="kt" value="kt">제목</option>
				<option id="kw" value="kw">회원 ID</option>
				<option id="kc" value="kc">날짜</option>
			</select>
			<input type="text" id="search" name="search" value="${pager.search }">
			<button class="btn btn-info" 
			style="    color: #fff; background: #f8b600; border: 1px solid transparent;">SEARCH</button>
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

		<c:if test="${!empty member  }">
			<button type="button" class="btn btn-info" id="btn_write" 
			style="    color: #fff; background: #f8b600; border: 1px solid transparent;">작성</button>
		</c:if>
	</div>
<!-- ------------------------------------------------------------------------ -->
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ------------------------------------------------------------------------ -->
		
		
	<script type="text/javascript">
		var board = '${qna}';
		$("#btn_write").click(function() {
			location.href = board+"Write";
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
	<c:import url="../layout/footer.jsp" />
	
</body>
</html>
