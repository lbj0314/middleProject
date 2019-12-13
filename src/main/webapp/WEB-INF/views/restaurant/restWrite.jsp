<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>restaurant Write</title>
<c:import url="../layout/restaurant/bootStrap.jsp"/>
<c:import url="../layout/summernote.jsp"/>
<style type="text/css">
#write-div {
	margin: 0 auto;
	max-width: 100%;
}

#btn-form {
	margin-top: 50px;
	text-align: center;
}
.rest{
display:block;
width:100%;
line-height:40px;
border:none;
outline:none;
background:#f9f9ff;
padding:0 20px
}

</style>
</head>
<body>

	<!-- Preloader Starts -->
	<div class="preloader">
		<div class="spinner"></div>
	</div>
	<!-- Preloader End -->
	<c:import url="../layout/restaurant/header.jsp" />
	
	<div class="section-top-border">
		<div class="row">
			<div class="col-lg-8 col-md-8" id="write-div">
				<h3 class="mb-30 title_color">Restaurant Write</h3>
				<form action="./restWrite" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" id="member_num" name="member_num" value="${member.member_num}">
					<div class="mt-10">
						<input type="text" id="rest_name" name="rest_name" placeholder="식당 이름"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '식당 이름'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<textarea id="rest_contents" name="rest_contents" placeholder="식당 소개글"
							style="width:100%;max-height:300px;min-height:200px;margin:5px 0;"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '식당 소개글'" required class="single-input" ></textarea>
					</div>
					<!-- 주소 API -->
					<div class="mt-10">
						<input type="text" id="rest_post1" name="rest_post1" placeholder="우편번호" readonly="readonly" 	onfocus="this.placeholder = ''"
							required class="single-input" required class="single-input">
						<input type="button" onclick="daum_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="rest_addr1" name="rest_addr1" placeholder="주소" readonly="readonly" required class="single-input"><br>
						<input type="text" class="rest" id="rest_addr2" name="rest_addr2" placeholder="상세주소">

						<div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
					</div>
					<!-- 주소 끝 -->
					<div class="mt-10">
						<input type="text" id="rest_tel" name="rest_tel" placeholder="식당 전화번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '식당 전화번호'" required
							class="single-input">
					</div>
					<div class="mt-10">
						<input type="text" class="rest" id="rest_url" name="rest_url" placeholder="식당 홈페이지 주소">
					</div>
					
					<div class="input-group-icon mt-10">
						<!-- <div class="icon">
							<i class="fa fa-plane" aria-hidden="true"></i>
						</div> -->
						<div class="form-select" id="default-select">
							<select name="kind" id="kind">
								<option value="한식">한식</option>
								<option value="중식">중식</option>
								<option value="일식">일식</option>
								<option value="양식">양식</option>
								<option value="패밀리 레스토랑">패밀리 레스토랑</option>
							</select>
						</div>
					</div>
				<div class="mt-10" id="files">
					<div class="form-group" title="parent">
						<input type="file" name="file" class="mt-10" id="file">
						<input type="button" class="genric-btn danger del" value="Del">
					</div>
				</div>
				
				<input type="button" class="genric-btn info" value="Add File" id="add">
				<!-- session member, memberVO -->
				<div class="mt-10">
					<c:if test="${ not empty member  }">
						<button type="submit" class="genric-btn primary">WRITE</button>
					</c:if>
				</div>
			</form>
			</div>
		</div>
	</div>

	<c:import url="../layout/restaurant/footer.jsp" />
	
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function daum_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                   /*  // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("daum_extraAddress").value = extraAddr; */
                
                } /* else {
                    document.getElementById("daum_extraAddress").value = '';
                } */

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('rest_post1').value = data.zonecode;
                document.getElementById("rest_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("rest_addr2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
        
    }   
        
  /*  //////////////////////////////////////////////////////////
        $("#rest_contents").summernote({
			 height: 500,
		  minHeight: null,
		  maxHeight: null,
		  callbacks :{
			  onImageUpload: function(files, editor){
				  uploadFile(files[0], this);
			  }, //upload 끝
			  onMediaDelete: function(files, editor) {
				deleteFile(files[0], this);
			} //delete 끝
		  } // callback 끝
	});
	
	function uploadFile(file, editor) {
		//form tag 생성
		var formData = new FormData();
		formData.append('file', file);
		$.ajax({
			data : formData,
			type : "POST",
			url : "./summerFile",
			enctype : "multipart/form-data",
			contentType : false,
			cache : false,
			processData: false,
			success : function(data) {
				data = data.trim();
				data = '../resources/upload/summerFile/'+data;
				$(editor).summernote('insertImage', data);
			}
		});
	}
	
	function deleteFile(file, editor) {
		var filename = $(file).attr("src");
		filename = filename.substring(filename.lastIndexOf("/")+1);
		
		$.ajax({   
			type : "POST",
			url : "summerFileDelete",
			data : {
				file : filename
			},	
			success : function(data) {
				console.log(data);
			}
		});
		
	} */
	
	var files = $("#files").html();
	var num = 0;
	//var index = 1;
	
	$("#files").empty();
	
		$("#files").on("click", ".del", function() {
			
			//$(this).parent().remove();
			$(this).parents(".form-group").remove();
			//var i = $(this).attr('title');
			//$("#"+i).remove();
			num--;
		});
		
		
	$("#add").click( function() {
		//var files='<div id="f'+index+'"><input type="file"><input type="button" title="f'+index+'" class="del" value="del">';
		if (num > 4) {
			alert("파일의 갯수는 5개까지 올릴 수 있습니다.");
		}
		$("#files").append(files);
		num++;
	});
    
</script>
</body>
</html>