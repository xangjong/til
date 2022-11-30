<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%
	ArrayList dataList = new ArrayList();
	dataList.add("hello");
	dataList.add("world");
	dataList.add("안녕하세요~!");
%>
<c:set var="list" value="<%= dataList %>" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:forEach</title>
	</head>
	<body>
		<c:forEach var="data" items="${list }">
			${data }<br>
		</c:forEach>
		
		<hr>
		
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
			i = ${i }  &nbsp;&nbsp;&nbsp;  반복횟수 : ${loop.count }
			&nbsp;&nbsp;&nbsp; index : ${loop.index }
			&nbsp;&nbsp;&nbsp; ${loop.first? '첫번째' : '' } ${loop.last? '마지막' : '' }
			<br>
		</c:forEach>
		
		<hr>
		
		<c:forEach var="i" begin="1" end="10" step="2">
			5 * ${i } = ${5*i } 
			<br>
		</c:forEach>
		
		<hr>
		
		<c:set var="fruits" value="사과, 파인애플, 바나나, 망고, 귤" />
		<c:forTokens var="token" items="${fruits }" delims=",">
			${token } <br>
		</c:forTokens>
		
	</body>
</html>