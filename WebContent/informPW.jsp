<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>infoHelp</title>
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
.outer{
	display:flex;
	align-items:center;
	flex-direction:row;
	justify-content: center;
}
.inner{
	position:absolute;
	top:50%;
	left:50%;
	transform: translate(-50%,-50%);
}
.fset{
	display:inline-block;
	width: 360px;
}
.txtleft{
	text-align:left;
}
</style>
</head>
<body>
	<div class="outer">
		<div class="inner">
 											
						<div class="mb-4">
							<span>비밀번호</span><input class="form-control" type="text" value="${findUser.pw}1234" readonly>
						</div>												
						<div class="mb-4 btw">
							<a class="txtleft" href="findID.jsp">ID찾기</a>							
						</div>
								
		</div>
	</div>

</body>
</html>