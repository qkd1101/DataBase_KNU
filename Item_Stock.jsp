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
		System.out.println("1");
		String iname = request.getParameter("Item_name");
		String i_id = null;
		System.out.println(iname);

		request.getSession().setAttribute("stock_item", iname);

		String query = "select * from item where item_name = '" + iname + "';";
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
			ResultSet result = pstmt.executeQuery(query);

			while (result.next()) {
				out.println("상품명 : ");
				out.println(result.getString("Item_name"));
				out.println("아이템ID : ");
				i_id = result.getString("item_id");
				out.println(i_id);
				out.println("재고: ");
				out.println(result.getString("stock"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	%>

	<form action="Stock_Order.jsp" method="post">
		<table>
			<tr>
				<td>추가매장:</td>
				<td valgn="top">
					<!-- 매장 이름 --> <select name="retailer">
						<option value="서울특별시">서울특별시
						<option value="인천광역시">인천광역시
						<option value="대전광역시">대전광역시
						<option value="대구광역시">대구광역시
						<option value="대전광역시">대전광역시
						<option value="부산광역시">부산광역시
						<option value="울산광역시">울산광역시
						<option value="경기도">경기도
						<option value="강원도">강원도
						<option value="충청북도">충청북도
						<option value="충청남도">충청남도
						<option value="전라북도">전라북도
						<option value="전라남도">전라남도
						<option value="경상북도">경상북도
						<option value="경상남도">경상남도
						<option value="제주도">제주도
				</select>
				</td>
				<td><input type="hidden" name="iname" value="<%=iname%>"></td>

			</tr>
			<tr>
				<td>추가재고:</td>
				<td><input type="text" name="stock"></td>
			</tr>

			<tr>

				<td><input type="submit" value="재고 주문"></td>
			</tr>
		</table>
	</form>

</body>
</html>