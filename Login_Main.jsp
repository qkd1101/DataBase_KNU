<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 화면</h1>
	<hr>
	<form action="Login.jsp" method="post" name = "fo" onsubmit="return check()">
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
				<td colspan="2"><input type="submit" value="로그인 "> &nbsp;&nbsp;&nbsp;
				<a href="SignIn_Main.jsp">회원가입</a>
				</td>
			</tr>


			<tr>
				<a href="ADMIN_Login_Main.jsp">관리자 로그인</a>
			</tr>
		</table>
	</form>
	
	
	

</body>
</html>
