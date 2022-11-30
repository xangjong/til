<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>functions 라이브러리 - 문자열 처리 함수</title>
	</head>
	<body>
		<c:set var="title1" value=" hello world! "/>
		<c:set var="title2" value="쇼핑몰 중심 JSP입니다!"/>
		<c:set var="str" value="중심"/>
		
		<h3>문자열 처리 함수</h3>
		title1 : ${title1 }<br>
		title2 : ${title2 }<br>
		str : ${str }<br><br>
		
		title1의 문자열 길이 (length()) : ${fn:length(title1)} <br>
		title1을 대문자로 변경 (toUpperCase()) : ${fn:toUpperCase(title1)} <br>
		title1을 소문자로 변경 (toLowerCase()) : ${fn:toLowerCase(title1)} <br><br>
		
		3번째 ~ 5번째 문자열 추출 : ${fn:substring(title1, 2,5) } <br>
		앞뒤 공백 제거 : ${fn:trim(title1) }<br>
		공백을 /로 변환 : ${fn:replace(title1, " ", "/") }<br><br>
		
		title1에 '중심' 포함 여부 확인 : ${fn:contains(title1, str) } <br>
		title2에 '중심' 포함 여부 확인 : ${fn:contains(title2, str) } <br>
		title2에서 '중심'의 시작 위치(인덱스0부터) 확인 : ${fn:indexOf(title2, str)}<br>
		
	</body>
</html>