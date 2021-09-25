<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyPage</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
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

#ftsw {
	font-size: 20px;
	font-weight: bold;
}

.signupt {
	text-align: left;
	display: block;
	margin-left: 10px;
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
function delUser(){
	result=confirm("회원탈퇴 하시겠습니까?");
	if(result==true){
		document.form4.action.value="deleteUser.ucdo";
		document.form4.submit();
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
					<li class="tm-nav-item "><a href="main.ucdo"
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
							<li class="tm-nav-item active"><a href="Login.jsp"
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
							<li class="tm-nav-item active"><a href="MyPage.jsp"
								class="tm-nav-link"> <i class="far fa-comments"></i> MyPage
							</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
			<div class="tm-mb-65">
				<a href="https://facebook.com" class="tm-social-link"> <i
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
			<div class="col-12">
				<hr class="tm-hr-primary tm-mb-55">

			</div>
		</div>
		<div class="row tm-row">
			<div class="col-lg-8 tm-post-col">
				<div class="tm-post-full">
					<div style="text-align: center;" class="col-12">

						<h2 style="color: #D25A53;">내 정보</h2>
						<br>
						<!-- MyPage -->
						<div style="display: inline-block;" class="mb-5 tm-comment-form">
							<div class="mb-4">
								<span class="signupt">아이디</span> <input class="form-control"
									style="width: 360px" name="id" type="text" placeholder="ID"
									value="${userInfoData.id}" readonly>
							</div>
							<div class="mb-4">
								<span class="signupt">비밀번호</span> <input class="form-control"
									name="pw" type="password" placeholder="PW"
									value="${userInfoData.pw}" readonly>
							</div>
							<div class="mb-4">
								<span class="signupt">이&nbsp;름</span> <input
									class="form-control" name="name" type="text" placeholder="NAME"
									value="${userInfoData.name}" readonly>
							</div>
						</div>
					</div>


				</div>
			</div>
			<aside class="col-lg-4 tm-aside-col">
				<div class="tm-post-sidebar">
					<hr class="mb-3 tm-hr-primary">
					<h2 class="mb-4 tm-post-title tm-color-primary">Categories</h2>
					<ul class="tm-mb-75 pl-5 tm-category-list">
						<li><a href="#" class="tm-color-primary">내 게시글보기</a></li>
						<li><a href="UdateUser.jsp" class="tm-color-primary">회원정보
								변경</a></li>
						<li>
							<form method="post" name="form4">
								<input type="hidden" name="id" value="${userInfoData.id}">
								<a href="#" onclick="delUser()" class="tm-color-primary">회원탈퇴</a>
							</form>
						</li>

					</ul>
					<hr class="mb-3 tm-hr-primary">
					<h2 class="tm-mb-40 tm-post-title tm-color-primary">좋아요 누른 게시글</h2>
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