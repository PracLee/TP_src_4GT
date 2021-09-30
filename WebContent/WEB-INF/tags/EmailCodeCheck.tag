<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="code" required="true"%>
<script type="text/javascript">
	function checkCode() {
		var v1 = document.getElementById('checkEmail').code_check.value;
		var v2 = document.getElementById('checkEmail').code.value;
		if (v1 != v2) {
			document.getElementById('checkMailCode').style.color = "red";
			document.getElementById('checkMailCode').innerHTML = "잘못된 인증번호";
			makeNull();
		} else {
			document.getElementById('checkMailCode').style.color = "blue";
			document.getElementById('checkMailCode').innerHTML = "인증이 완료되었습니다";
			makeReal();
		}
	}
	function makeReal() {
		var FinishCheck = document.getElementById('FinishCheck');
		FinishCheck.type = "submit";
	}
	function makeNull() {
		var FinishCheck = document.getElementById('FinishCheck');
		FinishCheck.type = "hidden";
	}
</script>
<form id="checkEmail" action="javascript:getPassord()">
	<table>
		<tr>
			<td>인증번호</td>
			<td><input type="text" name="code" id="code"
				onkeyup="checkCode()" placeholder="인증번호를 입력하세요."></td>
			<td><input type="hidden" readonly="readonly" name="code_check"
				id="code_check" value="${code}">
				<div id="checkMailCode"></div></td>
		</tr>
	</table>
	<input type="hidden" id="FinishCheck" value="인증하기">
</form>