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
			<option value="사과/배">사과/배
			<option value="감귤/한라봉">감귤/한라봉
			<option value="감/곶감">감/곶감
		</select>
		<input type="submit" value="조회">
	</form>
</body>
</html>