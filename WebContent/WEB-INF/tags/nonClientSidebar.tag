<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="type"%>


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
				<li class="tm-nav-myitem myActive" onclick="actChange('#mainmenu')"
					id="main"><a href="main.pdo" class="tm-nav-link"> <i
						class="fas fa-home"></i> Blog Home
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인기글
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치킨
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;피자
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;햄버거
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;한식
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중식
				</a> <a href="#" class="tm-nav-option">&nbsp;&nbsp; <i
						class="fas fa-home"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일식
				</a></li>

				<li class="tm-nav-item"><a href="#" onClick="forbid()"
					class="tm-nav-link"> <i class="fas fa-pen"></i> Posting
				</a></li>
				<c:choose>
					<c:when test="${singlePost!=null}">
						<li class="tm-nav-item" id="loginSignUp"><a
							href="Login.jsp?pnum=${singlePost.pnum}" class="tm-nav-link">
								<i class="fas fa-users"></i> Login / Sign-up
						</a>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${singlePost==null}">
						<li class="tm-nav-item" id="loginSignUp"><a href="Login.jsp"
							class="tm-nav-link"> <i class="fas fa-users"></i> Login /
								Sign-up
						</a>
					</c:when>
				</c:choose>


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
