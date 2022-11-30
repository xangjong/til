<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*" %>
    
 <%! 
 	Date today = new Date();
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Includ 지시어 : top.jsp</title>
	</head>
	<body>
		<font color="blue" size="3pt">
			top.jsp입니다. <p>
			<%= today.toLocaleString() %>
		</font>
	</body>
</html>