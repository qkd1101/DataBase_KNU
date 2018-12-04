<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
function check() {
	if(fo.quantity.value == "") {
		alert('담을 수량을 입력해주세요.');
		fo.quantity.focus();
		return false;
	}
}
</script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}
table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}
table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}
table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>

	<form action="Shopping_Add.jsp" method="post" name="fo" onsubmit="return check()">
		<table class="type09">
			<thead>
				<tr>
					<th scope="col">아이템 상세정보</th>
					<th scope="col">내용</th>
				</tr>
			</thead>


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
					con = DriverManager.getConnection(url, "root", "");
					System.out.println("DBms connection success");
					System.out.println("DB load success");
					PreparedStatement pstmt = con.prepareStatement(query);
					ResultSet result = pstmt.executeQuery(query);
					while (result.next()) {
			%>

			<tbody>
				<tr>
					<th scope="row">상품명</th>
					<td>
						<%
							out.println(result.getString("Item_name"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td>
						<%
							out.println(result.getString("price"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">Producer</th>
					<td>
						<%
							out.println(result.getString("producer"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">Importer</th>
					<td>
						<%
							out.println(result.getString("importer"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">유통기한</th>
					<td>
						<%
							out.println(result.getString("pro_date"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">소분류</th>
					<td>
						<%
							out.println(result.getString("small_C_name"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">재고</th>
					<td>
						<%
							out.println(result.getString("stock"));
						%>
					</td>
				</tr>
				<tr>
					<th scope="row">아이템ID</th>
					<td>
						<%
							out.println(result.getString("item_id"));
						%>
					</td>
				</tr>
			</tbody>
		</table>
		<%
			}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		%>
		<tabel>
		<tr>
			<td>상품이름</td>
			<td><input type="radio" name="iname" value="<%=iname%>" checked><%=iname%></td>
		</tr>
		<tr>
			<td>개수 :</td>
			<td><input type="text" name="quantity"></td>
		</tr>
		
		<input type="submit" value="장바구니 담기"> </a> </tabel>
		<br>
		<a href="MainMenu_Main.jsp">메뉴로 돌아가기</a> 
	</form>
</body>
</html>