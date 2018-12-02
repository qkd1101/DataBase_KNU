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
		String quantity = request.getParameter("quantity");
		String Adding_item = request.getParameter("iname");
		String id = (String) request.getSession().getAttribute("id");
		String S_id = "null";
		String I_id = "null";
		int I_price = 0;
		int I_cost = 0;
		String sql = "select item_id, price from item where item_name = '" + Adding_item + "';";

		Connection con = null;

		System.out.println("1");
		//item_id 받기

		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.

			while (rs.next()) {
				I_id = rs.getString("Item_id");
				I_price = rs.getInt("price");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		I_cost = I_price * Integer.parseInt(quantity);

		//shop_id 받기

		System.out.println("2");
		ResultSet rs = null;

		try {
			sql = "select shop_id from shoppingbag where cus_no = '" + id + "';";
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.

			while (rs.next()) {
				S_id = rs.getString("shop_id");
			}

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("3");
		//장바구니에 추가 
		System.out.println(S_id);
		System.out.println(I_id);
		try {
			sql = "insert into shop_has values('" + S_id + "','" + I_id + "'," + quantity + ");";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate(); // 결과값을 뽑아줍니다.

		} catch (Exception e) {
			e.printStackTrace();
		}

		//quantity 받아오기

		System.out.println("4");
		int t_quantity = 0;

		try {
			sql = "select quantity from shoppingbag where shop_id ='" + S_id + "';";
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.

			while(rs.next())
				t_quantity = rs.getInt("quantity");
			
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		//cost 받아오기

		System.out.println("5");
		int t_cost = 0;

		try {
			sql = "select total_cost from shoppingbag where shop_id ='" + S_id + "';";
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.

			while(rs.next())
			t_cost = rs.getInt("total_cost");

			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("6");


		try {
			sql = "update shoppingbag set quantity = " + (t_quantity + Integer.parseInt(quantity)) + ", total_cost = " + (t_cost + I_cost)
					+ " where shop_id = '" + S_id + "';";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.executeUpdate();


			pstmt.close();
			con.close();
			
			out.println("<script>alert('장바구니에 추가되었습니다.'); location.href='MainMenu_Main.jsp'</script>");
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>