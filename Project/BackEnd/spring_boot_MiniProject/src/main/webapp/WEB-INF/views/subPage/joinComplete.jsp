<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 완료</title>
		<script src="../js/jquery-3.6.0.min.js"></script>
		<script src="../js/MenuTab.js"></script>
		<script src="../js/join.js"></script>
		<script src="../js/joinComplete.js"></script>
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/joinComplete.css">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>회원가입 완료</h1>
				<h2><a href="<c:url value='/'/>"><img src="image/logo-withus3.PNG"></a></h2>
				<div class="joinMentBtn">
					<ul class="joinMent">	
						<li><a>회원가입이 <span class="colorFont">완료</span> 되었습니다.</a><br><br></li>
						<li><a><span class="colorFont">위더스</span>의 일원이 되신 것을 축하합니다.</a><br><br></li>
					</ul> <!-- joinMent -->
					
					<ul class="loginHomeBtn">
						<li><input type="button" class="loginBtn btn-gradient cyan" value="로그인"></li>
						<li><input type="button" class="homeBtn btn-gradient " value="홈으로"></li>
					</ul>
				</div> <!-- joinMentBtn -->
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>