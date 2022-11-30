<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>자바빈</title>
	</head>
	<body>
		<!-- StudentBean 사용 : 모든 프로퍼티에 값 설정 -->
		<jsp:useBean id = "student" class = "sec01.StudentBean" scope="page">
			<jsp:setProperty property = "*" name="student"/>
		</jsp:useBean>
		
		<h3>StudentBean 속성 값 출력(Getter 사용)</h3>
		학번 : <%= student.getStdNo() %><br>
		성명 : <%= student.getStdName() %><br>
		전화 : <%= student.getStdPhone() %><br>
		주소 : <%= student.getStdAddress() %><br>
		학년 : <%= student.getStdYear() %>	
	</body>
</html>