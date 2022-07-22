<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myPage:Question</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPageQuestion.css'/>">
		<script src="<c:url value= '/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value= '/js/myPageQuestionPaging.js'/>"></script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="myPageBox">
					<h1>My page</h1>
					<ul class="userPage">
						<li><a href="<c:url value='/myPage/${sessionScope.sid}'/>"><span>activity</span></a></li>
						<li><a href="<c:url value='/myPageEdit/${sessionScope.sid}'/>"><span>edit</span></a></li> 
					</ul> <!-- userPage -->
				<div class="userProfileBox">
					<div class="userBox">
						<!-- 프로필 사진 추가하지 않을 경우 기본 이미지 출력 -->
						<c:if test="${empty user.userImg}">
							<div class="boxImage">
								<img style="width:100px;height:100px" src="<c:url value = '/image/user1.png'/>">
							</div>
						</c:if>
						<c:if test="${not empty user.userImg}">
							<div class="boxImage">
								<img style="width:100px;height:100px" src="<c:url value = '/images/${user.userImg}'/>">
							</div>
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
							<li><h2>${sessionScope.userNickname}</h2></li> 
							<li><img src="<c:url value='/image/homeIcon.png'/>"><span class="nameInfo">${user.userCompany}</span></li>
							<li><img src="<c:url value='/image/mailIcon.png'/>"><span class="nameInfo">${user.userEmail}</span></li>
						</ul> <!-- userinfoBox -->
					</div> <!-- userInfo -->
				</div> <!-- userProfileBox -->
				
				<ul class ="tagBox">
					<li><a onclick="location.href='<c:url value='/myPage/${sessionScope.sid}'/>'"><span>Info</span></a></li>
					<li><a id="category1" onclick="categoryBtn(1)"><span>question</span></a></li>
					<li><a id="category2" onclick="categoryBtn(2)"><span>talk</span></a></li>
				</ul> <!-- tagBox -->
				
					
					<div id="searchResultBox">
					
					</div>
					
			</div><!--myPageBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>