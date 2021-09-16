<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Xtra Blog</title>
	<link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
	<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
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
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>            
                <h1 class="text-center">Xtra Blog</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item"><a href="index.html" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a></li>
                    <li class="tm-nav-item active"><a href="InsertPost.jsp" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        Posting
                    </a></li>
                    <li class="tm-nav-item"><a href="login.html" class="tm-nav-link">
                        <i class="fas fa-users"></i>
                        Login /	Sign-up
                    </a></li>
                    <li class="tm-nav-item"><a href="post_ctrl.jsp?action=post" class="tm-nav-link">
                        <i class="far fa-comments"></i>
                        Category / 임시
                    </a></li>
                </ul>
            </nav>
            <div class="tm-mb-65">
                <a href="https://facebook.com" class="tm-social-link">
                    <i class="fab fa-facebook tm-social-icon"></i>
                </a>
                <a href="https://twitter.com" class="tm-social-link">
                    <i class="fab fa-twitter tm-social-icon"></i>
                </a>
                <a href="https://instagram.com" class="tm-social-link">
                    <i class="fab fa-instagram tm-social-icon"></i>
                </a>
                <a href="https://linkedin.com" class="tm-social-link">
                    <i class="fab fa-linkedin tm-social-icon"></i>
                </a>
            </div>
            <p class="tm-mb-80 pr-5 text-white">
                Xtra Blog is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
            </p>
        </div>
    </header>
    <div class="container-fluid">
        <main class="tm-main">
            <!-- Search form -->
            <div class="row tm-row">
                <div class="col-12">
                    <form method="GET" class="form-inline tm-mb-80 tm-search-form">                
                        <input class="form-control tm-search-input" name="query" type="text" placeholder="Search..." aria-label="Search">
                        <button class="tm-search-button" type="submit">
                            <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                        </button>                                
                    </form>
                </div>                
            </div>            
            <div class="row tm-row tm-mb-45">
                <div class="col-12">
                    <hr class="tm-hr-primary tm-mb-55">
              
                    
                </div>
                
            </div>
            <div class="row tm-row tm-mb-40">
                <div class="col-12">                    
                    <div class="mb-4">
                        <h2 class="pt-2 tm-mb-40 tm-color-primary tm-post-title" class="lmargin">포스팅 수정</h2>
                        <form action="post_ctrl.jsp?action=editPostDB" method="post" style="display:block; width:1000px;" class="mb-5 ctext" >
						<input type="hidden" name="writer" value="${userInfoData.name}">
						<input type="hidden" name="p_user" value="${userInfoData.id}">
						<div class="mb-4">						
							<input class="form-control" style="width:100%; border-color:white; font-size:25px;" name="title" 
							type="text" placeholder="제목을 입력하세요" value="${PostVO.title}">
							
						</div>
						 <hr class="tm-hr-mycss">												
						<div class="mb-4">
						<label class="col-sm-3 col-form-label tm-color-primary">내용</label>
                                <textarea class="form-control mr-0 ml-auto" name="content" id="message" rows="8" 
                                required style="height:800px;">${PostVO.content}</textarea>                                
                            </div>
                        <div class="mb-4">
						<label  class=" col-form-label tm-color-primary" style="font-size:28px;">category</label>							
							<select name="category">
								<option ${PostVO.category=='치킨' ? 'selected':'' }>치킨</option>								
								<option ${PostVO.category=='피자' ? 'selected':'' }>피자</option>
								<option ${PostVO.category=='햄버거' ? 'selected':'' }>햄버거</option>
								<option ${PostVO.category=='한식' ? 'selected':'' }>한식</option>
								<option ${PostVO.category=='중식' ? 'selected':'' }>중식</option>
								<option ${PostVO.category=='일식' ? 'selected':'' }>일식</option>
							</select>
						</div>    
						<div class="text-right">
							<button type="submit" class="tm-btn tm-btn-primary tm-btn-small">글 수정하기</button>
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