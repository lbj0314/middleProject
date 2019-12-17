<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>
img {
	display: block;
	margin: 0 auto;
}

.menu {
	text-align: center;
	margin: 20px auto;
}

.img2 {
	width: 100%;
	height: 800px;
}
</style>

<section class="blog_area section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 posts-list">
				<div class="single-post row">
					<div id="img" class="col-lg-12 carousel slide" data-ride="carousel">
						<ul class="carousel-indicators">
							<li data-target="#img" data-slide-to="0" class="active"></li>
							<c:forEach begin="1" end="2" var="i">
								<li data-target="#img" data-slide-to="${i}"></li>
							</c:forEach>
						</ul>

						<div class="carousel-inner" style="overflow: hidden">
							<div class="carousel-item active">
								<c:forEach end="0" items="${ vo.files }" var="file">

									<img class="img-fluid img2" alt="${file.oname}"
										src="../resources/upload/restaurant/${file.fname}"
										>

								</c:forEach>
							</div>
							<div class="carousel-item">
								<c:forEach begin="1" end="1" items="${ vo.files }" var="file">
									<img class="img-fluid img2" img2 alt="${file.oname}"
										src="../resources/upload/restaurant/${file.fname}"
										>
								</c:forEach>
							</div>
						</div>
						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#img" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a> <a class="carousel-control-next" href="#img" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
					<div class="col-lg-12  col-md-3">
						<div class="blog_info">
							<table class="col-lg-4" style="float: right;">
								<tr>
									<td>${vo.kind}&nbsp;<i class="fas fa-utensils"></i></td>
									<td>${vo.reg_date}&nbsp;<i class="fa fa-calendar-o"></i></td>
									<td>${vo.hit}&nbsp;<i class="fa fa-eye"></i></td>
									<td>${vo.review_hit }&nbsp;<i class="fas fa-comment"></i></td>
									<td>${review.score }&nbsp;<i class="fas fa-star"></i></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 blog_details">
						<h5>${vo.rest_name}</h5>
						<p class="excert">${vo.rest_contents}</p>

					</div>
					<div class="col-lg-12">
						<div class="col-lg-12 menu">
							<a href="../menu/menuList" class="btn genric-btn primary">Menu</a>
							<a href="../reservation/reservationWrite?rest_num=${vo.rest_num }" class="genric-btn success">Reservation</a>
							<c:if test="${member.member_num eq vo.member_num }">
								<a href="../menu/menuWrite" class="btn genric-btn info">Menu Write</a>
								<a href="../resttable/tableWrite?rest_num=${vo.rest_num}" class="btn genric-btn default">Table Write</a>
							</c:if>
						</div>
						<c:if test="${not empty vo.rest_url}">
						<p style="margin-top: -12px; float: right;">
							홈페이지 : 
							<em class="link"> <a href="javascript:void(0);"
								onclick="window.open('${vo.rest_url}', '_blank')">
									${vo.rest_url } </a>
							</em>
						</p>
						</c:if>
						<div>
							<span>오시는 길</span>
						</div>
						<div id="map" style="width: 100%; height: 350px;"></div>
						<br>
						<span style="float: right;">영업 시간 : ${vo.rest_time}</span>
						<br>
						<span style="float: right;">수용 인원 : ${vo.rest_accept}명</span>
						<br>
						<span style="float: right;">주소 : ${vo.rest_addr1}${vo.rest_addr2}</span>
					</div>
				</div>
			</div>
			<div class="col-lg-12" style="text-align: center; margin-top: 5em">
				<c:if test="${member.member_num eq vo.member_num }">
					<a href="./restUpdate?rest_num=${vo.rest_num }"
						class="btn genric-btn success">Update</a>
				<a href="./restDelete?rest_num=${vo.rest_num }"
					class="btn genric-btn danger">Delete</a>
				</c:if>
					
					<a href="./restList"
					class="btn genric-btn info">List</a>
			</div>
		</div>
	</div>

</section>
<!--================Blog Area =================-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b39d75683dde78d308a077c0f0561a6e&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
//주소 가져오기
var addr = '${vo.rest_addr1}';
var addr2 = '${vo.rest_addr2}';
if (addr2 != '') {
	addr = addr+addr2;
}
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
		
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        //가게 이름 가져오기
        var name = '${vo.rest_name}';
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
