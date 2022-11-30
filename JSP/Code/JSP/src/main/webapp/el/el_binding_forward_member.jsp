<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sec01.MemberBean2" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MemberBean 객체 바인딩</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");	
			
			// MemberBean2 객체 생성하면서 초기화 : 생성자에게 값 전달
			// MemberBean2 클래스에 매개변수가 있는 생성자 필요
			MemberBean2 mem = new MemberBean2("lee", "1234", "이몽룡", "lee@abc.com");
			// 바인딩
			request.setAttribute("mem", mem);		
		%>
		<jsp:forward page="el_binding_forward_member_result.jsp" />
	</body>
</html>