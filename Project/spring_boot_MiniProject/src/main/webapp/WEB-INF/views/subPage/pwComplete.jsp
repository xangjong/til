<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>임시 비밀번호 발급 완료</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/complete.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/complete.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>임시 비밀번호 발급 완료</h1>
				<h2><a href="/"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<div class="joinMentBtn">
					<ul class="joinMent">	
						<li><a>임시 비밀번호는 <span class="colorFont">${tmpPw}</span>입니다.</a><br><br></li>
						<li><a>분실되지 않도록 <span class="colorFont">저장</span>할 것을 권합니다.</a><br><br></li>
					</ul> <!-- joinMent -->
					
					<ul class="loginHomeBtn">
						<li><input type="button" class="homeBtn btn-gradient" value="홈으로"></li>
					</ul>
				</div> <!-- joinMentBtn -->
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>