<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<div class="wrapper">
	<div class="imagebox">
		<img alt="${userInfoData.id}_profile" src="${userInfoData.profile}">
	</div>
	<form method="post" enctype="multipart/form-data" action="userProfileEdit.ucdo">
		<div class="fileUpLoad">
		<p>userInfo : ${userInfoData}</p>
			<input type="file" name="filename1"> <input
				type="submit" value="업로드!"> 
		</div>
	</form>
</div>