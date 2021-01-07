<%@page import="java.util.ArrayList"%>
<%@page import="jspbook.addressbook.AddressBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="AddressBook_Error.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="AddressBook.css" media="screen">
</head>
<body>
	<div align="center">
		<h2>주소록 작성화면</h2>
		<hr>
		[<a href="AddressBook_List.jsp">주소록 목록</a>]<p>
		
		<form action="AddressBook_Control.jsp" name="frm1" method="post">
			<input type="hidden" name="action" value="insert">
			<table border="1">
				<tr>
					<th>이름</th><td><input type="text" name="name" maxlength="15"></td>
				</tr>
				<tr>
					<th>email</th><td><input type="text" name="email" maxlength="50"></td>
				</tr>
				<tr>
					<th>회사</th><td><input type="text" name="comdept" maxlength="20"></td>
				</tr>
				<tr>
					<th>생일</th><td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<th>전화번호</th><td><input type="text" name="tel" maxlength="20"></td>
				</tr>
				<tr>
					<th>메모</th><td><input type="text" name="memo"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>