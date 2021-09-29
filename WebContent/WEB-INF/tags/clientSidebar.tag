<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>



<div class="tm-header" id="tm-header">
	<div class="tm-header-wrapper">
		<button class="navbar-toggler" type="button"
			aria-label="Toggle navigation">
			<i class="fas fa-bars"></i>
		</button>
		<div class="tm-site-header">
			<div class="mb-3 mx-auto">
				<a href="main.pdo"> <img alt="4TeamLogo" src="img/logo.png"
					class="mlogo">
				</a>
			</div>

		</div>
		<nav class="tm-nav" id="tm-nav">
			<ul>
				<li class="tm-nav-item active subCmenu"><a href="main.pdo"
					class="tm-nav-link"> <i class="fas fa-home"></i> Blog Home
				</a> <!--  
                    <a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>인기글</a>
                    <a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>치킨</a>
                    <a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>피자</a>
                    <a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>햄버거</a>
                   	<a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>한식</a>
                   	<a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>중식</a>
                   	<a href="#" class="tm-nav-link"> <i class="fas fa-home"></i>일식</a>
                    --></li>
				<li class="tm-nav-item"><a href="InsertPost.jsp"
					class="tm-nav-link"> <i class="fas fa-pen"></i> Posting
				</a></li>

				<li class="tm-nav-item"><a href="#"
					onclick="checkAlert('logOut.ucdo?pnum=${param.pnum}','로그아웃하시겠어요???')"
					class="tm-nav-link"> <i class="fas fa-users"></i> Logout
				</a></li>
				<li class="tm-nav-item"><a href="MyPage.jsp"
					class="tm-nav-link"> <i class="far fa-comments"></i> MyPage
				</a></li>
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
</div>
