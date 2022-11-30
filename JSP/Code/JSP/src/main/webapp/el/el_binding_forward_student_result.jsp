<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>StudentBean 객체 바인딩</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		%>
		<!-- 바인딩 된 StudentBean2 객체로 속성에 접근하여 데이터 출력 -->
		학번 : ${std.stdNo}<br>
		성명 : ${std.stdName}<br>
		핸드폰번호 : ${std.stdPhone}<br>
		주소 : ${std.stdAddress}<br>
		학년 : ${std.stdYear}<br>
	</body>
</html>