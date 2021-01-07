<%@page import="jspbook.addressbook.AddressBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="AddressBook_Error.jsp"%>
<%@page import="java.util.*, jspbook.addressbook.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function ch(ab_id) {
		pwd = prompt("수정/삭제 하려면 비밀번호를 입력해주세요");
		document.location.href="AddressBook_Control.jsp?action=edit&id="+ab_id+"&passwd="+pwd;
	}
</script>
</head>
<body>
	<jsp:useBean id="datas" class="java.util.ArrayList" scope="request"/>
	
	<% datas = (ArrayList<AddressBook>)request.getAttribute("arr"); %>
	
	<div align="center">
		<h2>주소록 목록화면</h2>
		<hr>
		<form>
			[<a href="AddressBook_Form.jsp">주소록 등록</a>]<p>
			
			<table border="1">
				<tr bgcolor="#99CCFF">
					<th>번호</th><th>이름</th><th>이메일</th><th>회사</th><th>생일</th><th>전화번호</th><th>메모</th>
				</tr>
				<%
             for(AddressBook ab :(ArrayList<AddressBook>)datas) {
       	   %>
            <tr>
               <td><a href="javascript:ch(<%=ab.getId()%>)"><%=ab.getId() %></a></td>
               <td><%=ab.getName() %></td>
               <td><%=ab.getTel() %></td>
               <td><%=ab.getBirth() %></td>
               <td><%=ab.getComdept() %></td>
               <td><%=ab.getMemo() %></td>
               <td><%=ab.getEmail() %></td>
            </tr>
           <%
                  }
           %>

			</table>
		</form>
	</div>
</body>
</html>