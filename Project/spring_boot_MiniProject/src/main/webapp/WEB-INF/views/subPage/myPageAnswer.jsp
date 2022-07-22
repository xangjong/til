<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myPage:Answer</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPageAnswer.css'/>">
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
							<li><h2>${user.userNickname}</h2></li> 
							<li><img src="<c:url value='/image/homeIcon.png'/>"><span class="nameInfo">${user.userCompany}</span></li>
							<li><img src="<c:url value='/image/mailIcon.png'/>"><span class="nameInfo">${user.userEmail}</span></li>
						</ul> <!-- userinfoBox -->
					</div> <!-- userInfo -->
				</div> <!-- userProfileBox -->
				
				<ul class ="tagBox">
					<li><a href="<c:url value='/myPage/${sessionScope.sid}'/>"><span>tag</span></a></li>
					<li><a href="<c:url value='/myPageQuestion/${sessionScope.sid}'/>"><span>question</span></a></li>
					<li><a href="<c:url value='/myPageAnswer/${sessionScope.sid}'/>"><span>answer</span></a></li>
					<li><a href="<c:url value='/myPageComment/${sessionScope.sid}'/>"><span>comment</span></a></li>
				</ul> <!-- tagBox -->
				
					<div class="questionBox">
						<div class="question">
							<img src="<c:url value='/image/answer.png'/>">
							<a><span class="nickname">닉네임</span>의 0개의 답변이 있습니다.</a>			
						</div> <!-- question -->
						
						<div class="selectBox">
							<select>
								<option selected>날짜</option>
								<option>답변</option>
								<option>좋아요</option>
							</select>
						</div> <!-- selectBox -->
					</div> <!-- QuestionBox -->
					
					<div class="QAContentBox">
						<div class="leftBox">
							<div class="answer">
								<a>0</a>
								<a>답변</a>
							</div> <!-- answer -->
							
							<div class="like">
								<a>0</a>
								<a>좋아요</a>
							</div> <!-- like -->
							
							<div class="views">
								<a>0</a>
								<a>조회수</a>
							</div>
							
							<div class=QAcontent>
								<a>백엔드 개발자 프로그래밍 언어</a>
								<div class="hashtag">
									<a><span>Java</span></a>
									<a><span>Python</span></a>
									<a><span>SQL</span></a>
								</div>
							</div>
						</div> <!-- leftBox -->
						
						<div class="hour">
							<a>3시간전</a>
						</div>
					</div> <!-- QAContentBox -->
			</div><!--myPageBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>