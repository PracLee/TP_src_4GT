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
		var ppnum = function objToString (pnum) {
		    var str = '';
		    for (var p in pnum) {
		        if (obj.hasOwnProperty(p)) {
		            str += p + '::' + obj[p] + '\n';
		        }
		    }
		    return str;
		}
		//JSON.stringify(pnum)
		console.log(ppnum+"되나?");
		console.log(downRef+"?pnum="+JSON.stringify(pnum));
		console.log(upRef+"?pnum="+JSON.stringify(pnum));
		sBtn.click(function(pnum) {
			if ($(sBtn).hasClass("likeActive")) {
				sBtn.removeClass("likeActive");
				//document.location.replace(downRef+"?pnum="+JSON.stringify(pnum)); 
			} else {
				sBtn.addClass("likeActive");
				//document.location.replace(upRef+"?pnum="+pnum);
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

