<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="singlePost"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- jQuery -->
<script type="text/javascript">
	/* 	$(function() { //좋아요 active효과 추가제거효과
	 var pnum = $("#pnum");
	 console.log(pnum);
	 var sBtn = $('.button-like > .like_a');
	 var upRef = "likeUp.pdo"+pnum;
	 var downRef = "likeDown.pdo"+pnum;
	 sBtn.click(function(pnum) {
	 if ($(sBtn).hasClass("likeActive")) {
	 sBtn.removeClass("likeActive");
	 console.log(pnum.value);
	 location.replace(downRef+"?pnum="+pnum); 
	 } else {
	 sBtn.addClass("likeActive");
	 console.log(pnum.value);
	 location.replace(upRef+"?pnum="+pnum); 
	 }
	 })
	 })  */
	function up(pnum) { //좋아요 active효과 추가제거효과
		// console.log("pnum은 이걸로 저장 ->"+pnum);
		var upRef = "likeUp.pdo";
		var ppnum = JSON.stringify(pnum).replace(/\"/g, "");
		// console.log("ppnum == "+ppnum+"되나?");
		document.location.replace(upRef + "?pnum=" + ppnum);

	}
	function down(pnum) { //좋아요 active효과 추가제거효과
		// console.log("pnum은 이걸로 저장 ->"+pnum);
		var downRef = "likeDown.pdo";
		var ppnum = JSON.stringify(pnum).replace(/\"/g, "");
		document.location.replace(downRef + "?pnum=" + ppnum);
	}
</script>
<div class="feeling_div">
	<c:choose>
		<c:when test="${userInfoData==null}">
			<div class="button-like"
				onclick="checkAlert('Login.jsp','댓글을 등록하시려면 로그인을해야합니다.\n로그인창으로 가시겠어요?')">
				<button class="like_a">
					LIKE&nbsp<i class="fa fa-heart"></i>
				</button>
			</div>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${userInfoData!=null}">
			<c:choose>
				<c:when test="${likeInfo==true}">
					<div class="button-like">
						<button class="like_a likeActive" onClick="down('${singlePost.pnum}')">
							LIKE&nbsp<i class="fa fa-heart"></i>
						</button>
					</div>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${likeInfo==false}">
					<div class="button-like">
						<button class="like_a" onClick="up('${singlePost.pnum}')">
							LIKE&nbsp<i class="fa fa-heart"></i>
						</button>
					</div>
				</c:when>
			</c:choose>
		</c:when>
	</c:choose>
</div>

