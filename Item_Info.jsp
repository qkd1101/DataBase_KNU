<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Shopping_Add.jsp" method="post">
		<%
		request.setCharacterEncoding("utf-8");

		String iname = request.getParameter("Item_name");
		System.out.println(iname);
		
		String query = "select * from item where item_name = '" + iname + "';";
		System.out.println(query);
		
		Connection con = null;
		
		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "ksg", "12345678");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery(query);
			
			while(result.next())
			{
				out.println("상품명 : ");
				out.println(result.getString("Item_name"));
				out.println("가격 : ");
				out.println(result.getString("price"));
				out.println("Producer : ");
				out.println(result.getString("producer"));
				out.println("Importer : ");
				out.println(result.getString("importer"));
				out.println("유통기한 : ");
				out.println(result.getString("pro_date"));
				out.println("소분류 : ");
				out.println(result.getString("small_C_name"));
				out.println("재고: ");
				out.println(result.getString("stock"));
				out.println("아이템ID : ");
				out.println(result.getString("item_id"));
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}
	%>
		<tabel>
		<tr>
			<td>상품이름</td>
			<td><input type="radio" name="iname" value="<%=iname %>" checked><%=iname %></td>
		</tr>
		<tr>
			<td>개수 :</td>
			<td><input type="text" name="quantity"></td>
		</tr>

		<input type="submit" value="장바구니 담기"> </a> </tabel>
	</form>
</body>
</html>