<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="sec01.MemberBean2" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MemberBean 객체 + ArrayList</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("UTF-8");	
		
		MemberBean2 m1 = new MemberBean2("kim", "1234", "김길동", "kim@naver.com");
		MemberBean2 m2 = new MemberBean2("lee", "1111", "이몽룡", "lee@naver.com");
		MemberBean2 m3 = new MemberBean2("park", "2222", "박길동", "park@naver.com");
		
		ArrayList<MemberBean2> memList = new ArrayList<MemberBean2>();
		memList.add(m1);
		memList.add(m2);
		memList.add(m3);
		
		// 데이터 바인딩
		request.setAttribute("memList", memList);		
		%>
		
		<jsp:forward page="el_binding_forward_member_arr_result.jsp" />
	</body>
</html>