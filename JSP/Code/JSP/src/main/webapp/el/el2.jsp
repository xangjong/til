<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "member" class = "sec01.MemberBean" scope="page">
	<jsp:setProperty property = "name" name="member" value="홍길동"/>
</jsp:useBean>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL</title>
	</head>
	<body>
		${empty member } <br>	
		${not empty member } <br>	
		${member.name } 
	</body>
</html>