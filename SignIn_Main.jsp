
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function check() {
	if(fo.id.value == "") {
		alert('아이디를 입력해주세요.');
		fo.id.focus();
		return false;
	}
	
	if(fo.password.value == "") {
		alert('비밀번호를 입력해주세요.');
		fo.password.focus();
		return false;
	}
	
	if(fo.address.value == "") {
		alert('주소를 입력해주세요.');
		fo.address.focus();
		return false;
	}
	
	if(fo.phonenumber.value == "") {
		alert('휴대폰 번호를 입력해주세요.');
		fo.phonenumber.focus();
		return false;
	}
}
</script>

</head>
<body>
	<form action="SignIn.jsp" method="post" name = "fo" onsubmit="return check()">
		<h1>회원 가입 폼</h1>
		<hr>
		<table>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="id"></td>
			</tr>

			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="password"></td>
			</tr>

			<tr>
				<td>이름 :</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr>
				<td>나이 :</td>
				<td><input type="text" name="age"></td>
			</tr>

			<tr>
				<td>성별 :</td>
				<td><input type="text" name="sex"></td>
			</tr>

			<tr>
				<td>직업 :</td>
				<td><input type="text" name="job"></td>
			</tr>

			<tr>
				<td>주소 :</td>
				<td><input type="text" name="address"></td>
			</tr>

			<tr>
			
				<td>휴대폰번호 :</td>
				<td><input type="text" name="phonenumber"></td>
			</tr>

			<tr>
				<td><input type="submit" value="회원등록" onclick="history.back()"></td>
			</tr>
	
		</table>
	</form>

</body>
</html>