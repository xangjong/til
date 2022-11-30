<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<jsp:useBean id = "member" class = "sec01.MemberBean" scope="page">
			<jsp:setProperty property = "*" name="member"/>
		</jsp:useBean>
		
		<h3>MemberBean 속성 값 출력(Getter 사용)</h3>
		아이디 : <%= member.getId() %><br>
		비밀번호 : <%= member.getPwd() %><br>
		이름 : <%= member.getName() %><br>
		이메일 : <%= member.getEmail() %><br>
		
	</body>
</html>