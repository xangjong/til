<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>request 객체</title>
	</head>
	<body>
		<%
			out.print("서버 : " + request.getServerName() + "<br>");
			out.print("포트 번호 : " + request.getServerPort() + "<br>");
			out.print("요청 방식 : " + request.getMethod() + "<br>");
			out.print("프로토콜 : " + request.getProtocol() + "<br>");
			out.print("URL : " + request.getRequestURL() + "<br>");
			out.print("URI : " + request.getRequestURI() + "<br>");
			out.print("ContextPath : " + request.getContextPath() + "<br>");
			out.print("ServletPath : " + request.getServletPath() + "<br>");
			
			
		%>
	</body>
</html>