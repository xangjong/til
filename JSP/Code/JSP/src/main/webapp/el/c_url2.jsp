<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="url1" value="/el/login.jsp"/>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:url</title>
	</head>
	<body>
		<a href="${url1 }">로그인 페이지로 이동</a><br>
		
		el 폴더에서 image 폴더의 apple.png 접근<br>
		<img src="<c:url value='/image/apple.png' />">
	</body>
</html>