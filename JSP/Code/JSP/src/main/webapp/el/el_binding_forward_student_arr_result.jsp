<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>StudentBean 객체 + ArrayList</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("utf-8");	
	%>
	<!-- 바인딩 된 ArrayList 인덱스로 속성에 접근하여 데이터 출력 -->
	<table border="1">
		<tr><th>학번</th><th>성명</th><th>전화번호</th><th>주소</th><th>학년</th></tr>
		<tr>
			<td>${stdList[0].stdNo}</td><td>${stdList[0].stdName}</td>
			<td>${stdList[0].stdPhone}</td><td>${stdList[0].stdAddress}</td>
			<td>${stdList[0].stdYear}</td>
		</tr>
		<tr>
			<td>${stdList[1].stdNo}</td><td>${stdList[1].stdName}</td>
			<td>${stdList[1].stdPhone}</td><td>${stdList[1].stdAddress}</td>
			<td>${stdList[1].stdYear}</td>
		</tr>
		<tr>
			<td>${stdList[2].stdNo}</td><td>${stdList[2].stdName}</td>
			<td>${stdList[2].stdPhone}</td><td>${stdList[2].stdAddress}</td>
			<td>${stdList[2].stdYear}</td>
		</tr>
	</table>
	
	<!-- JST 사용해서 출력 -->
	</body>
</html>