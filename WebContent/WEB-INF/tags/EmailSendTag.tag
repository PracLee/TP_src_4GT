<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%!public int getRandom() {
		int random = 0;
		random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
		return random;
	}%>
<form action="codeSend.ucdo" method="post" id="emailsend">
	<table>
		<tr>
			<td><input type="text" id="receiver" name="receiver"
				placeholder="E-Mail을 입력하세요"></td>
			<td><input type="submit" id="submit" value="Send"></td>
			<td><input type="hidden" readonly="readonly" name="code_check"
				id="code_check" value="<%=getRandom()%>"></td>
		</tr>
	</table>
</form>