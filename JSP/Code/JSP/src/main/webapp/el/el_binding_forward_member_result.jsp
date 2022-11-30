<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MemberBean 객체 바인딩</title>
	</head>
	<body>
<%
   	request.setCharacterEncoding("UTF-8");		
%>		
	<!-- 바인딩된 MemberBean 객체로 속성에 접근하여 데이터 출력  -->
		id : ${mem.id }  <br>
		pwd : ${mem.pwd }  <br>
		name : ${mem.name }  <br>
		email : ${mem.email }  <br>
	</body>
</html>