<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인창</title>
	</head>
	<body>
		<%
			String userId = request.getParameter("user_id");
			if(userId ==null) {
		%>
			<h3>로그인</h3>
		<%
			} else {
		%>
			<h3>로그인</h3>
			<h4>아이디를 입력하지 않았습니다. 아이디를 입력하세요.</h4>
		<% 
			}
		%>
		
		
	   <form name="frmLogin" method="post" action="loginResult.jsp" > 
	  <!-- <form name="frmLogin" method="get" action="login"  -->
		   아이디  :<input type="text" name="user_id"><br>
	     비밀번호:<input type="password" name="user_pw" ><br>
	    <input type="submit" value="로그인">  <input type="reset" value="다시입력">
	  </form>
	</body>
</html>