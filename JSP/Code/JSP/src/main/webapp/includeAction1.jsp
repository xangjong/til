<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>includeAction 태그 </title>
	</head>
	<body>
		<h2>includeAction1.jsp 입니다.</h2>
		<hr>
		<jsp:include page = "includeAction2.jsp" flush="true"/>
	</body>
</html>