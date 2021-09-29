<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html lang="kor">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<!-- 파비콘 -->

<link rel="shortcut icon" href="img/favicon2.ico">
<style type="text/css">
@font-face {
	font-family: 'NanumSquareRound';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.mlogo {
	width: 220px;
}

.feeling_div {
	display: flex;
	justify-content: center;
	align-items: center;
}

.button-like {
	margin-left: 20px;
}

.like_a {
	background-color: white;
	border: 2px solid #D25A53;
	padding: 10px 20px;
	border-radius: 2px;
	color: #D25A53;
}

.likeActive {
	background-color: #D25A53;
	color: white;
}
.crset{
	resize: none;
	width: 460px;
	height: 152px;
	
}
.cwidth{
	width: 460px;
}
.dnone{
	display:none;
}
</style>
<script type="text/javascript">
function forbid() {
	alert('로그인을 해야 이용가능한 서비스입니다!');
}
// 로그아웃, 삭제시 삭제여부를 묻는 기능
function checkAlert(uri,text){
	result=confirm(text);
	if(result==true){
		location.href=uri;
	}
	else{
		return;
	}
}
</script>

<!-- jQuery -->
<script type="text/javascript">
$(function(){ //좋아요 active효과 추가제거효과
	  var sBtn = $('.button-like > .like_a');    
	  sBtn.click(function(){
		  if($(sBtn).hasClass("likeActive")){
			  sBtn.removeClass("likeActive");  
		  }
		  else{
			  sBtn.addClass("likeActive");
		  }
		})
	 })	
function msgEdit(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
	
	$('#pcmsg'+index).css('display','none');
	$('#cOption'+index).css('visibility','hidden');
	$('#ucmsg'+index).removeClass('dnone');
	$('#uButton'+index).removeClass('dnone');
	
}	 
 
</script>
</head>
<body>
	<c:choose>
		<c:when test="${userInfoData!=null}">
			<mytag:clientSidebar />
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${userInfoData==null}">
			<mytag:nonClientSidebar />
		</c:when>
	</c:choose>
	<div class="container-fluid">
		<main class="tm-main"> <!-- Search form -->
		<div class="row tm-row">
			<div class="col-12">
				<form method="GET" class="form-inline tm-mb-80 tm-search-form">
					<input class="form-control tm-search-input" name="query"
						type="text" placeholder="Search..." aria-label="Search">
					<button class="tm-search-button" type="submit">
						<i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="row tm-row">
			<div class="col-12">
				<hr class="tm-hr-primary tm-mb-55">
				<!-- Video player 1422x800 -->
				<video width="954" height="535" controls class="tm-mb-40">
					<source src="video/wheat-field.mp4" type="video/mp4">
					Your browser does not support the video tag.
				</video>
			</div>
		</div>
		<div class="row tm-row">
			<div class="col-lg-8 tm-post-col">
				<div class="tm-post-full">
					<div class="mb-4">
						<h2 class="pt-2 tm-color-primary tm-post-title">${singlePost.title}</h2>
						<p class="tm-mb-40">${singlePost.pdate}postedby
							${singlePost.writer}</p>
						<p>${singlePost.content}</p>
						<span class="d-block text-right tm-color-primary">Category
							. ${singlePost.category}</span> <br> <br>

						<!-- 좋아요버튼 -->
						<div class="feeling_div">
							<div class="button-like">
								<button class="like_a">
									LIKE&nbsp<i class="fa fa-heart"></i>
								</button>
							</div>
						</div>
						<br> <br>
						<c:choose>
							<c:when test="${userInfoData.id==singlePost.p_user}">
								<div class="text-right">
									
										<button onclick="location.href='editPost.pdo?pnum=${singlePost.pnum}'"
											class="tm-btn tm-btn-primary tm-btn-small">글 수정</button> 
										<button onclick="checkAlert('deletePostDB.pdo?pnum=${singlePost.pnum}','게시글을 삭제하시겠어요?')" class="tm-btn tm-btn-primary tm-btn-small">글 삭제</button>
									
								</div>
							</c:when>
						</c:choose>
					</div>

					<!-- Comments -->

					<div>
					<c:set var="index" value="0" />
					<h2 class="tm-color-primary tm-post-title">Comments</h2>
							<hr class="tm-hr-primary tm-mb-45">
						<c:forEach var="cl" items="${postOne_comments}">							
							<div class="tm-comment tm-mb-45">
								<figure class="tm-comment-figure">
									<img src="img/comment-1.jpg" alt="Image"
										class="mb-2 rounded-circle img-thumbnail">
									<figcaption class="tm-color-primary text-center">${cl.c_user}</figcaption>
								</figure>
								<div class="cwidth">
								
								<!-- 평상시 코멘트내용 -->
									<p id="pcmsg${index}">${cl.cment}</p>
									
									<!-- 수정시 textarea나오게 설정 -->
									<form action="editComment.ucdo" method="post" class="mb-5 tm-comment-form">
									<input type="hidden" name="c_post" value="${singlePost.pnum}">
									<input type="hidden" name="c_user" value="${userInfoData.id}">
									<input type="hidden" name="cwriter" value="${userInfoData.name}">
									<input type="hidden" name="cnum" value="${cl.cnum}">
									<input type="hidden" name="index" value="${index}">									
									<textarea id="ucmsg${index}" class="crset dnone form-control" name="cment" rows="6" required>${cl.cment}</textarea>
									<div class="text-right">
										<button type="submit" id="uButton${index}" class="dnone tm-btn tm-btn-primary tm-btn-small">댓글수정</button>
									</div>
									</form>
									
									<div id="cOption${index}" class="d-flex justify-content-between">
										<a href="#" class="tm-color-primary">답글</a>

										<!-- 로그인세션의 id와 글쓴이의 id가 같을경우만 수정삭제가능 -->
										<c:choose>
											<c:when test="${userInfoData.id==cl.c_user}">
												<a href="javascript:void(0);" onclick="msgEdit(${index})"class="tm-color-primary">수정</a>										
												<a href="#" onclick="checkAlert('deleteComment.ucdo?cnum=${cl.cnum}&c_post=${singlePost.pnum}&index=${index}','댓글을 삭제하시겠어요?')"class="tm-color-primary">삭제</a>
											</c:when>
										</c:choose>
										<span class="tm-color-primary"> ${cl.cdate}</span>
									</div>
									
								</div>
								<hr>  
							</div>
							<c:set var="index" value="${index+1}" />
						</c:forEach>
						<c:choose>
							<c:when test="${userInfoData!=null}">
								<form action="insertComment.ucdo" method="post"
									class="mb-5 tm-comment-form">
									<input type="hidden" name="c_post" value="${singlePost.pnum}">
									<input type="hidden" name="c_user" value="${userInfoData.id}">
									<input type="hidden" name="index" value="${index}">
									<h2 class="tm-color-primary tm-post-title mb-4">Your
										comment</h2>

									<div class="mb-4">
										<textarea class="crset form-control" name="cment" rows="6" required></textarea>
									</div>

									<div class="text-right">
										<button type="submit"
											class="tm-btn tm-btn-primary tm-btn-small">댓글등록</button>
									</div>
								</form>
							</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${userInfoData==null}">
								<button onclick="checkAlert('Login.jsp','댓글을 등록하시려면 로그인을해야합니다.\n로그인창으로 가시겠어요?')"
							class="tm-btn tm-btn-primary tm-btn-small">댓글등록</button>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<aside class="col-lg-4 tm-aside-col">
				<div class="tm-post-sidebar">
					<hr class="mb-3 tm-hr-primary">
					<h2 class="mb-4 tm-post-title tm-color-primary">Categories</h2>
					<ul class="tm-mb-75 pl-5 tm-category-list">
						<li><a href="post_ctrl/jsp?action=post"
							class="tm-color-primary">치킨</a></li>
						<li><a href="#" class="tm-color-primary">피자</a></li>
						<li><a href="#" class="tm-color-primary">햄버거</a></li>
						<li><a href="#" class="tm-color-primary">한식</a></li>
						<li><a href="#" class="tm-color-primary">중식</a></li>
						<li><a href="#" class="tm-color-primary">일식</a></li>
					</ul>
					<hr class="mb-3 tm-hr-primary">
					<h2 class="tm-mb-40 tm-post-title tm-color-primary">Related
						Posts</h2>
					<a href="#" class="d-block tm-mb-40">
						<figure>
							<img src="img/img-02.jpg" alt="Image" class="mb-3 img-fluid">
							<figcaption class="tm-color-primary">Duis mollis
								diam nec ex viverra scelerisque a sit</figcaption>
						</figure>
					</a> <a href="#" class="d-block tm-mb-40">
						<figure>
							<img src="img/img-05.jpg" alt="Image" class="mb-3 img-fluid">
							<figcaption class="tm-color-primary">Integer quis
								lectus eget justo ullamcorper ullamcorper</figcaption>
						</figure>
					</a> <a href="#" class="d-block tm-mb-40">
						<figure>
							<img src="img/img-06.jpg" alt="Image" class="mb-3 img-fluid">
							<figcaption class="tm-color-primary">Nam lobortis
								nunc sed faucibus commodo</figcaption>
						</figure>
					</a>
				</div>
			</aside>
		</div>
		<footer class="row tm-row">
			<div class="col-md-6 col-12 tm-color-gray">
				Design: <a rel="nofollow" target="_parent"
					href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
			</div>
			<div class="col-md-6 col-12 tm-color-gray tm-copyright">
				Copyright 2020 Xtra Blog Company Co. Ltd.</div>
		</footer> </main>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/templatemo-script.js"></script>

</body>
</html>