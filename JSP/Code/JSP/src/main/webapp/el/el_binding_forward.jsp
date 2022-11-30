<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL 바인딩</title>
	</head>
	<body>
		<%
			// setAttribute(속성명(바인딩되는 속성 이름), 속성값)
			request.setAttribute("id", "kim");
			request.setAttribute("pwd", "1111");
			request.setAttribute("name", "김길동");
			request.setAttribute("email", "kim@abc.com");			
		%>
		
		<jsp:forward page="el_binding_forward_result.jsp"/>
	</body>
</html>