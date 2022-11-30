<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>scope 우선순위</title>
	</head>
	<body>
	<%	
		session.setAttribute("name", "세션");
		//request.setAttribute("name", "request");
		application.setAttribute("name", "애플리케이션");		
	%>
	
	<jsp:forward page="scope_priority_result.jsp" />		
	</body>
</html>