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
			<option value="스낵">스낵
			<option value="초콜릿/초코바">초콜릿/초코바
			<option value="시리얼">시리얼
		</select>
		<input type="submit" value="조회">
	</form>
</body>
</html>