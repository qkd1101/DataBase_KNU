<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String url = "jdbc:mysql://localhost:3306/test";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		Connection con = DriverManager.getConnection(url, "root", "");
		System.out.println("DBms connection success");
		System.out.println("DB load success");

		Calendar cal = Calendar.getInstance();

		int c_m = cal.get(Calendar.MONTH) + 1; //현재 달 받아오기

		if (c_m == 13)
			c_m = 1;

		String q = null;
	%>
	<%=c_m%>월의 추천상품!
	<br>
	<br>
	<%
		if ((3 <= c_m) && (c_m <= 6)) {
			try {
				q = "select * from item where small_C_name = '사과/배' or small_C_name = '생선회';";
				PreparedStatement pstmt = con.prepareStatement(q);
				ResultSet result = pstmt.executeQuery(q);

				%>
	<table border = "1">
		<thead>
			<tr>
				<th scope="cols">상품명</th>
				<th scope="cols">가격</th>
			</tr>
		</thead>
		<tbody>
		
		<%
				while (result.next()) {
				%>
			<tr>
				<td><%=result.getString("item_name") %></td>
				<td><%=result.getInt("price") %></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
		else if ((7 <= c_m) && (c_m <= 10)) {
		try {
			q = "select * from item where small_C_name = '감/곶감' or small_C_name = '새우/게/기타해산물';";
			PreparedStatement pstmt = con.prepareStatement(q);
			ResultSet result = pstmt.executeQuery(q);

			%>
<table border = "1">
	<thead>
		<tr>
			<th scope="cols">상품명</th>
			<th scope="cols">가격</th>
		</tr>
	</thead>
	<tbody>
	
	<%
			while (result.next()) {
			%>
		<tr>
			<td><%=result.getString("item_name") %></td>
			<td><%=result.getInt("price") %></td>
		</tr>
		<%
		}
		%>
	</tbody>
</table>
<%
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
		else if ((11 <= c_m)) {
			try {
				q = "select * from item where small_C_name = '감/곶감' or small_C_name = '고등어/갈치/조기/장어';";
				PreparedStatement pstmt = con.prepareStatement(q);
				ResultSet result = pstmt.executeQuery(q);

				%>
	<table border = "1">
		<thead>
			<tr>
				<th scope="cols">상품명</th>
				<th scope="cols">가격</th>
			</tr>
		</thead>
		<tbody>
		
		<%
				while (result.next()) {
				%>
			<tr>
				<td><%=result.getString("item_name") %></td>
				<td><%=result.getInt("price") %></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<%
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<br>
	<a href ="Login_Main.jsp">로그인하러 가기</a>
</body>
</html>