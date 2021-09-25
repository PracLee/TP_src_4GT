<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ShowList</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
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
</style>

<script type="text/javascript">
function forbid() {
	alert('로그인을 해야 이용가능한 서비스입니다!');
}
function logout(){
	result=confirm("로그아웃 하시겠습니까??");
	if(result==true){
		location.href="logOut.ucdo";
	}
	else{
		return;
	}
}
</script>
</head>
<body>
	<header class="tm-header" id="tm-header">
		<div class="tm-header-wrapper">
			<button class="navbar-toggler" type="button"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="tm-site-header">
				<div class="mb-3 mx-auto">
					<img alt="4TeamLogo" src="img/logo.png" class="mlogo">
				</div>

			</div>
			<nav class="tm-nav" id="tm-nav">
				<ul>
					<li class="tm-nav-item active"><a href="main.ucdo"
						class="tm-nav-link"> <i class="fas fa-home"></i> Blog Home
					</a></li>

					<c:choose>
						<c:when test="${userInfoData!=null}">
							<li class="tm-nav-item"><a href="InsertPost.jsp"
								class="tm-nav-link"> <i class="fas fa-pen"></i> Posting
							</a></li>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${userInfoData==null}">
							<li class="tm-nav-item"><a href="#" onClick="forbid()"
								class="tm-nav-link"> <i class="fas fa-pen"></i> Posting
							</a></li>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${userInfoData==null}">
							<li class="tm-nav-item"><a href="Login.jsp"
								class="tm-nav-link"> <i class="fas fa-users"></i> Login /
									Sign-up
							</a></li>
						</c:when>
					</c:choose>

					<c:choose>
						<c:when test="${userInfoData!=null}">
							<li class="tm-nav-item"><a href="#" onclick="logout()"
								class="tm-nav-link"> <i class="fas fa-users"></i> Logout
							</a></li>
							<li class="tm-nav-item"><a href="MyPage.jsp"
								class="tm-nav-link"> <i class="far fa-comments"></i> MyPage
							</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
			<div class="tm-mb-65">
				<a rel="nofollow" href="https://fb.com/templatemo"
					class="tm-social-link"> <i
					class="fab fa-facebook tm-social-icon"></i>
				</a> <a href="https://twitter.com" class="tm-social-link"> <i
					class="fab fa-twitter tm-social-icon"></i>
				</a> <a href="https://instagram.com" class="tm-social-link"> <i
					class="fab fa-instagram tm-social-icon"></i>
				</a> <a href="https://linkedin.com" class="tm-social-link"> <i
					class="fab fa-linkedin tm-social-icon"></i>
				</a>
			</div>

		</div>
	</header>
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
			<c:forEach var="pl" items="${PostList}">
				<article class="col-12 col-md-6 tm-post">
					<hr class="tm-hr-primary">
					<a href="selectOne.pdo" class="effect-lily tm-post-link tm-pt-60">
						<div class="tm-post-link-inner">
							<img src="img/img-05.jpg" alt="Image" class="img-fluid">
						</div> <span class="position-absolute tm-new-badge">New</span>
						<h2 class="tm-pt-30 tm-color-primary tm-post-title">${pl.title}</h2>
					</a>
					<p class="tm-pt-30">
						${pl.content}
						<!-- 글자 몇개로짜르는건 안해놓음! -->
					</p>
					<div class="d-flex justify-content-between tm-pt-45">
						<span class="tm-color-primary">Category . ${pl.category}</span> <span
							class="tm-color-primary">${pl.pdate}</span>
					</div>
					<hr>
					<div class="d-flex justify-content-between">
						<span>${commentsCnt.get(pl.pnum-1)} comments</span> <span>by
							${pl.writer}</span>
					</div>
				</article>
			</c:forEach>
			<article class="col-12 col-md-6 tm-post">
				<hr class="tm-hr-primary">
				<a href="post.html" class="effect-lily tm-post-link tm-pt-60">
					<div class="tm-post-link-inner">
						<img src="img/img-01.jpg" alt="Image" class="img-fluid">
					</div> <span class="position-absolute tm-new-badge">New</span>
					<h2 class="tm-pt-30 tm-color-primary tm-post-title">Simple and
						useful HTML layout</h2>
				</a>
				<p class="tm-pt-30">There is a clickable image with beautiful
					hover effect and active title link for each post item. Left side is
					a sticky menu bar. Right side is a blog content that will scroll up
					and down.</p>
				<div class="d-flex justify-content-between tm-pt-45">
					<span class="tm-color-primary">Travel . Events</span> <span
						class="tm-color-primary">June 24, 2020</span>
				</div>
				<hr>
				<div class="d-flex justify-content-between">
					<span>36 comments</span> <span>by Admin Nat</span>
				</div>
			</article>
			<article class="col-12 col-md-6 tm-post">
				<hr class="tm-hr-primary">
				<a href="post.html" class="effect-lily tm-post-link tm-pt-60">
					<div class=" tm-post-link-inner">
						<img src="img/img-02.jpg" alt="Image" class="img-fluid">
					</div> <span class="position-absolute tm-new-badge">New</span>
					<h2 class="tm-pt-30 tm-color-primary tm-post-title">Multi-purpose
						blog template</h2>
				</a>
				<p class="tm-pt-30">
					<a rel="nofollow" class="underline"
						href="https://templatemo.com/tm-553-xtra-blog" target="_blank">Xtra
						Blog</a> is a multi-purpose HTML CSS template from TemplateMo website.
					Blog list, single post, about, contact pages are included. Left
					sidebar fixed width and content area is a fluid full-width.
				</p>
				<div class="d-flex justify-content-between tm-pt-45">
					<span class="tm-color-primary">Creative . Design . Business</span>
					<span class="tm-color-primary">June 16, 2020</span>
				</div>
				<hr>
				<div class="d-flex justify-content-between">
					<span>48 comments</span> <span>by Admin Sam</span>
				</div>
			</article>
			<article class="col-12 col-md-6 tm-post">
				<hr class="tm-hr-primary">
				<a href="post.html" class="effect-lily tm-post-link tm-pt-20">
					<div class="tm-post-link-inner">
						<img src="img/img-03.jpg" alt="Image" class="img-fluid">
					</div>
					<h2 class="tm-pt-30 tm-color-primary tm-post-title">How can
						you apply Xtra Blog</h2>
				</a>
				<p class="tm-pt-30">
					You are <u>allowed</u> to convert this template as any kind of CMS
					theme or template for your custom website builder. You can also use
					this for your clients. Thank you for choosing us.
				</p>
				<div class="d-flex justify-content-between tm-pt-45">
					<span class="tm-color-primary">Music . Audio</span> <span
						class="tm-color-primary">June 11, 2020</span>
				</div>
				<hr>
				<div class="d-flex justify-content-between">
					<span>24 comments</span> <span>by John Walker</span>
				</div>
			</article>

		</div>
		<div class="row tm-row tm-mt-100 tm-mb-75">
			<div class="tm-prev-next-wrapper">
				<a href="#"
					class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
				<a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
			</div>
			<div class="tm-paging-wrapper">
				<span class="d-inline-block mr-3">Page</span>
				<nav class="tm-paging-nav d-inline-block">
					<ul>
						<li class="tm-paging-item active"><a href="#"
							class="mb-2 tm-btn tm-paging-link">1</a></li>
						<li class="tm-paging-item"><a href="#"
							class="mb-2 tm-btn tm-paging-link">2</a></li>
						<li class="tm-paging-item"><a href="#"
							class="mb-2 tm-btn tm-paging-link">3</a></li>
						<li class="tm-paging-item"><a href="#"
							class="mb-2 tm-btn tm-paging-link">4</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<footer class="row tm-row">
			<hr class="col-12">
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