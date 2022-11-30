<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "id" value ="hong" scope="page"/>
<c:set var = "pwd" value ="1234" scope="page"/>
<c:set var = "name" value ="홍길동" scope="page"/>
<c:set var = "age" value ="${20}" scope="page"/>

<c:set var = "contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:set</title>
	</head>
	<body>
		${ id } <br>
		${ pwd } <br>
		${ name } <br>
		${ age } <br><br>
		
		<a href="${contextPath }/el/login.jsp">로그인 페이지로 이동</a>
		<a href="${pageContext.request.contextPath}/el/login.jsp">로그인4</a>
	</body>
</html>