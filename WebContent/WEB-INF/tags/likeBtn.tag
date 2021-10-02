<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="singlePost"%>
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
	function a(pnum) { //좋아요 active효과 추가제거효과
		console.log(pnum);
		var sBtn = $('.button-like > .like_a');
		var upRef = "likeUp.pdo";
		var downRef = "likeDown.pdo";
		var ppnum = JSON.stringify(pnum).replace(/\"/g , "");
		
		//JSON.stringify(pnum)
		console.log(ppnum+"되나?");
		console.log(downRef+"?pnum="+ppnum);
		console.log(upRef+"?pnum="+ppnum);
		sBtn.click(function(pnum) {
			if ($(sBtn).hasClass("likeActive")) {
				sBtn.removeClass("likeActive");
				document.location.replace(downRef+"?pnum="+ppnum); 
			} else {
				sBtn.addClass("likeActive");
				document.location.replace(upRef+"?pnum="+ppnum);
			}
		})
	}
</script>

<div class="feeling_div">
	<div class="button-like">
		<button class="like_a">
			LIKE&nbsp<i class="fa fa-heart" onClick="a('${singlePost}')"></i>
		</button>
	</div>
</div>

