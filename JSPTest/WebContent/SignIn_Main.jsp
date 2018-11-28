
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="SignIn.jsp" method="post">
		<h1>회원 가입 폼</h1>
		<hr>
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
				<td>이름 : </td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>나이 : </td>
				<td><input type="text" name="age"></td>
			</tr>
			
			<tr>
				<td>성별 : </td>
				<td><input type="text" name="sex"></td>
			</tr>
			
			<tr>
				<td>직업 : </td>
				<td><input type="text" name="job"></td>
			</tr>
			
			<tr>
				<td>주소 : </td>
				<td><input type="text" name="address"></td>
			</tr>
			
			<tr>
				<td>휴대폰번호 : </td>
				<td><input type="text" name="phonenumber"></td>
			</tr>
			
			<tr>
				<td> <input type="submit" value="회원등록"></td>
			</tr>
		</table>
	</form>

</body>
</html>