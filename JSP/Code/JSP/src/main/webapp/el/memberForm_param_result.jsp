<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>param 내장 객체</title>
	</head>
	<body>
		<h3>폼에서 전달된 값 출력(EL :param 내장 객체 사용)</h3>
		아이디 : ${param.id } <br>
		비밀번호 : ${param.pwd } <br>
		성명 : ${param.name } <br>
		이메일 : ${param.email } <br>
	</body>
</html>