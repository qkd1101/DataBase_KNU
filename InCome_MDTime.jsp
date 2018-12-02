<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="InCome.jsp" method="post">
		<table>
			<%
				request.setCharacterEncoding("utf-8");
				String profit = request.getParameter("profit");

				if (profit.equals("전체매출")) {
			%>
			<tr>
				<td>year :</td>
				<td><input type="text" name="year"></td>
				<td><input type="hidden" name="mode" value="A"></td>
			</tr>
			<%
				} else if (profit.equals("월별매출")) {
			%>
			<tr>
				<td>year :</td>
				<td><input type="text" name="year"></td>
				<td>month :</td>
				<td><input type="text" name="month"></td>
				<td><input type="hidden" name="mode" value="B"></td>
				<%
					} else if (profit.equals("일별매출")) {
				%>
				<td>year :</td>
				<td><input type="text" name="year"></td>
				<td>month :</td>
				<td><input type="text" name="month"></td>
				<td>day :</td>
				<td><input type="text" name="day"></td>
				<td><input type="hidden" name="mode" value="C"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td><input type="submit" value="<%=profit%>"></td>
			</tr>
		</table>
	</form>
</body>
</html>