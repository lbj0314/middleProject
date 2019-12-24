<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="../layout/notice/header.jsp"></c:import>
<style type="text/css">

</style>
<c:import url="../layout/notice/bootStrap.jsp" />
</head>
<body>
	<c:import url="../layout/notice/header_area.jsp"></c:import>
<!-- ------------------------------------------------------------------------ -->

    <!-- Asked Area Starts -->
    <div class="deshes-area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-top2 text-center">
                        <h3><span>공지 </span> 및 <span> 안내 </span> 페이지 </h3>
                        <p><i>고객 여러분들의 너그러운 양해 부탁드리며 자세한 점검시간과 작업영향은 아래 내용을 확인해 주시기 바랍니다.</i></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5 col-md-6 align-self-center">
                    <h1>01.</h1>
                    <div class="deshes-text">
                        <h3><span>고객상담실</span><br> 위치 및 운영시간</h3>
                        <p class="pt-3"><h4>주소:</h4> 경기도 성남시 분당구 판교역로 240(삼평동)<br>삼환하이펙스 A동 4층 
                        	<h4>고객상담실 :</h4>  02-9999-5959 / 02-8888-5858  <br>
                       		<h4> 운영시간 :</h4> 평일(월~금) 오전 09:00 ~ 오후 12:30 오후 01:30 ~ 오후 06:00평일 문의접수는 오후 5시에 마감됩니다. 또한 <br>
                       		공휴일, 주말 및 야간에는 운영하지 않습니다.</p>
                        <a href="${pageContext.request.contextPath}/qna/qnaList" class="template-btn3 mt-3" 
                        style="font-weight: 500; background-color: white; color: #ff4e59; font-size:1.2em;">
                        <b>1:1 고객상담 이동</b><span><i class="fa fa-long-arrow-right"></i></span></a>
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
                        <h3><span>가입 및 로그인 오류</span></h3>
                        <p class="pt-3"><h4> 로그인 불가 시 아래 방법을 확인하신 후 이용 부탁드립니다. </h4><br>
                        1. 고객님 PC의 툴바 설치 여부를 확인하신 후 툴바가 설치되어 있을 경우 툴바를 삭제합니다.<br>
						2. 인터넷 옵션을 초기화하여 주시기 바랍니다. 인터넷 익스플로러 상단의 도구 > 인터넷 옵션 > 고급 > 원래대로 적용.<br>
						3. 고객님 PC의 오른쪽 하단 작업표시줄에 나타나는 날짜, 시간이 현재 시간 기준으로 되어 있는지 확인하신 후 다를 경우 수정합니다.</p>
                        <a href="${pageContext.request.contextPath}/member/memberLogin" class="template-btn3 mt-3" 
                        style="font-weight: 500; background-color: white; color: #ff4e59; font-size:1.2em;">
                        	<b>로그인 화면 이동</b><span><i class="fa fa-long-arrow-right"></i></span></a>
                    </div>
                    <!-- --------------- -->         
                </div>
            </div>
        </div>
    </div>	
<!-- ------------------------------------------------------------------------ -->
	<h4 style="padding-left: 510px; font: 700 28px NEXON Gothic; color: #17191d;">공지사항</h4>
	<div class="container">

		<table class="table ">
			<tr>
				<th>공지</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list}" var="vo" varStatus="c">
				<tr>
					<td>
					<c:catch>
					<c:forEach begin="1" end="${ vo.depth }">--</c:forEach>
					</c:catch>
					<c:choose>
						
						<c:when test="${c.index lt 2 }">
							<a style="border: 1px solid #ffc6c9; background-color: #ffe3e4; color: #ff4e59;" 
							href="noticeSelect?notice_num=${ vo.notice_num }">${ vo.title }</a>
						</c:when>
						
					
						<c:otherwise>
							<a href="noticeSelect?notice_num=${ vo.notice_num }">${ vo.title }</a>
						</c:otherwise>
					
					</c:choose>
					</td>
					<td>${ vo.id }</td>
					<td>${ vo.reg_date }</td>
					<td>${ vo.hit }</td>
				</tr>
			</c:forEach>

		</table>
		
		<div>
			<ul class="pagination">
				<c:if test="${pager.curBlock gt 1 }">

					<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
				</c:if>
				<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }" var="i">
					<li><span id="${i}" class="list">${i}</span></li>
				</c:forEach>
				<c:if test="${ pager.curBlock lt pager.totalBlock }">
				<li><span id="${pager.lastNum + 1 }" class="list">다음</span></li>
				</c:if>
			</ul>
		</div>

		<div>
			<form id="frm" action="./noticeList" method="get">
			<input type="hidden" id="curPage" value="1" name="curPage">
			<select name="kind">
				<option id="kc" value="kc">날짜</option>
			</select>
			<input type="text" id="search" name="search" value="${pager.search }">
			<button class="btn btn-info"
			style="color: #fff; background: #f8b600; border: 1px solid transparent;">SEARCH</button>
			</form>
		</div>


	</div>
	<!-- ---------------------------------------------- -->
	<div class="container" style="height: 100px;">
	
	</div>
	<!-- ---------------------------------------------- -->
	<div class="container" style="height: 100px;">	
		 <c:if test="${member.grade ==3}">
			<button type="button" class="btn btn-info" id="btn_write" 
			style=" color: #fff; background: #f8b600; border: 1px solid transparent;">작성</button>
			<a href="../admin/adminPage" class="btn btn-info"
			style="color: #fff; background: #f8b600; border: 1px solid transparent;">관리자 페이지 </a>
		 </c:if> 
	</div>
	


<!-- ---------------------------------------------------------------------------------------------------------------->	
	<div class="container" style="height: 100px;">
	
	</div>	
<!-- ---------------------------------------------------------------------------------------------------------------->
<!-- --------------------------------------------------------------------- -->	
	<script type="text/javascript">
		
		$("#btn_write").click(function() {
			location.href ="./noticeWrite";
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
	<c:import url="../layout/notice/footer.jsp" />
	
</body>
</html>
