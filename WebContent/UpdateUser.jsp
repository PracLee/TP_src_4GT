<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<script src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UpdateUser</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">

<!-- 파비콘 -->
<link rel="shortcut icon" href="img/favicon2.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<style type="text/css">
#ftsw {
	font-size: 20px;
	font-weight: bold;
}

.signupt {
	text-align: left;
	display: block;
	margin-left: 10px;
}

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
<script src="js/Common.js"></script>
<script type="text/javascript">
window.onload = function(){
	 
	 actRemove();
		var myPage = $('#myPage');
		myPage.addClass("active"); 
	 
}
</script>
</head>
<body>
	<mytag:clientSidebar/>
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
			<div style="text-align: center;" class="col-12">
				<hr class="tm-hr-primary tm-mb-55">
				<h2 style="color: #D25A53;">회원정보변경</h2>
				<br>
				<!-- signUp form -->
				<form action="updateUser.ucdo" method="post"
					style="display: inline-block;" class="mb-5 tm-comment-form">
					<div class="mb-4">
						<span class="signupt">아이디</span> <input class="form-control"
							style="width: 360px" name="id" type="text" placeholder="ID" value="${userInfoData.id}" readonly>
					</div>
					<div class="mb-4">
						<span class="signupt">비밀번호</span> <input class="form-control"
							name="pw" type="text" placeholder="PW" value="${userInfoData.pw}">
					</div>					
					<div class="mb-4">
						<span class="signupt">이&nbsp;름</span> <input class="form-control"
							name="name" type="text" placeholder="NAME" value="${userInfoData.name}">
					</div>
					<div class="text-right">
						<button type="submit" class="tm-btn tm-btn-primary tm-btn-small">정보수정</button>
					</div>
				</form>
			</div>

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