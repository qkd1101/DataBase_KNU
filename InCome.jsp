<%@ page import="java.sql.*"%>
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
		String mode = request.getParameter("mode");

		Connection con = null;
		boolean res = false; //매출이 있는지 없는지 검사.
		String sql = null;

		if (mode.equals("A")) {
			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "root", "");
				System.out.println("DBms connection success");
				System.out.println("DB load success");
				String year = request.getParameter("year");
				sql = "select * from shoppingbag where date(order_date) between '" + year + "-01-01' and '" + year
						+ "-12-31';";
				int total_profit = 0;
				try { //year 숫자인지 아닌지 검사
					Integer.parseInt(year);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					total_profit += rs.getInt("total_cost");
					res = true; //매출이 있으면 true로.
				}

				if (res == true) {
					out.println(year + "년  | 총매출 :");
					out.println(total_profit);
				}

				else //매출이 없을시
					out.println("매출이 없습니다.");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (mode.equals("B")) {
			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "root", "");
				System.out.println("DBms connection success");
				System.out.println("DB load success");
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				int total_profit = 0;
				int m = Integer.parseInt(month);

				try { //year 숫자인지 아닌지 검사
					Integer.parseInt(year);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}

				try { //month 숫자인지 아닌지 검사
					Integer.parseInt(month);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}

				if (((1 > m) || (m > 12)))
				{
					out.println(
							"<script>alert('1월 ~ 12월 사이의 달을 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}
				
				if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
					
					sql = "select * from shoppingbag where date(order_date) between '" + year + "-" + m
							+ "-01' and '" + year + "-" + m + "-31';";
				}

				else if (m == 2 || m == 4 || m == 6 || m == 9 || m == 11) {
					sql = "select * from shoppingbag where date(order_date) between '" + year + "-" + m
							+ "-01' and '" + year + "-" + m + "-30';";
				}

				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					total_profit += rs.getInt("total_cost");
					res = true; //매출이 있으면 true로.
				}

				if (res == true) {
					out.println(year + "년 " + month + "월  | 총매출 :");
					out.println(total_profit);
				}

				else //매출이 없을시
					out.println("매출이 없습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		else if (mode.equals("C")) {
			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "root", "");
				System.out.println("DBms connection success");
				System.out.println("DB load success");
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				String day = request.getParameter("day");
				int total_profit = 0;
				int m = Integer.parseInt(month);
				int d = Integer.parseInt(day);


				try { //year 숫자인지 아닌지 검사
					Integer.parseInt(year);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}

				try { //month 숫자인지 아닌지 검사
					Integer.parseInt(month);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}
				
				try { // 숫자인지 아닌지 검사
					Integer.parseInt(day);
				} catch (NumberFormatException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐	
				} catch (NullPointerException e) {
					out.println("<script>alert('숫자를 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}

				if (((1 > m) || (m > 12)))
				{
					out.println(
							"<script>alert('1월 ~ 12월 사이의 달을 입력하세요.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐  
				}
				
				System.out.println(m);
				System.out.println(d);
				
				if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12) {
					System.out.println(d);
					if(d<1 || d>31)
					{
						System.out.println(d);
						out.println(
								"<script>alert('날짜를 잘못 입력하셨습니다.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐시 
					}
				}

				else if (m == 2 || m == 4 || m == 6 || m == 9 || m == 11) {
					System.out.println(d);
					if(d<1 || d>30)
					{
						System.out.println(day);
						out.println(
								"<script>alert('날짜를 잘못 입력하셨습니다.'); location.href='InCome_Main.jsp'</script>"); //숫자가 아닐시 
					}
				
				}  
				
				sql = "select * from shoppingbag where date(order_date) =" + year + "-" + m + "-" + d + ";";
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					total_profit += rs.getInt("total_cost");
					res = true; //매출이 있으면 true로.
				}

				if (res == true) {
					out.println(year + "년 " + month + "월 " + day + "일  | 총매출 :");
					out.println(total_profit);
				}

				else //매출이 없을시
					out.println("매출이 없습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	<a href="InCome_Main.jsp">다시 검색하기</a>
	<a href="Admin_Main_Menu_Main.jsp">관리자 메뉴로 돌아가기</a>
</body>
</html>
