<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
  function mySubmit(index) {
    if (index == 1) {
      document.myForm.action='SignIn_Main.jsp';
    }
    if (index == 2) {
      document.myForm.action='SingIn_Main.jsp';
    }
    document.myForm.submit();
  }
</script>

	<h1>관리자 메뉴</h1>
	<hr>
	<table>
		<tr>
			<td><a href="Stock_Order_Main.jsp">재고 주문</a>&nbsp;&nbsp;&nbsp;
			<a href="Mem_Info_Change_Main.jsp">재고 조회</a>&nbsp;&nbsp;&nbsp;
			<a href="PwChange_Main.jsp">매출 확인</a>&nbsp;&nbsp;&nbsp;
			<a href="Login_Main.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
			
			</td>
		</tr>
	</table>
</body>
</html>