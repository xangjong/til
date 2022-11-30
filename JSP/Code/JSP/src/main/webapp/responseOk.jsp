<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>response 객체 : 응답 페이지</title>
	</head>
	<body>
		<%! // 선언부에 변수 선언
			String answer;
		%>
		
		<%
		// 요청 처리
			request.setCharacterEncoding("UTF-8");
			
		// 전달된 값 받기
			answer = request.getParameter("answer");
		
		// response 객체 사용해서 응답 처리
			  if(answer.equals("서울") ){
				response.sendRedirect("pass.jsp");
			} else response.sendRedirect("fail.jsp");
		
		%>
		
		
	</body>
</html>