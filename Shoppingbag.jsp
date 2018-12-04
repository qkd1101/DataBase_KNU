<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="SignIn.jsp" method="post" name = "fo">
	<h1> 장바구니 </h1>
		<table border="1">
		<colgroup>
			<col>
			<col>
			<col>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">상품정보</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
			</tr>
		</thead>
<%
//고객의 ID를 받아와 장바구니 목록을 보여준다.
	request.setCharacterEncoding("utf-8");

	String id = (String) request.getSession().getAttribute("id");	//id 정보를 받아옴.
	Connection con = null;
	String query = "select i.item_name, i.price * sh.item_quantity, sh.item_quantity, sb.shop_id from item i, shoppingbag sb, shop_has sh where sb.cus_no = '" + id + "' and sb.shop_id = sh.s_id and sh.i_id = i.item_id;";
	System.out.println(query);
	
	try {
		String url = "jdbc:mysql://localhost:3306/test";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		con = DriverManager.getConnection(url, "ksg", "12345678");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		PreparedStatement pstmt = con.prepareStatement(query);
		
		pstmt = con.prepareStatement(query);
		ResultSet result = pstmt.executeQuery(query);
		
		while (result.next()) {
			//out.println("상품명 : ");
			//out.println(result.getString("Item_name"));
	%>
	<tbody>
	<tr>
	<td><a href="Item_Info.jsp?Item_name=<%=result.getString("Item_name")%>"><%=result.getString("Item_name") %></a></td>
<%
			//out.println("가격 : ");
			//out.println(result.getString("i.price * sh.item_quantity"));
			//out.println("수량 : ");
			//out.println(result.getString("item_quantity"));
	%>
	<td><%=result.getString("i.price * sh.item_quantity") %></td>
	<td><%=result.getString("item_quantity") %><a href="Subtraction.jsp?shop_id=<%=result.getString("shop_id")%>&Item_name=<%=result.getString("Item_name")%>&item_quantity=<%=result.getString("item_quantity")%>&cost=<%=result.getString("i.price * sh.item_quantity")%> ">빼기</a></td>
	</tr>
	</tbody>
	
<%
		}
	%>
	
	</table>
	<br><a href="Buy_Main.jsp">구매</a>
	<br><a href="MainMenu_Main.jsp">메인메뉴로 돌아가기</a>
	
<%}
	catch (Exception ex) {
		System.err.println("sql error = " + ex.getMessage());
	}
%>
	</form>

</body>
</html>