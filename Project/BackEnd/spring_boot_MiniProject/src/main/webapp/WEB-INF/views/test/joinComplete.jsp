<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 완료</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/test/joinComplete.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/joinComplete.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout_test/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>회원가입 완료</h1>
				<h2><a href="/"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<div class="joinMentBtn">
					<ul class="joinMent">	
						<li><a>회원가입이 <span class="colorFont">완료</span> 되었습니다.</a><br><br></li>
						<li><a><span class="colorFont">위더스</span>의 일원이 되신 것을 축하합니다.</a><br><br></li>
					</ul> <!-- joinMent -->
					
					<ul class="loginHomeBtn">
						<li><input type="button" class="homeBtn btn-gradient " value="홈으로"></li>
					</ul>
				</div> <!-- joinMentBtn -->
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout_test/bottom.jsp"/>
	</body>
</html>