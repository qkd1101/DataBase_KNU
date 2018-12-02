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
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String job = request.getParameter("job");
		String phonenumber = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		
		String query = "update customer set name = ";
		
		name = name.toLowerCase();
		if(name.equals(""))
			query += "null";
		else
			query += "'" + name + "'";
		
		query += ", age = ";
		
		age = age.toLowerCase();
		if(age.equals(""))
			query += "null";
		else
			query += age+"";
		
		query += ", sex = ";
		
		sex = sex.toUpperCase();
		if(sex.equals(""))
			query += "null";
		else
			query += "'" + sex + "'";
			
		query += ", job = ";
		
		job = job.toLowerCase();
		if(job.equals(""))
			query += "null";
		else
			query += "'" + job + "'";
		
		query += ",address = '"+address+"', phonenumber = '"+phonenumber+"'"+ " where cus_id = '"+id+"';";
		
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
			out.println("<script>alert('회원정보 수정 완료'); location.href='MainMenu_Main.jsp'</script>");

		}

		catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>