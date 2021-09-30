<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<div class="wrapper">
	<div class="imagebox">
		<img alt="${userInfo.id}_profile" src="${usereInfo.profile}">
	</div>
	<form method="post" enctype="multipart/form-data" action="#">
		<div class="fileUpLoad">
		<p>userInfo : ${userInfo}</p>
			<input type="file" name="${userInfo.id}_profile"> <input
				type="submit" value="업로드!">
		</div>
	</form>
</div>