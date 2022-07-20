<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Top 메뉴</title>
		<link rel="stylesheet" type="text/css" href="css/headerMenu.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
	</head>
	<body>
		<header>
			<div class="mainMenu">
				<div class="menuImg">
					<a href="<c:url value='/'/>"><img src="image/logo-withus2.png"></a>
				</div>
				<div class="topMenu">
					<div class="underline"></div>
					<a href="<c:url value='/'/>">Home</a>
					<a href="<c:url value='/noticePage'/>">Notice</a>
					<a href="<c:url value='/questionPage'/>">Question</a>
					<a href="<c:url value='/talkPage'/>">Talk</a>
					<a href="<c:url value='/ITNewsPage'/>">IT News</a>
				</div>
				<div class="login">
					<c:if test="${empty sessionScope.sid}">
						<a href="<c:url value='/loginForm'/>">로그인</a>
						<a>|</a>
						<a href="<c:url value='/join'/>">회원가입</a>
					</c:if>
					<c:if test="${not empty sessionScope.sid}">
						${sessionScope.sid}님
						<a href="<c:url value='/logout'/>">로그아웃</a> 
						<a>|</a>
						<a href="<c:url value='/myPage'/>">마이페이지</a>
						<a>|</a>
						<a href="<c:url value='/adminPage'/>">관리자</a>
					</c:if>
				</div>
			</div>
		</header>
	</body>
</html>