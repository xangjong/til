<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var = "id" value ="hong" scope="page"/>
<c:set var = "pwd" value ="1234" scope="page"/>
<c:set var = "name" value ="홍길동" scope="page"/>
<c:set var = "age" value ="${20}" scope="page"/>
<c:set var = "height" value ="${170}" scope="page"/>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:if</title>
	</head>
	<body>
		<c:if test="${true }">
			<h3>항상 참입니다.</h3>
		</c:if>
		
		<c:if test="${height>160 }">
			<h3>${name }의 키는 160보다 큽니다.</h3>
		</c:if>
		
		<!-- 아이디고 'hong'이고 비밀번호가 '1234'이면 로그인 성공 출력-->
		
		<c:if test="${id=='hong' && pwd == '1234'}" >
			<h3>로그인 성공</h3>
		</c:if>
		
		<c:if test="${id!='hong' || pwd != '1234'}" >
			<h3>로그인 실패</h3>
		</c:if>
		
	</body>
</html>