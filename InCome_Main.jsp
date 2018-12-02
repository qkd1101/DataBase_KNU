<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="InCome_MDTime.jsp" method="post">
		<select name="profit">
			<option value="전체매출">전체 매출
			<option value="월별매출">월별 매출
			<option value="일별매출">일별 매출
		</select>
		<input type="submit" value="조회">
		<a href ="Admin_Main.jsp">관리자 메뉴로 돌아가기
		</a>
	</form>
</body>
</html>