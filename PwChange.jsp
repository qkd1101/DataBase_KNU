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

		String id = (String) request.getSession().getAttribute("id");
		String password = (String) request.getSession().getAttribute("password");
		String password1 = request.getParameter("password1");
		
		String query = "update customer set password = ";
		
		if(password1.equals(""))
			query += "null";
		else
			query += "'" + password1 + "'";
		
		
		query += " where cus_id = '"+id+"';";
		
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

			pstmt.close();
			con.close();
			out.println("<script>alert('비밀번호 변경 완료'); location.href='MainMenu_Main.jsp'</script>");

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>