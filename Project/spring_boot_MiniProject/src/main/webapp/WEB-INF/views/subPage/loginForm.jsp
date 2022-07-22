<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/MenuTab.js"></script>
		<script src="js/login.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/loginSection.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>Login</h1>
				<h2><a href="#"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<form class="loginForm" id="loginForm" name="loginForm">
					<div class="input">
						<div class="inpuEventBox">
							<c:if test="${not empty userId}">
								<input type="text" id="userId" class="idInput" name="id" value="${userId}" autocomplete="off" required>
							</c:if>
							<c:if test="${empty userId}">
								<input type="text" id="userId" class="idInput" name="id" value="" autocomplete="off" required>
							</c:if>
							<label for="idInput" class="eventLabel"><span>아이디</span></label>
						</div> <!-- inpuEventBox -->
						<div class="inpuEventBox">
							<input type="password" class="pwInput" id="userPw" name="pwd" autocomplete="off" required>
							<label for="pwInput" class="eventLabel"><span>비밀번호</span></label>
						</div>	<!-- inpuEventBox -->
						<input type="submit" class="loginBtn btn-gradient blue" value="로그인">
					</div> <!-- input -->					
				</form>
				
				<div class="joinPass">
					<ul>
						<li><a href="/idSearchForm">아이디 찾기 |</a></li>
						<li><a href="/pwSearchForm">비밀번호 찾기 |</a></li>	
						<li><a href="<c:url value='/joinForm'/>" class="join">회원가입</a></li>
					</ul>
				</div> <!-- joinPass -->
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>