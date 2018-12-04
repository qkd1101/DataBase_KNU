<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script>
function check_same() {
	if(fo.password1.value != fo.password2.value) {
		alert('비밀번호가 다릅니다.');
		fo.password1.value = "";
		fo.password2.value = ""
		fo.password1.focus();
		return false;
	}
}
</script>
</head>
<body>
	<form action="PwChange.jsp" method="post" name="fo" onsubmit="return check_same()">
		<h1>PW 수정</h1>
		<hr>
		<table>

			<tr>
				<td>변경할 비밀번호 :</td>
				<td><input type="password" name="password1"></td>
			</tr>

			<tr>
				<td>비밀번호 확인 :</td>
				<td><input type="password" name="password2"></td>
			</tr>

			<tr>
				<td><input type="submit" value="비밀번호 변경"></td>
			</tr>
		</table>
	</form>

</body>
</html>