<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MainPage</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/index.js"></script>
	</head>
	<body>
		<div class="wrap">
			<header>
				<div class="mainMenu">
					<div class="menuImg">
						<a href="<c:url value='/'/>"><img src="image/logo-withus.png"></a>
					</div>
					<div class="topMenu">
						<div class="underline"></div>
						<a href=<c:url value='/'/>>Home</a>
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
						</c:if>
					</div>
				</div>
			</header>
			<section>
				<div class="sectionWrap">
					<div class="mainTitle">
						<h1>
							With:us
						</h1>
					</div>
					<div class="bodyMenuWrap">
						<div class="bodyMenu">
							<a href="<c:url value='/noticePage'/>"><img class="boardPhoto" src="image/공지.png"></a>
							<h2 class="boardTitle">Notice</h2>
							<p class="boardText">여러가지 공지사항을 확인해보세요</p>
						</div>
						<div class="bodyMenu">
							<a href="<c:url value='/questionPage'/>"><img class="boardPhoto" src="image/질문.png"></a>
							<h2 class="boardTitle">Question</h2>
							<p class="boardText">모르는 코딩이나 알려주고 싶은 것이 있으면 서로 질문을 주고 받으세요</p>
						</div>
						<div class="bodyMenu">
							<a href="<c:url value='/talkPage'/>"><img class="TalkPhoto boardPhoto" src="image/Talk.png"></a>
							<h2 class="boardTitle">Talk</h2>
							<p class="boardText">당신의 고민을 모두 WITH:US에서 <br>함께 이야기해 봐요</p>
						</div>
					</div>
				</div>			
			</section>
		</div>
	</body>
</html>