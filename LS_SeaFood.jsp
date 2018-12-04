<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Lack_Search.jsp" method="post">
		<select name="sc">
			<option value="생선회">생선회
			<option value="고등어/갈치/조기/장어">고등어/갈치/조기/장어
			<option value="새우/게/기타해산물">새우/게/기타해산물
		</select>
		<input type="submit" value="조회">
	</form>
</body>
</html>