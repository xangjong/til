<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MemberBean 객체 + ArrayList</title>
	</head>
	<body>
<%
		request.setCharacterEncoding("UTF-8");	
%>
		
		<!--  바인딩된 ArrayList 인덱스로 속성에 접근하여 데이터 출력 (for 사용하지 않음) -->
		<table border="1">
			<tr><th>아이디</th><th>비밀번호</th><th>성명</th><th>이메일</th></tr>
			<tr><td>${memList[0].id }</td><td>${memList[0].pwd }</td>
				   <td>${memList[0].name }</td><td>${memList[0].email }</td></tr>
		   <tr><td>${memList[1].id }</td><td>${memList[1].pwd }</td>
				   <td>${memList[1].name }</td><td>${memList[1].email }</td></tr>
		  <tr><td>${memList[2].id }</td><td>${memList[2].pwd }</td>
				   <td>${memList[2].name }</td><td>${memList[2].email }</td></tr>		
		</table>
		
		
		<!--  JSTL 반복문 사용해서 출력 -->
		
		<table border="1">
			<c:forEach items="${memList }" var ="data">
				<tr>
					<td>${data.id }</td><td>${data.pwd }</td>
					<td>${data.name }</td><td>${data.email }</td>
				</tr>
			</c:forEach>
		</table>
		
	</body>
</html>