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

	<h1>메인 메뉴</h1>
	<hr>
	<table>
		<tr>
			<td><a href="MainCate_Main.jsp">카테고리 선택</a>&nbsp;&nbsp;&nbsp;
			<a href="Mem_Info_Change_Main.jsp">회원정보수정</a>&nbsp;&nbsp;&nbsp;
			<a href="PwChange_Main.jsp">비밀번호변경</a>&nbsp;&nbsp;&nbsp;
			<a href="Login_Main.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;
			<a href="Shoppingbag.jsp">장바구니</a>&nbsp;&nbsp;&nbsp;
			<a href="Search_Main.jsp">상품검색</a>
			</td>
		</tr>
	</table>
</body>
</html>