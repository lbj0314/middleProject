<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="../resources/css/review/review.css">
 
 <style type="text/css">
 div.replyModal { position:relative; z-index:1; display: none;}
 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:250px; padding:20px 10px; background:#fff; border:2px solid #666; }
 div.modalContent textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px; height:200px; }
 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 div.modalContent button.modal_cancel { margin-left:20px; }
 </style>
 
</head>
<body>
 <div class="comments-area col-lg-8 col-md-8" style="margin: 15px auto; background-color: white; border: none;" >
	<div class="comment-list">
		<div class="single-comment justify-content-between d-flex">
			<div id = "review_header">
				<div id = "review_ul_wrap">
				<ul id="review_header_ul">
					<li class="review_header_li">최신순</li>
					<li class="review_header_li">높은별점순</li>
					<li class="review_header_li">낮은 별점순</li>
				</ul>
				</div>
			</div>			
		</div> 
	</div> 
	
	<div id="review_wrapper">				
		<c:forEach items="${list}" var="r">	
		<article id="review" style="margin-top: 30px;">
		<div id = "review_info">
			<div id= "review_info_left">
				<div id = "review_writer">
					<span id = "review_writer_span">${r.writer}</span>
				</div>
				<div id = "review_score">	
				
				</div>
				<div id = "review_date">
					${r.reg_date}
				</div>
			</div>	
				
			<div id = "review_info_right">
				 <div id = "review_score_good">평점 : ${r.score} </div>
		
			</div>
					
		</div>
			
			

		 <div id = "review_contents">
					${r.contents}	
			</div> 
		
		<c:if test="${member.id eq r.writer }">
		<div id= "review_List_btn">
		
			<a href="../review/reviewUpdate?review_num=${r.review_num}" class = "genric-btn primary-border small" onclick="window.open(this.href,'_blanck','width=800,height=400,left=500px,top=200px');return false">수정하기</a>
			<a href="../review/reviewDelete?review_num=${r.review_num}" class = "genric-btn danger-border small" >삭제하기</a>
		</div>	
		</c:if>
			
		</article>
		</c:forEach>
	
	</div>
	
	
	
	<script type="text/javascript">
		var action = '';
		var url = '';
		var type = '';
		var bno = 0;
	
		$(document).ready(function() {
			$("#createBtn").click(function() {
				action='modify';
				type = 'PUT'
				bno = this.value;
				
			});
			
			
		});
	
	var param="?"
		
		
		
		
	
	</script>
	
	
	
	
<%-- 	<c:forEach items="${list}" var="r">
		 <div class="row blog_item go_rivewSlect" id = "test" > 
                           <div class="col-md-3">
                               <div class="blog_info ">
                                    <ul class="blog_meta list text-right">
                                        <li><a >${r.writer}<i class="fa fa-user-o"></i></a></li>
                                        <li><a>${r.reg_date}<i class="fa fa-calendar-o"></i></a></li>
                                        <li><a>${r.score}<i class="fa fa-eye"></i></a></li>
                                        <li><a href="#">06 Comments<i class="fa fa-comment-o"></i></a></li> 
                                    </ul>
                                </div>
                           </div>
                            <div class="col-md-9" >
                                <div class="blog_post">     
                                    <img src="assets/images/blog/main-blog/m-blog-5.jpg" alt="">
                                    <div class="blog_details">
                                 	<a href="blog-details.html"><h4></h4></a>
                                        <p>${r.contents}</p>
                                    </div>
                                </div>
                            </div>
                             <!--            <a href="blog-details.html" class="template-btn" style="padding-right: 0px">더보기</a> -->
                </div> 
	</c:forEach> --%>
	
	
	
	
	
	
	<ul class="pagination justify-content-center" style="margin: 20px 0">
		<c:if test="${ pager.curBlock gt 1 }">

			<li><span id="${pager.startNum-1 }" class="list">이전</span></li>
		</c:if>
		<c:forEach begin="${ pager.startNum }" end="${ pager.lastNum }"
			var="i">
			<li class="page-item"><span id="${i}"
				class="list genric-btn link">${i}</span></li>
		</c:forEach>
		<c:if test="${ pager.curBlock lt pager.totalBlock }">
			<li><span id="${pager.lastNum + 1 }" class="list">다음</span></li>
		</c:if>
	</ul>
</div>


<div>



</div>

<div class="replyModal">

 <div class="modalContent">
  
  <div>
   <textarea class="modal_repCon" name="modal_repCon"></textarea>
  </div>
  
  <div>
   <button type="button" class="modal_modify_btn">수정</button>
   <button type="button" class="modal_cancel">취소</button>
  </div>
  
 </div>

 <div class="modalBackground"></div>
 
</div>

<c:import url="../layout/restaurant/footer.jsp"/>
</body>
</html>	