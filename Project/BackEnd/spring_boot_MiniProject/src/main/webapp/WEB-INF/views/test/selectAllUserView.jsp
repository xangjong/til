<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value='css/common.css' /> " rel="stylesheet" type="text/css">
<script src="<c:url value='js/jquery-3.6.0.min.js' /> "></script>
<title>Insert title here</title>
</head>
<body>
<c:forEach var="user" items="${userList}" varStatus="status">
	<c:out value="${user.userId}"/>
	<c:out value="${user.userName}"/>
</c:forEach>
</body>
</html>