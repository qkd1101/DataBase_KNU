<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Buy.jsp" method="post" name="f">
		<h1>구매</h1>
		<hr>
		<table>
			<tr>
				<%
					request.setCharacterEncoding("utf-8");
					String id = (String) request.getSession().getAttribute("id");
					String sql = "select * from shoppingbag where cus_no = '" + id + "'and quantity > 0 and order_date is null;";
					System.out.println(sql);

					Connection con = null;
					boolean check = false; //check  for login

					try {
						String url = "jdbc:mysql://localhost:3306/test";
						Class.forName("com.mysql.jdbc.Driver").newInstance();
						System.out.println("after forName");
						con = DriverManager.getConnection(url, "ksg", "12345678");
						System.out.println("DBms connection success");
						System.out.println("DB load success");
						PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
						while (rs.next()) {
							check = true; // rs가 한번이라도  돌면 count 의 값을 올려줍니다.
						}
						if (check == false) {
							out.println("<script>alert('장바구니가 비었습니다'); location.href='Shoppingbag.jsp'</script>"); // 만약에 rs 가 한번도 안돌았으면
						}

						else {
				%>
				<td><select name="items1">
						<option value="서울특별시">서울특별시</option>
						<option value="인천광역시">인천광역시</option>
						<option value="부산광역시">부산광역시</option>
						<option value="대구광역시">대구광역시</option>
						<option value="울산광역시">울산광역시</option>
						<option value="광주광역시">광주광역시</option>
						<option value="대전광역시">대전광역시</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="충청북도">충청북도</option>
						<option value="충청남도">충청남도</option>
						<option value="경상북도">경상북도</option>
						<option value="경상남도">경상남도</option>
						<option value="전라북도">전라북도</option>
						<option value="전라남도">전라남도</option>
						<option value="제주도">제주도</option>
				</select></td>
				<%
					}

						pstmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			
			<tr>
				<td><input type="submit" value="선택"></td>
			</tr>
		</table>

		<a href="MainMenu_Main.jsp">메인화면으로 돌아가기</a>&nbsp;&nbsp;&nbsp;
	</form>

</body>
</html>