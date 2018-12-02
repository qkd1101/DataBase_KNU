<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="MS_SeaFood.jsp" method="post" name="f">
		<h1>소분류 선택: 수산물/해산물/건어</h1>
		<hr>
		<table>
			<tr>
				<td><select name="items1">
						<option value="A">생선회</option>
						<option value="B">고등어/갈치/조기/장어</option>
						<option value="C">새우/게/기타해산물</option>
				</select></td>
			<tr>
				<td><input type="submit" value="선택"></td>
			</tr>
		</table>

		<a href="MainCate_Main.jsp">대분류 선택으로 돌아가기</a>&nbsp;&nbsp;&nbsp;
	</form>
</body>
</html>