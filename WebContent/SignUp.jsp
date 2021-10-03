<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SignUp</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->

<!-- 파비콘 -->
<link rel="shortcut icon" href="img/favicon2.ico">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<style type="text/css">
#noneCheck {
	margin-left: 30px;
}
#checkBox {
	font-size: 15px;
	color: dimgrey;
}
#Header {
	color: #D25A53;
	font-weight: bold;
	margin-bottom: 60px;
}
#consentHeader {
	font-weight: bold;
	color: dimgrey;
}
#signUpBtn {
	margin-top: 80px;
	margin-bottom: 80px;
}
#consent {
	margin-top: 100px;
}
#pwHeader {
	width: 500px;
}
#consentError {
	display: block;
	color: red;
	text-align: right;
	font-size: 11px;
	font-weight: normal;
	margin-bottom: -10px;
	margin-right: 15px;
}
#idError, #pwError, #pwCheckError, #nameError {
	width: 0px auto;
	display: inline-block;
	color: red;
	font-size: 11px;
	font-weight: normal;
	margin-left: 10px;
}
#consentBox {
	margin: 0px auto;
	display: block;
	position: relative;
	width: 100%;
	height: 300px;
	border: solid 1px #D25A53;
	border-top-color: #D25A53;
	border-top-style: solid;
	border-top-width: 1px;
	border-right-color: #D25A53;
	border-right-style: solid;
	border-right-width: 1px;
	border-bottom-color: #D25A53;
	border-bottom-style: solid;
	border-bottom-width: 1px;
	border-left-color: #D25A53;
	border-left-style: solid;
	border-left-width: 1px;
	border-image-source: initial;
	border-image-slice: initial;
	border-image-width: initial;
	border-image-outset: initial;
	border-image-repeat: initial;
	padding-top: 10px;
	padding-left: 14px;
	padding-right: 14px;
	box-sizing: border-box;
	background-color: white;
	overflow-y: scroll;
	text-align: justify;
	font-size: 15px;
}
#ftsw {
	font-size: 20px;
	font-weight: bold;
}
.signupt {
	margin-bottom: 0px;
	text-align: left;
	display: block;
	margin-left: 5px;
	font-size: 15px;
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
.fset {
	display: inline-block;
	width: 360px;
}
.checkID {
	margin-top="";
	height: 45px;
	float: right;
}
</style>
<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/Common.js"></script>
<!-- 아이디중복 -->
<script type="text/javascript">
//아이디 유효성 검사(1 = 중복 / 0 != 중복)
/* $("#id").blur(function() {
	// id = "id_reg" / name = "Id"
	var id = $('#id').val();
	$.ajax({
		url : "checkID.ucdo?id="+ id,
		type : 'get',
		success : function(data) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);							
			
			if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					
					if(idJ.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						$("#reg_submit").attr("disabled", false);
			
					} else if(user_id == ""){
						
						$('#id_check').text('아이디를 입력해주세요 :)');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);
					}
					
				}
			}, error : function() {
					console.log("실패");
			}
		});
	}); */
	
	function checkID(id, mail) { // 회원 가입 시 ID 중복 체크하는 함수
/* 		var id = document.getElementById("sid").value;
		var mail = document.getElementById("smail").value; */
		$.ajax({ 
			// [요청 데이터 경로]
			type: "GET", // 단순 정보 조회 시에는 GET, 정보가 너무 많거나 insert/update를 할때는 POST
			url: "checkID.ucdo",	 // "checkID.ucdo?id="+id+"&mail="+mail,
			data:{// 위 컨트롤에 데이터 전송
				id : $("#sid").val(),
				mail : $("#smail").val()
			},
			success: function(data) { 
				//console.log('adasdasd '+data.trim());
				//console.log(data.trim()=="false");
				if (data.trim()=="false") { // 중복 데이터가 없을 때, trim():문자열 공백제거
					console.log(id.value+" "+mail.value);
					alert("사용 가능한 ID입니다.\n잠시후 이메일 인증 팝업창이 실행됩니다.");
					window.open("codeSend.ucdo?id="+id.value+"&mail="+mail.value,'인증처리 페이지','width=800, height=700');
					//emailCheck.jsp?id='+id.value+'&mail='+mail.value,'이메일 인증 ', 'width=500, height=700
				} else {
					alert("존재하는 ID입니다.");
				}
			},
			error: function(xhr) {
				console.log(xhr.status + " : " + xhr.errorText);
				console.log("uri : " + uri);
				alert("에러발생!");
			}
		});
	}
	
	function emptyID(){
		var id = document.getElementById("sid")
		var mail = document.getElementById("smail")

		// id를 입력하지 않았거나, 이메일을 선택하지 않았다면 alert창 띄움
		if (!id.value || mail.value == "이메일 선택") {
			console.log(mail.value);
			alert('아이디 혹은 이메일을 입력해 주세요.');
			id.focus(); // 포커스 이동
			return false;
		}
		else{// 입력되면 id중복확인
			checkID(id, mail); // 함수호출
		}
		
	}
</script>
<!-- 스크립트 불러오기 -->
<script src="SignUp2.js"></script>

</head>
<body>
	<mytag:nonClientSidebar />
	
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
				<h2 id="Header">회원가입</h2>
				<br>

				<form action="signUp.ucdo" method="post"
					class="fset mb-5 tm-comment-form" name="join">
					<div class="mb-4">
						<!-- 이예나: error추가, class check -->
						<p class="signupt">
							아이디
						</p>
						<input class="form-control"
							style="display: inline-block; width: 56%" name="id" id="sid"
							type="text" placeholder="ID" maxlength=15> <span>@</span>
						<select name="mail" id="smail" class="selectEmail">
							<option selected>이메일 선택</option>
							<option>gmail.com</option>
							<option>daum.net</option>
							<option>naver.com</option>
							<option>kakao.com</option>
						</select> 
						<br>
						<!-- 자식 창으로부터 데이터 받아옴 -->
						<input type="hidden" name="idCheck" id="idCheck" value="0">
												
						<input type="button" onclick="emptyID()"
							class="s-btn tm-btn-primary s-btn-small checkID" id="confirm" value="중복인증">						

					</div>
					<div class="mb-4">
						<!-- 이예나: error추가 class check -->
						<p class="signupt" id="pwHeader">
							비밀번호 <span id="pwError"></span>
						</p>
						<input class="form-control check" name="pw" id="pw"
							type="password" placeholder="PW" maxlength=20>
					</div>
					<div class="mb-4">
						<!-- 이예나: error추가  class check-->
						<p class="signupt">
							비밀번호 확인<span id="pwCheckError"></span>
						</p>
						<input class="form-control check" name="pwCheck" id="pwCheck"
							type="password" placeholder="PW" maxlength=20>
					</div>
					<div class="mb-4">
						<!-- 이예나: error추가  class check-->
						<p class="signupt">
							이&nbsp;름<span id="nameError"></span>
						</p>
						<input class="form-control check" name="name" id="name"
							type="text" placeholder="NAME" maxlength=20>
					</div>
					<div class="mb-4" id="consent">
						<p>
							<span id="consentHeader">개인정보 수집/이용동의</span><span
								id="consentError"></span>
						</p>
						<div>
							<span id="consentBox"> <span id="ftsw">개인정보 처리방침</span><span></span>
								<br> ■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. <br>
								- 서비스 제공에 관한, 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 <br> - 고객
								관리: 고객 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입
								의사 확인 , 불만처리 등 민원처리 , 고지사항 전달 <br> - 마케팅 및 광고에 활용 : 이벤트 등
								광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 <br> <br> ■
								수집하는 개인정보 항목 회사는 정보주체가 고객서비스(상담신청, 상담, 서비스 신청 등)를 이용하기 위하여 고객의
								개인 정보를 제공할 때의 서비스 제공을 위한 필수 정보와, 보다 향상된 서비스 제공을 위한 선택정보를 온라인상
								입력방법을 통하여 수집하고 있습니다. 수집하는 개인정보의 범위는 아래와 같습니다. <br> 개인정보
								수집항목 - 필수항목: 이름, 전화번호 , 이메일, 주소 <br> -자동수집 항목 : 접속로그( 주소,
								전화번호, 결제내역 ) 개인정보 수집방법 정보주체는 웹사이트 또는 서면 절차를 통하여 개인정보처리방침과 이용약관
								각각의 내용을 확인하고 ‘동의’ 또는 ‘동의하지 않는다’ 문구를 선택 할 수 있습니다. 정보 주체가 ‘동의’ 문구를
								선택한 경우에는 개인정보 수집에 동의한 것으로 봅니다.
							</span>
						</div>
						<span id="checkBox"> <label><input type="radio"
								id="check" name="check" value="동의">동의</label> <label><input
								type="radio" id="noneCheck" name="check" value="비동의"
								checked="checked">비동의</label>
						</span>
					</div>
					<div class="text-right">
						<input type="submit" id="signUpBtn"
							class="tm-btn tm-btn-primary tm-btn-small" value="sign-up">
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