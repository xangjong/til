<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메소드/title>
	</head>
	<body>
		<%!
			String id = "abcd";
		
			// 메소드는 반드시 선언부에서 정의 (스크립트릿 영역에서 정의하면 오류 발생)
			public String getId(){
				return id;
			}
			
		%>
		
		id : <%= id %> <br>
		메소드 getId 호출한 결과 : <%= getId() %> 
	</body>
</html>