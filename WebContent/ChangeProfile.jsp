<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8">
<title>프로필사진 변경창</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/templatemo-xtra-blog.css" rel="stylesheet">
<link rel="shortcut icon" href="img/favicon2.ico">

<style type="text/css">
@import url("css/4GT_CSS.css");
.textCenter{
	text-align:center;
}
.CPmarLeft{
	margin-left:60px;
}

</style>

<!-- 자바스크립트 -->
<!-- JQuery -->
 <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#filename").on('change', function(){
                readURL(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
                  $('#preImage').attr('src', e.target.result);
               }
               reader.readAsDataURL(input.files[0]);
            }
        }
</script>
<!-- 이메일 중복체크 -->
<script src="js/emailCheck.js"></script>


</head>
<body>
	<div class="outer">
		<div class="inner">
			<form method="post" enctype="multipart/form-data"
			action="userProfileEdit.ucdo" class="fset textCenter mb-5 tm-comment-form">

				<div class="mb-4">					
					<div class="col-12">
						<img src="${userInfoData.profile}" alt="${userInfoData.id}_프로필사진" class="img-fluid"
							width="200px" id="preImage">
					</div>
					<br>
					<input type="file" class="CPmarLeft"name="filename1" id="filename" onchange="readImage(event)">
						<br>
						<button type="submit" 
						class="s-btn tm-btn-primary s-btn-small checkID" id="confirm"
						>변경 적용하기</button>
						
				</div>
			</form>
			
		</div>
	</div>

</body>
</html>