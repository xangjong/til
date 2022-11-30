<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>변수</title>
	</head>
	<body>
		<%! 
			int x =10;
			long y=100;
			float floatValue = 3.14f;
			double doubleValue = 3.14;
			char a = 'A';
			String myJob = "풀스택 개발자";
			boolean b = true;
		%>
		
		<%
			y =100;
			String address ="제주";
		%>
		<h3>변수 값 출력</h3>
		x : <%= x %> <br>
		y : <%= y %> <br>
		floatValue : <%= floatValue %> <br>
		doubleValue : <%= doubleValue %> <br>
		a : <%= a %> <br>
		myJob : <%= myJob %> <br>
		b : <%= b %> <br>
	</body>
</html>