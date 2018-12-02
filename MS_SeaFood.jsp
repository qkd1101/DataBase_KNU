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
	<h1>상품 리스트</h1>
	<hr>
	<%
		String item = request.getParameter("items1"); //get parameter
		String query = "select item_name from item where small_C_name = '";
		ResultSet rs = null;
		if (item.equals("A"))
			query +=  "생선회"+ "';";

		else if (item.equals("B"))
			query += "고등어/갈치/조기/장어" + "';";
			
		else if (item.equals("C"))
			query += "새우/게/기타해산물" + "';";

		Connection con = null;
		
		try{
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			System.out.println(query);
			PreparedStatement pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
			//	out.println(rs.getString("Item_name"));
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString("Item_name")%>"><%=rs.getString("Item_name") %></a>
	<%
			}
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	%>
	<a href="MC_SeaFood.jsp">수산물/해산물/건어로 돌아가기</a>
</body>
</html>