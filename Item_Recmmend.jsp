<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>**** 신규고객을 위한 상품추천 ****</h1>
	<%
		request.setCharacterEncoding("utf-8");
		//회원가입한 신규 고객의 나이,성별,직업을 받아옴.
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String job = request.getParameter("job");
		if (age.equals("")) age = null;
		if (sex.equals("")) sex = null;
		if (job.equals("")) job = null;
		
		System.out.println(age + " 1 " + sex + " 2 " + job);

		Connection con = null;
		ResultSet rs = null;

		if (age != null && sex != null && job != null) {
			System.out.println("case 1");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex = '"
					+ sex + "' and job = '" + job + "' and age between " + age + "-5 and " + age
					+ "+5) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
		}
		
		else if(age == null && sex != null && job != null) {
			System.out.println("case 2");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex = '"
					+ sex + "' and job = '" + job + "' and age is null) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}			
		}
		else if(age != null && sex == null && job != null) {
			System.out.println("case 3");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex is null and job = '" + job + "' and age between " + age + "-5 and " + age
					+ "+5) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
			
		}
		else if(age != null && sex != null && job == null) {
			System.out.println("case 4");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex = '"
					+ sex + "' and job is null and age between " + age + "-5 and " + age
					+ "+5) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
			
		}
		else if(age != null && sex == null && job == null) {
			System.out.println("case 5");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex is null and job is null and age between " + age + "-5 and " + age
					+ "+5) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
		}
		else if(age == null && sex != null && job == null) {
			System.out.println("case 6");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex = '"
					+ sex + "' and job is null and age is null) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
			
		}
		else if(age == null && sex == null && job != null) {
			System.out.println("case 7");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex is null and job = '" + job + "' and age is null) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
			
		}
		else if(age == null && sex == null && job == null) {
			System.out.println("case 8");
			String query = "create or replace view rec as select sh.i_id as id, count(*) as num from shoppingbag sb, ordered_shop_has sh where sb.order_date is not null and sb.shop_id = sh.s_id and sb.cus_no in (select cus_id from customer where sex is null and job is null and age is null) group by sh.i_id;";
			System.out.println(query);

			try {
				String url = "jdbc:mysql://localhost:3306/test";
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.println("after forName");
				con = DriverManager.getConnection(url, "ksg", "12345678");
				System.out.println("DBms connection success");
				System.out.println("DB load success");

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);

				query = "create or replace view total as select i.item_name as name, r.num * i.price as total_price from rec r, item i where r.id = i.item_id;";

				PreparedStatement pstmt2 = con.prepareStatement(query);
				pstmt2.executeUpdate(query);

				try {
					query = "select * from(select name as item_name, rank()over(order by total_price desc) as Ranking from total)tb_dd where Ranking <= 5;";
					System.out.println("come in");
					rs = pstmt.executeQuery(query);

					while (rs.next()) {
						rs.getString(1);
	%>
	<a href="Item_Info.jsp?Item_name=<%=rs.getString(1)%>"><%=rs.getString(1)%></a>
	<br>
	<%
		System.out.println("come in2");
					}
				}

				catch (Exception e) {
					e.printStackTrace();
					System.out.println("3");
				}

				pstmt.close();
				con.close();
			}

			catch (Exception e) {
				e.printStackTrace();
				System.out.println("2");
			}
		}
	%>

</body>
</html>