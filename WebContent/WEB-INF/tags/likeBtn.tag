<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="singlePost"%>
<!-- jQuery -->
<script type="text/javascript">
	function up(pnum) {
		var upRef = "likeUp.pdo";
		var ppnum = JSON.stringify(pnum).replace(/\"/g, "");
		document.location.replace(upRef + "?pnum=" + ppnum);

	}
	function down(pnum) {

		var downRef = "likeDown.pdo";
		var ppnum = JSON.stringify(pnum).replace(/\"/g , "");
		console.log("ppnum == "+ppnum+"되나?");
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

