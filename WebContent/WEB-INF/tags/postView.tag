<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="info" required="true" type = "java.util.ArrayList"%>
<c:forEach var="pl" items="${info}">
	<article class="col-12 col-md-6 tm-post">
		<hr class="tm-hr-primary">
		<a href="selectOne.pdo?pnum=${pl.pnum}"
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
			<span class="tm-color-primary postCate">Category . ${pl.category}</span> <span
				class="tm-color-primary postCate">${pl.pdate}</span>
		</div>
		<hr>
		<div class="d-flex justify-content-between">
			<span class="postInfo">${pl.comCnt} comments</span><span class="postInfo">${pl.plike} Likes</span><span class="postInfo">${pl.views} Views</span> <span class="byUser">Post by ${pl.writer}</span>
		</div>

	</article>
</c:forEach>