<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="AddressBook_Error.jsp"%>
<%@ page import="jspbook.addressbook.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="AddressBook.css" media="screen">
<script type="text/javascript">
	function deletechk() {
		result = confirm("정말로 삭제하시겠습니까?");
		if(result = true) {
			document.frm1.action.value="delete";
			document.frm1.submit();
		}
	}
</script>
</head>
<body>
	<jsp:useBean id="ab" class="jspbook.addressbook.AddressBook" scope="request"/>
	<div align="center">
		<h2>주소록 수정화면</h2>
		<hr>
		[<a href="AddressBook_List.jsp">주소록 목록</a>]
		<form action="AddressBook_Control.jsp" name="frm1" method="post">
			<input type="hidden" name="id" value="<%= ab.getId() %>">
			<input type="hidden" name="action" value="update">
			
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%= ab.getName() %>"></td>
				</tr>
				<tr>
					<th>email</th><td><input type="text" name="email" value="<%=ab.getEmail() %>"></td>
				</tr>
				<tr>
					<th>전화번호</th><td><input type="text" name="tel" value="<%=ab.getTel() %>"></td>
				</tr>
				<tr>
					<th>생일</th><td><input type="date" name="birth" value="<%=ab.getBirth() %>"></td>
				</tr>
				<tr>
					<th>회사</th><td><input type="text" name="comdept" value="<%=ab.getComdept() %>"></td>
				</tr>
				<tr>
					<th>메모</th><td><input type="text" name="memo" value="<%=ab.getMemo() %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="저장">
						<input type="reset" value="취소">
						<input type="button" value="삭제" onclick="deletechk()">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>