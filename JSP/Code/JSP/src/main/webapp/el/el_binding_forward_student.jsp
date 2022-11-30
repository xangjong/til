<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sec01.StudentBean2"%>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>StudentBean 객체 바인딩</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			// MemberBean2  객체 생성하면서 초기화 : 생성자에게 값 전달
			// MemberBean2 클래스에 매개변수가 있는 생성자 필요
			StudentBean2 std = new StudentBean2("1001", "홍길동", "101-111-1234", "서울시 종로구", 2);
			
			// 바인딩
			request.setAttribute("std", std);
		%>
		<jsp:forward page="el_binding_forward_student_result.jsp" />
	</body>
</html>