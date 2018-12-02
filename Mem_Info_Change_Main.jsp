<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

</head>
<body>
	<form action="Mem_Info_Change.jsp" method="post" name="fo" onsubmit="return check()">
		<h1>회원정보 수정</h1>
		<hr>
		<table>

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
				<td><input type="submit" value="회원정보 수정"></td>
			</tr>
		</table>
	</form>

</body>
</html>