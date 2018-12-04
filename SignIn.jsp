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
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String job = request.getParameter("job");
		String phonenumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");

		if (phonenumber.length() >= 12)
			out.println("<script>alert('휴대폰번호는 11자리 이하로 해주세요.'); location.href='SignIn_Main.jsp'</script>");

		if (id.length() >= 9)
			out.println("<script>alert('아이디는 8자리 이하로 해주세요.'); location.href='SignIn_Main.jsp'</script>");

		if (password.length() >= 17)
			out.println("<script>alert('비밀번호는 16자리 이하로 해주세요.'); location.href='SignIn_Main.jsp'</script>");

		String query = "insert into customer values(";

		name = name.toLowerCase();
		if (name.equals(""))
			query += "null,";
		else
			query += "'" + name + "',";

		age = age.toLowerCase();
		if (age.equals(""))
			query += "null,";
		else
			query += age + ",";

		query += "'" + id + "',";

		sex = sex.toLowerCase();
		if (sex.equals(""))
			query += "null,";
		else
			query += "'" + sex + "',";

		job = job.toLowerCase();
		if (job.equals(""))
			query += "null,";
		else
			query += "'" + job + "',";

		query += "0, '" + password + "', '" + address + "', '" + phonenumber + "')";

		System.out.println(query);

		Connection con = null;
		ResultSet rs = null;
		String S_id = "";
		try {
			String url = "jdbc:mysql://localhost:3306/test";
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.println("after forName");
			con = DriverManager.getConnection(url, "root", "");
			System.out.println("DBms connection success");
			System.out.println("DB load success");
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);

			//shopping id 찾기
			try {
				query = "select * from shoppingbag;";

				pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery(query);

				int Add_Shop_id = 0;

				while (rs.next()) {
					Add_Shop_id = Integer.parseInt(rs.getString("shop_id"));
				}

				Add_Shop_id++;

				S_id = Integer.toString(Add_Shop_id);

				System.out.println(S_id);

				pstmt.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("1");
			}

			//shopping bag 추가 
			try {
				query = "insert into shoppingbag values('" + S_id + "',0,0,'" + id + "',null);";
				pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}

			//id와 password를 저장 후 로그인 됨
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("pw", password);

			out.println("<script>alert('회원가입 완료'); location.href='Item_Recommend.jsp?age=" + age + "&job=" + job
					+ "&sex=" + sex + "'</script>");

		}

		catch (Exception e) {
			e.printStackTrace();
			out.println(
					"<script>alert('회원가입에 실패하였습니다. 이미 존재하는 아이디 혹은 전화번호 입니다.'); location.href='SignIn_Main.jsp'</script>");
		}
	%>

</body>
</html>