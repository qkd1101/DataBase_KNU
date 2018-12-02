<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String search = request.getParameter("search");
		Connection con = null;
		String query = "select * from item where item_name like '%" + search + "%';";
	
		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery(query);

			System.out.println("-----검색된 물품리스트-----");
			while (result.next()) {
				out.println("상품명 : ");
		%>
	<a href="Item_Stock.jsp?Item_name=<%=result.getString("Item_name")%>"><%=result.getString("Item_name") %></a>
	<%
				out.println("가격 : ");
				out.println(result.getString("price"));
		%>
	<br>
	<%
			}
		%>

	<a href="Stock_Search.jsp">다시 검색하기</a>
	<% 
		}

		catch (Exception ex) {
			System.err.println("sql error = " + ex.getMessage());
		}
	%>
</body>
</html>