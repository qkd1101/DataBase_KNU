<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE h
tml>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="MS_Fruit.jsp" method="post" name="f">
		<h1>소분류 선택: 과일/견과</h1>
		<hr>
		<table>
			<tr>
				<td><select name="items1">
						<option value="A">사과/배</option>
						<option value="B">감귤/한라봉</option>
						<option value="C">감/곶감</option>
				</select></td>
				
			<tr>
				<td><input type="submit" value="선택"></td>
			</tr>
		</table>
		
		<a href="MainCate_Main.jsp">대분류 선택으로 돌아가기</a>&nbsp;&nbsp;&nbsp;
	</form>
</body>
</html>