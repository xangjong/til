<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			/* int width = Integer.parseInt(request.getParameter("width"));
			int height = Integer.parseInt(request.getParameter("length")); */
			
			float width_f = Float.parseFloat(request.getParameter("width"));
			float length_f = Float.parseFloat(request.getParameter("length"));

		%>
		
		<%-- 사각형의 넓이 : <%= width * length %><br> --%>
		사각형의 넓이(실수) : <%= width_f * length_f %>
		
	</body>
</html>