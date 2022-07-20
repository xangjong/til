<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/loginSection.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>Login</h1> 
				<h2><a href="#"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<form class="loginForm" name="loginForm" method="post">
					<div class="input">
						<div class="inpuEventBox">
							<input type="text" class="idInput" name="id" autocomplete="off" required>
							<label for="idInput" class="eventLabel"><span>아이디</span></label>
						</div> <!-- inpuEventBox -->
		
						<div class="inpuEventBox">
							<input type="password" class="pwInput" name="pwd" autocomplete="off" required>
							<label for="pwInput" class="eventLabel"><span>비밀번호</span></label>
						</div>	<!-- inpuEventBox -->
									
						<input type="submit" class="loginBtn btn-gradient cyan" value="로그인">
					</div> <!-- input -->					
				</form>
				
				<div class="joinPass">
					<ul>
						<li><a href="#">아이디 찾기 |</a></li>
						<li><a href="#">비밀번호 찾기 |</a></li>	
						<li><a href="<c:url value='/join'/>" class="join">회원가입</a></li>
					</ul>
				</div> <!-- joinPass -->
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>