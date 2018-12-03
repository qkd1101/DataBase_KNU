<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
		<colgroup>
			<col>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">구매날짜</th>
				<th scope="col">상품정보</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
			</tr>
		</thead>
	<%
		request.setCharacterEncoding("utf-8");

		String id = (String) request.getSession().getAttribute("id");

		String query = "";

		Connection con = null;
		String S_id = "";

		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "ksg", "12345678");
			System.out.println("DBms connection success");
			System.out.println("DB load success");

			query = "select * from shoppingbag where cus_no = '" + id + "' and order_date is not null;";	//구매 기록을 확인
			
			System.out.println(query);
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet result = pstmt.executeQuery(query);
			
		while(result.next()) {
				String date = result.getString(5); //구매 날짜 저장
				String s_id = result.getString(1); //쇼핑백 아이디 저장

				String query2 = "select i.item_name, i.price * sh.item_quantity, sh.item_quantity from item i, ordered_shop_has sh where sh.s_id = '" + s_id +  "'and sh.i_id = i.item_id;";
				System.out.println(query2);
				PreparedStatement pstmt2 = con.prepareStatement(query);
				ResultSet rs = pstmt2.executeQuery(query2);
				
				while(rs.next()) { %>
				<tbody>
	<tr>
	<td><%=date %></td>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	</tr>
	</tbody>
				
	<%
				}
			}

		%>
	</table>
	<br><a href="MainMenu_Main.jsp">메인메뉴로 돌아가기</a>
		<%
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("1");
		}
	%>

</body>
</html>