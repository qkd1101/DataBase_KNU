<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>로그인 화면</h1
		>
		<hr>
		<form action="Login.jsp" method="post">
		
			<table>
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="id"></td>
				</tr>
				
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" name="password"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="로그인 "> &nbsp;&nbsp;&nbsp; <a href="SignIn_Main.jsp">회원가입</a>
					</td>
					
				</tr>
			</table>
		</form>
</body>
</html>
