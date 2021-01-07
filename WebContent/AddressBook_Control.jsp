<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="AddressBook_Error.jsp" import="jspbook.addressbook.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="ab" class="jspbook.addressbook.AddressBean" scope="page"/>
	<jsp:useBean id="addrbook" class="jspbook.addressbook.AddressBook"/>
	<jsp:setProperty property="*" name="addrbook"/>
	
	<%
		String action = request.getParameter("action");
	
		if(action.equals("list")) {			//주소록 목록 보여주기 - getDBList()
			ArrayList arr = ab.getDBList();
			request.setAttribute("arr", arr);
			pageContext.forward("AddressBook_List.jsp");
		}
		
		else if(action.equals("insert")) {			//주소록 신규 등록하기 - insertList()
			if(ab.insertDB(addrbook)) {
				response.sendRedirect("AddressBook_Control.jsp?action=list");
			}
			else {
				throw new Exception("DB입력오류");
			}
		}
		
		//수정
		else if(action.equals("edit")) {
			AddressBook abook = ab.getDB(addrbook.getId());
			if(!request.getParameter("passwd").equals("1234")) {
				out.println("<script>alert('비밀번호가 틀렸습니다'); history.go(-1);</script>");
			}
			
			else {
				request.setAttribute("ab",abook);
		%>
		<jsp:forward page="AddressBook_Edit_Form.jsp" />
			
		<% 	
			}
		}
		
		//수정처리 - updateDB()
		else if(action.equals("update")) {
			if(ab.updateDB(addrbook)) {
				response.sendRedirect("AddressBook_Control.jsp?action=list");
			}
			else {
				throw new Exception("DB갱신오류");
			}
		}
		
		//삭제처리
		else if(action.equals("delete")) {
			if(ab.deleteDB(addrbook.getId())) {
				response.sendRedirect("AddressBook_Control.jsp?action=list");
			}
			else {
				throw new Exception("DB삭제오류");
			}
		}
	%>
</body>
</html>