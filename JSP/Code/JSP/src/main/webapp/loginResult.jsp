<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginResult</title>
	</head>
	<body>
		<%
			String userId = request.getParameter("user_id");
		// 아이디 값이 없는 경우 login.jsp로 포워딩		
		// if(userId.equals(""))
			if(userId.length()==0){
		%>	
			<jsp:forward page="login.jsp"/>
		<% 
			} 
		%>
		
		<h3>환영합니다 <%= userId %>님!</h3>
	</body>
</html>