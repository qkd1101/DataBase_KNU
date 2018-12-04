<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="java.util.Calendar"%>
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
			Calendar cal = Calendar.getInstance();
			String year = String.valueOf(cal.get(Calendar.YEAR));
			String month = String.valueOf(cal.get(Calendar.MONTH) + 1);
			String date = String.valueOf(cal.get(Calendar.DATE));
			String location = request.getParameter("items1"); //배송지 정보를 받아옴.
			String query = "";
			boolean check = false;
			Connection con = null;
			ResultSet rs = null;
			String S_id = "";
			//상품의 재고 확인
			try {
		String url = "jdbc:mysql://localhost:3306/test";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.println("after forName");
		con = DriverManager.getConnection(url, "root", "");
		System.out.println("DBms connection success");
		System.out.println("DB load success");
		query = "select * from shop_has where s_id in (select shop_id from shoppingbag where cus_no = '" + id
				+ "' and order_date is null);";
		System.out.println(query);
		PreparedStatement pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
		while (rs.next()) {
			//구매할 상품의 재고가 존재하는지 확인
			String s_id = rs.getString(1);
			String i_id = rs.getString(2);
			String quantity = rs.getString(3);
			try {
				String query2 = "select * from item where item_id = '" + i_id + "' and stock >= " + quantity
						+ ";"; //재고가 충분한지 확인
				System.out.println("첫번째 :" + query2);
				PreparedStatement pstmt2 = con.prepareStatement(query2);
				ResultSet rs2 = pstmt2.executeQuery();
				if (rs2.next()) //재고가 존재할 경우
				{
					check = true;
				}
				else //재고가 부족할 경우
				{
					check = false;
					System.out.println("들어옴");
					out.println("<script>alert('상품의 재고가 부족합니다.'); location.href='Shoppingbag.jsp'</script>");
					System.out.println("들어옴2");
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("1");
			}
		}
			}
			catch (Exception e) {
		e.printStackTrace();
		System.out.println("1");
			}
			
			
		if (check) {	//재고가 충분할 경우
			//배송지에 재고가 존재하는지 확인
			try {
				query = "select * from shop_has where s_id in (select shop_id from shoppingbag where cus_no = '"
						+ id + "' and order_date is null);";
				System.out.println(query);
				PreparedStatement pstmt = con.prepareStatement(query);
				rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
				while (rs.next()) {
					//구매할 상품의 재고가 존재하는지 확인
					String s_id = rs.getString(1);
					String i_id = rs.getString(2);
					String quantity = rs.getString(3);
					try {
						String query2 = "select rh.ret_id, rh.stock from retailer r, ret_has rh where r.rlocation = '"
								+ location + "' and r.ret_id = rh.ret_id and rh.item_id = '" + i_id + "';"; //재고가 충분한지 확인
						System.out.println("두번째 :" + query2);
						PreparedStatement pstmt2 = con.prepareStatement(query2);
						ResultSet rs2 = pstmt2.executeQuery();
						if (rs2.next()) //재고가 존재할 경우
						{
							String ret_id = rs2.getString(1); //매장의 아이디 저장
							try { //매장의 재고를 줄임
								String query3 = "update ret_has set stock = stock - " + quantity + " where item_id = '"
										+ i_id + "' and ret_id = '" + ret_id + "';"; //매장의 재고를 줄임.
								System.out.println("세번째 :" + query3);
								PreparedStatement pstmt3 = con.prepareStatement(query3);
								pstmt3.executeUpdate();
							}
							catch (Exception e) {
								e.printStackTrace();
							}
							try { //상품의 재고를 줄임
								String query3 = "update item set stock = stock - " + quantity + " where item_id = '" + i_id
										+ "';"; //상품의 재고를 줄임.
								System.out.println("네번째 :" + query3);
								PreparedStatement pstmt3 = con.prepareStatement(query3);
								pstmt3.executeUpdate();
							}
							catch (Exception e) {
								e.printStackTrace();
							}
							try { //배달 정보를 등록
								String query3 = "insert into delivery values('" + id + "', '" + ret_id + "');"; //배송정보 넣기.
								System.out.println("다섯번째 :" + query3);
								PreparedStatement pstmt3 = con.prepareStatement(query3);
								pstmt3.executeUpdate();
							}
							catch (Exception e) {
								e.printStackTrace();
							}
						}
						else //재고가 부족할 경우
						{
							try {
								String query3 = "select * from ret_has where item_id = '" + i_id + "' and stock >= "
										+ quantity + ";"; //재고가 있는 다른매장을 찾음
								System.out.println("여섯번째 :" + query3);
								PreparedStatement pstmt3 = con.prepareStatement(query3);
								ResultSet rs3 = pstmt3.executeQuery();
								String ret_id = rs3.getString(1); //재고가 존재하는 매장의 아이디 저장
								try { //매장의 재고를 줄임
									String query4 = "update ret_has set stock = stock - " + quantity + "where item_id = '"
											+ i_id + "' and ret_id = '" + ret_id + "';"; //매장의 재고를 줄임.
									System.out.println("일곱번째 :" + query4);
									PreparedStatement pstmt4 = con.prepareStatement(query4);
									pstmt4.executeUpdate();
								}
								catch (Exception e) {
									e.printStackTrace();
								}
								try { //상품의 재고를 줄임
									String query4 = "update item set stock = stock - " + quantity + "where item_id = '"
											+ i_id + "';"; //상품의 재고를 줄임.
									System.out.println("여덟번째 :" + query4);
									PreparedStatement pstmt4 = con.prepareStatement(query4);
									pstmt4.executeUpdate();
								}
								catch (Exception e) {
									e.printStackTrace();
								}
								try { //배달 정보를 등록
									String query4 = "insert into delivery values('" + id + "', '" + ret_id + "');"; //배송정보 넣기.
									System.out.println("아홉번째 :" + query4);
									PreparedStatement pstmt4 = con.prepareStatement(query4);
									pstmt4.executeQuery();
								}
								catch (Exception e) {
									e.printStackTrace();
								}
							}
							catch (Exception e) {
								e.printStackTrace();
								System.out.println("1");
							}
						}
					}
					catch (Exception e) {
						e.printStackTrace();
						System.out.println("1");
					}
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("1");
			}
		
			//shop_has 전체 삭제
			try {
				query = "delete from shop_has where s_id in (select shop_id from shoppingbag where cus_no = '" + id
						+ "' and order_date is null);";
				System.out.println(query);
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);
				pstmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
				System.out.println("1");
			}
			try {
				query = "update shoppingbag set order_date = '" + year + "-" + month + "-" + date + "' where cus_no = '"
						+ id + "' and order_date is null;";
				System.out.println(query);
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
				out.println("<script>alert('구매 완료'); location.href='MainMenu_Main.jsp'</script>");
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>