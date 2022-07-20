<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myPage</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPage.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout_test/top.jsp"/>
		<section>
			<div class="myPageBox">
				<h1>My page</h1>
				
				<ul class="userPage">
					<li><a href="#"><span>activity</span></a></li>
					<li><a href="<c:url value='/test/myPageEdit/${sessionScope.sid}'/>"><span>edit</span></a></li> 
				</ul> <!-- userPage -->
				
				<div class="userProfileBox">
					<div class="userBox">
						<!-- 프로필 사진 추가하지 않을 경우 기본 이미지 출력 -->
						<c:if test="${empty user.userImg}">
							<img id="profileImg" class="profileImg" src="<c:url value='/image/user1.png'/>" style="cursor:pointer"/>
						</c:if>
								
						<!-- 프로필 사진 추가할 경우 해당 이미지 출력 -->
						<c:if test="${not empty user.userImg}">
							<img id="profileImg" class="profileImg" src="<c:url value='/images/${user.userImg}'/>" style="cursor:pointer"/>
						</c:if>
						<div class="boxUser">
							<ul class="fontBox">
								<li>${user.userName}</li>
								<li>0</li>
								<li>POINT</li>
							</ul>
							
							<ul class ="pointBox">
								<li><img src="<c:url value='/image/yellowCircle.png'/>"><span class="point">0</span></li>
								<li><img src="<c:url value='/image/grayCircle.png'/>"><span class="point">0</span></li>
								<li><img src="<c:url value='/image/redCircle.png'/>"><span class="point">0</span></li>
							</ul> <!-- pointBox -->
						</div> <!-- boxUser -->
					</div> <!-- userBox -->
					
					<div class="userInfo">
						<ul class ="userinfoBox">
							<li><h2>${user.userNickname}</h2></li> 
							<li><img src="<c:url value='/image/homeIcon.png'/>"><span class="nameInfo">${user.userCompany}</span></li>
							<li><img src="<c:url value='/image/mailIcon.png'/>"><span class="nameInfo">${user.userEmail}</span></li>
						</ul> <!-- userinfoBox -->
					</div> <!-- userInfo -->
				</div> <!-- userProfileBox -->
				
				<ul class ="tagBox">
					<li><a href="<c:url value='/myPage'/>"><span>tag</span></a></li>
					<li><a href="<c:url value='/myPageQuestion'/>"><span>question</span></a></li>
					<li><a href="<c:url value='/myPageAnswer'/>"><span>answer</span></a></li>
					<li><a href="<c:url value='/myPageComment'/>"><span>comment</span></a></li>
				</ul> <!-- tagBox -->

				<form name="loginForm" method="post">
					<div class="input">
						<input type="text" class="tagAct" placeholder="전체 태그 활동">
						<input type="text" class="tagCht" placeholder="전체 태그 차트">
					</div> <!-- input -->					
				</form>
			</div><!--myPageBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout_test/bottom.jsp"/>
	</body>
</html>