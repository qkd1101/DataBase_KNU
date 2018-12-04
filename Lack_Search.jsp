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
	<%
	request.setCharacterEncoding("utf-8");

	String small_C_name = request.getParameter("sc");
	
	boolean s = false;
	
	String q = "select * from item where small_C_name = '" + small_C_name +"';";
	try {
		String url = "jdbc:mysql://localhost:3306/test";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		Connection con = DriverManager.getConnection(url, "root", "");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		PreparedStatement pstmt = con.prepareStatement(q);
		ResultSet result = pstmt.executeQuery(q);
		
		while(result.next())
		{
			int total = 0;
			String it_id = result.getString("item_id");
			
			String q2 = "select * from shop_has where i_id = '" + it_id +"';";
			try {
				PreparedStatement pstmt1 = con.prepareStatement(q2);
				ResultSet result1 = pstmt1.executeQuery(q2);
				
				while(result1.next())
				{
					total += result1.getInt("item_quantity");
				}
			}
			catch (Exception e) { e.printStackTrace(); } 
			System.out.println(total);
			
			q2 = "select * from item where item_id = '" + it_id +"' and stock -"+total +"<0;";
			System.out.println(q2);
			try {
				PreparedStatement pstmt1 = con.prepareStatement(q2);
				ResultSet result1 = pstmt1.executeQuery(q2);
				
				while(result1.next())
				{
					out.print("상품명 : ");
					out.println(result1.getString("Item_name"));
					out.print("|   부족한 개수 : ");
					out.println(total-result1.getInt("stock"));
					s = true;
				%>
				<br>
				<%
				}
			}
			catch (Exception e) { e.printStackTrace(); }
		}
			
	}
	catch (Exception e) { e.printStackTrace(); } 
	%>
	<%
	if(s == false)
	{
		out.print("부족한 재고가 없습니다.");
	}
	%>
	<br>
	<%
	out.print("검색 끝");
	%>
	
	<br>
	<a href="Stock_Order_Main.jsp">제고 주문 하기</a>
	<a href="Lack_Stock_Main.jsp">다시 검색하기</a>
</body>
</html>