<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ attribute name="code" required="true"%>
<script type="text/javascript">
	function checkCode() {
		console.log(opener.document.getElementById("idCheck").value);
		var v1 = document.getElementById('checkEmail').code_check.value;
		var v2 = document.getElementById('checkEmail').code.value;
		if (v1 != v2) {
			document.getElementById('checkMailCode').style.color = "red";
			document.getElementById('checkMailCode').innerHTML = "잘못된 인증번호";
		} else {
			console.log('13123');
			
			// 부모창에게 데이터 전달 - 부모의 태그 id에 접근하여 value 작성
			opener.document.getElementById("idCheck").value="true";
			// 부모창 인증체크 버튼 remove
			opener.document.getElementById("confirm").remove();
			// 부모창 id 입력방지(readonly)
			opener.document.getElementById("sid").setAttribute("readonly", true);
			// 부모창 mail select 선택방지(disabled) 
			opener.document.getElementById("smail").setAttribute("disabled", true);
			
			alert('인증이 완료되었습니다.');
			window.close();
			
			//document.getElementById('checkMailCode').style.color = "blue";
			/*alert('인증이 완료되었습니다.\n엔터를 클릭해주세요.');
			var FinishCheck = document.getElementById('FinishCheck');
			FinishCheck.type = "submit";
			console.log(FinishCheck);
			console.log(document.getElementById('form1'));
			console.log(document.form1);
			document.form1.submit();			*/
			//document.getElementById('checkMailCode').innerHTML = "인증이 완료되었습니다";
			//makeReal();
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
<form action="#" id="checkEmail">
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
</form>