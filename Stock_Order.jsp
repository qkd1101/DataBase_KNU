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
		String iname = request.getParameter("iname");
		String a_stock = request.getParameter("stock");
		String retailer = request.getParameter("retailer");
		String item_id = null;
		String ret_id = null; //매장 아이디

		ResultSet result = null;

		try { //숫자인지 아닌지 검사
			Integer.parseInt(a_stock);
		} catch (NumberFormatException e) {
			out.println("<script>alert('숫자를 입력하세요.'); location.href='Item_Stock.jsp'</script>"); //숫자가 아닐	
		} catch (NullPointerException e) {
			out.println("<script>alert('숫자를 입력하세요.'); location.href='Item_Stock.jsp'</script>"); //숫자가 아닐  
		}

		String stock_item = (String) request.getSession().getAttribute("stock_item");
		int t_stock = 0; //총 재고수
		int ori_stock = 0; //원래 재고수

		String query = "select * from item where item_name = '" + stock_item + "';";
		System.out.println(retailer);

		Connection con = null;

		try { //원래 재고 받기
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(query);
			result = pstmt.executeQuery(query);

			while (result.next()) {
				ori_stock = result.getInt("stock");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		t_stock = Integer.parseInt(a_stock) + ori_stock; //다 더한 재고 수
		try { //매장 아이디
			query = "select * from retailer where rlocation = '" + retailer + "';";
			PreparedStatement pstmt = con.prepareStatement(query);
			result = pstmt.executeQuery(query);

			while (result.next())
				ret_id = result.getString("ret_id");
		} catch (Exception e) {
			e.printStackTrace();
		}

		//System.out.println(query);
		//System.out.print("1");
		try { //아이템
			query = "select * from item where item_name = '" + iname + "';";
			PreparedStatement pstmt = con.prepareStatement(query);
			result = pstmt.executeQuery(query);

			while (result.next())
				item_id = result.getString("item_id");
		} catch (Exception e) {
			e.printStackTrace();
		}

		//System.out.println(query);
		//System.out.print("1");
		try { //아이템 전체 재고 추가
			query = "update item set stock = " + t_stock + " where  item_id = '" + item_id + "';";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);

		} catch (Exception e) {
			e.printStackTrace();
		}

		int r_stock = 0; //매장별 재고
	
		try { //매장별 재고 체크
			query = "select * from ret_has where ret_id = '" + ret_id + "' and item_id = '" + item_id + "';";
			PreparedStatement pstmt = con.prepareStatement(query);
			result = pstmt.executeQuery(query);

			while (result.next())
				r_stock = result.getInt("stock");

		} catch (Exception e) {
			e.printStackTrace();
		}

		t_stock = Integer.parseInt(a_stock) + r_stock; //다 더한 재고 수

		try { //매장 재고 추가
			query = "update ret_has set stock = " + t_stock + " where  ret_id = '" + ret_id + "' and item_id = '"
					+ item_id + "';";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			
			out.println("<script>alert('재고가 추가되었습니다.'); location.href='Admin_Main_Menu_Main.jsp'</script>");

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>