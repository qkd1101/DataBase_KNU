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
		String iname = request.getParameter("Item_name");
		String iname2 = request.getParameter("shop_id");
		String quantity = request.getParameter("item_quantity");
		String cost = request.getParameter("cost");
		System.out.println(iname);
		System.out.println("2" + cost);
		
		String query = "delete from shop_has where s_id = '" + iname2 + "' and i_id in (select * from (select sh.i_id from item i, shop_has sh where i.item_name='" + iname + "' and i.item_id =sh.i_id and sh.s_id='" + iname2 + "') A);";
		System.out.println(query);
		
		Connection con = null;
		
		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			
			out.println("<script>alert('장바구니에서 삭제되었습니다.'); location.href='Shoppingbag.jsp'</script>");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			query = "update shoppingbag set total_cost = total_cost - " + cost + ", quantity = quantity - " + quantity + " where shop_id = '" + iname2 + "' and order_date is null;";
			System.out.println(query);
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>