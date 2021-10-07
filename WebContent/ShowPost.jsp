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
<title>Post</title>

<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<!-- 파비콘 -->

<link rel="shortcut icon" href="img/favicon2.ico">

<script src="js/Common.js"></script>
<script type="text/javascript">
		 window.onload = function(){
			 //window.scrollTo({top:500, behavior:"smooth"}); // 스크롤 조절기능(댓글창 이동)
			 actRemove();
			 var main = $('#main'); // main , showPost, selectList 에 넣어야함, 이 친구들은 myActive로 넣어야함
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
					<div class="mb-4">
						<h2 class="pt-2 tm-color-primary tm-post-title" id="title">${singlePost.title}</h2>
						<p class="tm-mb-40">${singlePost.pdate} posted by
							${singlePost.writer}</p>
						<p>${singlePost.content}</p>
						<span class="d-block text-right tm-color-primary">Category
							. ${singlePost.category}</span> <br> <br>

						<!-- 좋아요버튼 -->
						<mytag:likeBtn />
						<br> <br>
						<c:choose>
							<c:when test="${userInfoData.id==singlePost.p_user}">
								<div class="text-right">

									<button
										onclick="location.href='editPost.pdo?pnum=${singlePost.pnum}';actChange('#main');"
										class="tm-btn tm-btn-primary tm-btn-small">글 수정</button>
									<button
										onclick="checkAlert('deletePostDB.pdo?pnum=${singlePost.pnum}','게시글을 삭제하시겠어요?')"
										class="tm-btn tm-btn-primary tm-btn-small">글 삭제</button>

								</div>
							</c:when>
						</c:choose>
					</div>

					<!-- Comments -->

					<div>
						<c:set var="index" value="0" />
						<h2 class="tm-color-primary tm-post-title">Comments</h2>
						<hr class="tm-hr-primary tm-mb-45">
						<c:forEach var="datas" items="${postOne_comments}">
							<c:set var="cl" value="${datas.comment}" />
							<!-- 변수설정 > index별 멤버변수 접근가능 -->

							<div class="tm-comment tm-mb-45">
								<figure class="tm-comment-figure">
									<img src="${cl.cprofileImage}"
										alt="${cl.c_user} 프로필사진"
										class="mb-2 rounded-circle img-thumbnail" width="100px">
									<figcaption class="tm-color-primary text-center">${cl.cwriter}</figcaption>
								</figure>
								<div class="cwidth">

									<!-- 평상시 코멘트내용 -->
									<p id="pcmsg${index}">${cl.cment}</p>
									
									<!-- 수정시 textarea나오게 설정 -->
									<form action="editComment.ucdo" method="post"
										class="mb-5 tm-comment-form">
										<div>
										<input type="hidden" name="c_post" value="${singlePost.pnum}">
										<input type="hidden" name="c_user" value="${userInfoData.id}">
										<input type="hidden" name="cwriter"
											value="${userInfoData.name}"> <input type="hidden"
											name="cnum" value="${cl.cnum}"> <input type="hidden"
											name="pcmsg" value="${index}">
										<textarea id="ucmsg${index}" class="crset dnone form-control"
											name="cment" rows="6" required>${cl.cment}</textarea>
										<div class="text-right marginTop">
											<button type="submit" id="uButton${index}"
												class="uButton tm-btn tm-btn-primary tm-btn-small Edit">댓글수정</button>
												<%-- <button type="submit" id="uButton${index}"
												class="dnone tm-btn tm-btn-primary tm-btn-small">댓글수정</button> --%>
										</div>
										</div>
									</form>
									<p class="text-right" style="color: red" id="clike">
										<a href="likeUpComment.ucdo?pnum=${singlePost.pnum}&cnum=${cl.cnum}"><i class='far fa-heart'></i></a>&nbsp${cl.clikeCnt}
									</p>
									<!-- <p class="text-right dnone" style="color: red">
										<i class='fas fa-heart' id="clikeUp"></i>&nbsp${cl.clikeCnt}
									</p> -->
									<div id="cOption${index}"
										class="d-flex justify-content-between">
										<!-- 비회원일때 -->
										<c:choose>
											<c:when test="${userInfoData.id==null}">
												<a href="#"
													onclick="checkAlert('Login.jsp','답글을 등록하시려면 로그인을해야합니다.\n로그인창으로 가시겠어요?')"
													class="tm-color-primary">답글</a>
											</c:when>
										</c:choose>
										<!-- 로그인상태일때 답글버튼 활성화 -->
										<c:choose>
											<c:when test="${userInfoData.id!=null}">
												<a href="javascript:void(0);" onclick="rmsgInsert(${index})"
													class="tm-color-primary">답글</a>
											</c:when>
										</c:choose>
										<!-- 로그인세션의 id와 글쓴이의 id가 같을경우만 수정삭제가능 -->
										<c:choose>
											<c:when test="${userInfoData.id==cl.c_user}">
												<a href="javascript:void(0);" onclick="msgEdit(${index})"
													class="tm-color-primary">수정</a>
												<a href="#"
													onclick="checkAlert('deleteComment.ucdo?cnum=${cl.cnum}&replyCnt=${cl.replyCnt}&c_post=${singlePost.pnum}&index=${index}','댓글을 삭제하시겠어요?')"
													class="tm-color-primary">삭제</a>
											</c:when>
										</c:choose>
										<span class="tm-color-primary"> ${cl.cdate}</span>
									</div>
								</div>

							</div>
							<!-- 답글달기 -->
							<c:set var="rindex" value="0" />
							<div class="rwidth tm-comment-reply tm-mb-45 marginLeft dnone"
								id="crInsert${index}">
								<form action="insertReply.ucdo" method="post"
									class="mb-5 tm-comment-form">
									<div class="tm-comment">
										<input type="hidden" name="rwriter"
											value="${userInfoData.name}"> <input type="hidden"
											name="r_user" value="${userInfoData.id}"> <input
											type="hidden" name="r_post" value="${singlePost.pnum}">
										<input type="hidden" name="rprofileImage" value="${userInfoData.profile}">
										<input type="hidden" name="r_comments" value="${cl.cnum}">
										<input type="hidden" name="prmsg" value="${rindex}">
										<textarea id="ucmsg${index}" class="rset form-control"
											name="rment" rows="6" required></textarea>
									</div>
									<div class="text-right marginTop">
										<button type="submit"
											class="tm-btn tm-btn-primary tm-btn-small">답글등록</button>
									</div>
								</form>
							</div>



							<!-- 답글(reply) -->

							<c:forEach var="rl" items="${datas.rlist}">
								<div class="tm-comment-reply tm-mb-45">
									<hr>
									<div class="tm-comment">
										<figure class="tm-comment-figure">
											<img src="${rl.rprofileImage}"
												alt="${rl.r_user} 프로필사진"
												class="mb-2 rounded-circle img-thumbnail" width="100px">
											<figcaption class="tm-color-primary text-center">${rl.rwriter}</figcaption>
										</figure>
										<p id="prmsg${rindex}">${rl.rment}</p>

										<!-- 수정버튼 클릭시 변화되는 코드들 -->
										<form action="editReply.ucdo" method="post"
											class="mb-5 tm-comment-form">
											<div class="tm-comment ">
												<input type="hidden" name="r_post"
													value="${singlePost.pnum}"> <input type="hidden"
													name="rnum" value="${rl.rnum}"> <input
													type="hidden" name="index" value="">
												<!-- ${index} -->
												<textarea id="urmsg${rindex}"
													class="rset dnone form-control urmsgSet" name="rment" rows="6"
													required>${rl.rment}</textarea>
											</div>
											<div class="text-right marginTop">
												<button type="submit" id="urButton${rindex}"
													class="uButton tm-btn tm-btn-primary tm-btn-small">답글수정</button>
											</div>
										</form>
									</div>
									<p class="text-right" style="color: red">
										<i class='far fa-heart'></i>&nbsp0
									</p>
									<p class="text-right dnone" style="color: red">
										<i class='fas fa-heart'></i>&nbsp0
									</p>
									
										
										<!-- 비회원일 경우 날자만 보임 -->
										<c:choose>
											<c:when test="${userInfoData.id==null}">
												<div class="text-right">
													<span class="tm-color-primary"> ${rl.rdate}</span>
												</div>
											</c:when>
										</c:choose>

										<!-- 로그인세션의 id와 글쓴이의 id가 같을경우만 수정삭제가능 -->
										<c:choose>
											<c:when test="${userInfoData.id==cl.c_user}">
											<div id="rOption${rindex}"
										class="d-flex justify-content-between rmsgOption">
												<a href="javascript:void(0);" onclick="rmsgEdit(${rindex})"
													class="tm-color-primary">수정</a>
												<a href="#"
													onclick="checkAlert('deleteReply.ucdo?rnum=${rl.rnum}&r_post=${singlePost.pnum}&rindex=${rindex}','답글을 삭제하시겠어요?')"
													class="tm-color-primary">삭제</a>
												<span class="tm-color-primary"> ${rl.rdate}</span>
												</div>
											</c:when>
										</c:choose>
									


									<span class="d-block text-right tm-color-primary"></span>
								</div>
								<!-- 답글에서 답글달기2 => 답글에서 답글다는기능 삭제
								<div class="tm-comment-reply tm-mb-45 marginLeft dnone" id="rInsert${rindex}">		
								<form action="insertReply.ucdo" method="post" class="mb-5 tm-comment-form inlineBlock">
								<div class="tm-comment">
								<input type="hidden" name="rwriter" value="${userInfoData.name}">
								<input type="hidden" name="r_user" value="${userInfoData.id}">
								<input type="hidden" name="r_post" value="${singlePost.pnum}">
								<input type="hidden" name="r_comments" value="${cl.cnum}">
								<input type="hidden" name="prmsg" value="${rindex}">
									<textarea id="urmsg${rindex}" class="rset form-control"
										name="rment" rows="6" required></textarea>
								</div>
								<div class="text-right marginTop">
									<button type="submit"
										class="tm-btn tm-btn-primary tm-btn-small">답글등록</button>
								</div>
								</form>
							</div>-->
								<c:set var="rindex" value="${rindex+1}" />
							</c:forEach>
							<c:set var="index" value="${index+1}" />
							<br>
						</c:forEach>

						<c:choose>
							<c:when test="${userInfoData!=null}">
								<form action="insertComment.ucdo" method="post"
									class="mb-5 tm-comment-form">
									<input type="hidden" name="c_post" value="${singlePost.pnum}">
									<input type="hidden" name="c_user" value="${userInfoData.id}">
									<input type="hidden" name="cprofileImage" value="${userInfoData.profile}">
									
									<input type="hidden" name="cwriter"
										value="${userInfoData.name}"> <input type="hidden"
										name="pcmsg" value="0">
									<h2 class="tm-color-primary tm-post-title mb-4">Your
										comment</h2>

									<div class="mb-4">  <!-- id="crset" -->
										<textarea class="crset form-control" name="cment" rows="6"
											required></textarea>
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
								<button
									onclick="checkAlert('Login.jsp','댓글을 등록하시려면 로그인을해야합니다.\n로그인창으로 가시겠어요?')"
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