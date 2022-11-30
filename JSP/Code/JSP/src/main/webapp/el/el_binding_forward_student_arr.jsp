<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="sec01.StudentBean2"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			StudentBean2 vo1 = new StudentBean2("1001", "홍길동", "101-111-1234", "서울시 종로구", 2);
			StudentBean2 vo2 = new StudentBean2("1002", "박훈", "101-657-1234", "경기도 파주시", 1);
			StudentBean2 vo3 = new StudentBean2("1003", "김정률", "101-435-1234", "경기도 분당", 3);
			
			ArrayList<StudentBean2> stdList = new ArrayList<StudentBean2>();
			stdList.add(vo1);
			stdList.add(vo2);
			stdList.add(vo3);
			
			// 바인딩
			request.setAttribute("stdList", stdList);
		%>
		<jsp:forward page="el_binding_forward_student_arr_result.jsp" />
	</body>
</html>