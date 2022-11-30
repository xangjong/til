<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>request 객체</title>
	</head>
	<body>
		<!-- 선언부에서 변수 선언할 경우 -->
		<%-- <%!
		String name, id, pwd, h1, h2,  year, department;
		String[] interests;
		%> --%>
		<%
			request.setCharacterEncoding("utf-8");
			
			// 스크립트릿 영역에서 변수 선언 및 전달받은 값 저장
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String hp = request.getParameter("hp1") + "-" + request.getParameter("hp2") + "-" + request.getParameter("hp3");
			String year = request.getParameter("year");
			String[] interests = request.getParameterValues("interest");
			String department = request.getParameter("department");
		%>
		
		<!-- 변수에 저장된 값 출력 : 표현식 사용 -->
		<h3>회원 가입 내용</h3>
		성명 : <%= name %><br>
		아이디 : <%= id %><br>
		비밀번호 : <%= pwd %><br>
		휴대폰 번호 : <%= hp %> <br>
		학년 : <%= year %> <br>
		관심분야 :
		<% 
			for(String interest : interests){ 
		%>
			<%= interest + " " %>
		<% 
			} 
		%><br>
		학과 : <%= department %><br>
	</body>
</html>








