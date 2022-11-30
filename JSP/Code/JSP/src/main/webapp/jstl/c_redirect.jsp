<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:redirect</title>
	</head>
	<body>
		<c:redirect url="c_redirect_result.jsp">
			<c:param name="name" value="홍길동"/>
		</c:redirect>
	</body>
</html>