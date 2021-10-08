<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${category} 모아보기</title>
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

<script src="js/Common.js"></script>
<script type="text/javascript">
window.onload = function(){
	 
	actRemove();
	 var main = $('main'); // main , showPost, selectList 에 넣어야함, 이 친구들은 myActive로 넣어야함
	 main.addClass("myActive");
	 
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
		<mytag:searchPost />
		<div class="row tm-row">
			<c:forEach var="pl" items="${PostList}" varStatus="i">
				<article class="col-12 col-md-6 tm-post">
					<hr class="tm-hr-primary">

					<a href="selectOne.pdo?pnum=${pl.pnum}" onclick="actChange('#main')"
						class="effect-lily tm-post-link tm-pt-60">

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
						<span>${pl.comCnt} comments</span> <span>by
							${pl.writer}</span>
					</div>
				</article>
			</c:forEach>
		<mytag:paging isFirst="${isFirst}" url="findpost.pdo"
			isLast="${isLast}" pagingIndex="${pagingIndex}" />
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
	<a href="tagtest.jsp?pnum=1">실험용쥐</a>
	<script src="js/jquery.min.js"></script>
	<script src="js/templatemo-script.js"></script>
</body>
</html>