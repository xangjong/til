<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>포매팅 태그 라이브러리</title>
	</head>
	<body>
		<h3>fmt:formatNumber 태그 이용한 숫자 포맷팅</h3>
		<c:set var="price" value="1000000"/>
		기본(천단위 구분) : <fmt:formatNumber value ="${price }" type="number"/> <br>
		원화 : <fmt:formatNumber value ="${price }" type="currency" currencySymbol="₩"/><br>
		달러 : <fmt:formatNumber value ="${price }" type="currency" currencySymbol="$"/><br>
		천단위 구분 없음 : <fmt:formatNumber value ="${price }" type="number" groupingUsed="false"/> <br>
		퍼센트 : <fmt:formatNumber value ="${price }" type="percent" groupingUsed="false"/> <br>
		
		<h3>fmt:formatDate 태그 이용한 날짜 포맷팅</h3>
		<c:set var = "now" value="<%= new Date() %>" />
		<fmt:formatDate value="${now }" type="date"/> <br>
		<fmt:formatDate value="${now }" type="date" dateStyle="full"/> <br>
		<fmt:formatDate value="${now }" type="date" dateStyle="short"/> <br>
		<fmt:formatDate value="${now }" type="time"/> <br>
		<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/> <br>
		<fmt:formatDate value="${now }" pattern="YYYY-MM-dd : hh:mm:ss"/> <br>
		<fmt:formatDate value="${now }" pattern="YYYY-MM-dd"/> <br>
		<fmt:timeZone value="America/New_York">
			<fmt:formatDate value="${now }" type="both" dateStyle="full" timeStyle="full"/> <br>
		</fmt:timeZone>
	</body>
</html>