<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Posting</title>
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
#PostingBox {
	display: block;
	width: 1000px;
	resize:none;
}

#PostingSubject {
	width: 100%;
	border-color: white;
	font-size: 25px;
}

#PostingContent {
	height: 800px;
}

.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
</style>

<script src="js/Common.js"></script>
<script type="text/javascript">
window.onload = function(){
	 
	 actRemove();
		var posting = $('#posting');
		posting.addClass("active");
	 
	 
}
</script>
</head>
<body>
	<mytag:clientSidebar/>
	<div class="container-fluid">
		<main class="tm-main"> <!-- Search form -->
		<mytag:searchPost />
		<div class="row tm-row tm-mb-45">
			<div class="col-12">
				<hr class="tm-hr-primary tm-mb-55">
			</div>

		</div>
		<div class="row tm-row tm-mb-40">
			<div class="col-12">
				<div class="mb-4">
					<h2 class="pt-2 tm-mb-40 tm-color-primary tm-post-title"
						class="lmargin">포스팅하기</h2>
					<form action="insertPostDB.pdo" method="post" id="PostingBox" enctype="multipart/form-data"
						class="mb-5 ctext">

						<input type="hidden" name="writer" value="${userInfoData.name}">
						<input type="hidden" name="p_user" value="${userInfoData.id}">
						<div class="mb-4">
							<input id="PostingSubject" class="form-control" name="title"
								type="text" placeholder="제목을 입력하세요">

						</div>
						<hr class="tm-hr-mycss">
						<div class="mb-4">
							<label class="col-sm-3 col-form-label tm-color-primary">내용</label>
							<textarea id="PostingContent" class="form-control mr-0 ml-auto"
								name="content" id="message" rows="8" required></textarea>
						</div>
						<div class="mb-4">
							<label class=" col-form-label tm-color-primary"
								style="font-size: 28px;">category</label> <select
								name="category" id="selectInsert">
								<option selected>치킨</option>
								<option>피자</option>
								<option>햄버거</option>
								<option>한식</option>
								<option>중식</option>
								<option>일식</option>
							</select>
						</div>
						
						<div class="filebox">
					    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
					    <label for="file">파일찾기</label>
					    
						<input type = "file" name="filename1" id="file" class="dnone">
						</div>
						
						<div class="text-right">
								
						
							<button type="submit" class="tm-btn tm-btn-primary tm-btn-small">글
								등록하기</button>
						</div>
					</form>

				</div>
			</div>
		</div>
		<div class="row tm-row tm-mb-60">
			<div class="col-12">
				<hr class="tm-hr-primary  tm-mb-55">
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