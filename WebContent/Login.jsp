<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xtra Blog</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<!--
    
TemplateMo 553 Xtra Blog

https://templatemo.com/tm-553-xtra-blog

-->
</head>
<body>
	<header class="tm-header" id="tm-header">
		<div class="tm-header-wrapper">
			<button class="navbar-toggler" type="button"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>
			<div class="tm-site-header">
                <div class="mb-3 mx-auto"><img alt="4TeamLogo" src="img/logo.png"></div>            
                
            </div>
			<nav class="tm-nav" id="tm-nav">			
				<ul>
					<li class="tm-nav-item"><a href="index.html"
						class="tm-nav-link"> <i class="fas fa-home"></i> Blog Home
					</a></li>
					<li class="tm-nav-item"><a href="posting.jsp"
						class="tm-nav-link"> <i class="fas fa-pen"></i> Posting
					</a></li>
					<li class="tm-nav-item active"><a href="about.html"
						class="tm-nav-link"> <i class="fas fa-users"></i> Login /
							Sign-up
					</a></li>
					<li class="tm-nav-item"><a href="contact.html"
						class="tm-nav-link"> <i class="far fa-comments"></i> Contact
							Us
					</a></li>
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
			<p class="tm-mb-80 pr-5 text-white">Xtra Blog is a multi-purpose
				HTML template from TemplateMo website. Left side is a sticky menu
				bar. Right side content will scroll up and down.</p>
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
			<div style="text-align:center;" class="col-12">
				<hr class="tm-hr-primary tm-mb-55">
				<!-- login form -->
								
					<form action="userComment_Ctrl.jsp?action=joinUs" method="post" style="display:inline-block;" class="mb-5 tm-comment-form" >
						<div class="mb-4">
							<input class="form-control lwidth" style="width:360px" name="id" type="text" placeholder="ID">
						</div>
						<div class="mb-4">
							<input class="form-control" name="pw" type="password" placeholder="PW">
						</div>
						<div class="text-right">
							<button type="submit" class="tm-btn tm-btn-primary tm-btn-small">login</button>
						</div>
						<div class="mb-4">
							<a style="text-align:left;" href="#">id/pw찾기</a>
							<a class="text-right" href="SignUp.jsp">회원가입</a>
						</div>
					</form>									
			</div>
		</div>
		
		<footer class="row tm-row" style="position:fixed; bottom:0; width:80%;">
                <div class="col-md-6 col-12 tm-color-gray">
                    Design: <a rel="nofollow" target="_parent" href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
                </div>
                <div class="col-md-6 col-12 tm-color-gray tm-copyright">
                    Copyright 2020 Xtra Blog Company Co. Ltd.
                </div>
            </footer>
		
		</main>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/templatemo-script.js"></script>
</body>
</html>