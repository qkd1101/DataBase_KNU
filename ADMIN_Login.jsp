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
	
	System.out.print(id);
	if(!id.toLowerCase().matches("admin.*"))
		out.println("<script>alert('관리자 계정으로 로그인해주세요.'); location.href='ADMIN_Login_Main.jsp'</script>");
	
	
	String password = request.getParameter("password");
	String sql = "SELECT password FROM customer WHERE cus_id = '"+id+"'"+" AND password = '"+password+"'";
	
	Connection con = null;
	boolean check = false;		//check  for login
	
	try {
		String url = "jdbc:mysql://localhost:3306/test";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		con = DriverManager.getConnection(url, "root", "");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
		
		while(rs.next()){
					check = true; // rs가 한번이라도  돌면 count 의 값을 올려줍니다.
		}
		if(check == false){
			out.println("<script>alert('관리자의 정보가 없습니다.'); location.href='ADMIN_Login_Main.jsp'</script>"); // 만약에 rs 가 한번도 안돌았으면
		}
		else if(check == true){
			request.getSession().setAttribute("id",id);
			request.getSession().setAttribute("pw",password);
			out.println("<script>alert('success login'); location.href='Admin_Main_Menu_Main.jsp'</script>");// 만약에 rs 가 한번 돌았으면 그 값이 있다는 뜻
		}
	
		pstmt.close();
		con.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>
