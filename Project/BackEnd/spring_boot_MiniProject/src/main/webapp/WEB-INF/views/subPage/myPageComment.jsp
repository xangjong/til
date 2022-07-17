<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>myPage:Comment</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPageComment.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="myPageBox">
					<h1>My page</h1>
					<ul class="userPage">
						<li><a href="#"><span>activity</span></a></li>
						<li><a href="<c:url value='/myPageEdit'/>"><span>edit</span></a></li> 
					</ul> <!-- userPage -->
				<div class="userProfileBox">
					<div class="userBox">
						<div class="boxImage"><img src="<c:url value = '/image/user.png'/>"></div>
						<div class="boxUser">
	
							<ul class="fontBox">
								<li>hong</li>
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
							<li><h2>닉네임</h2></li> 
							<li><img src="<c:url value='/image/homeIcon.png'/>"><span class="nameInfo">소속</span></li>
							<li><img src="<c:url value='/image/mailIcon.png'/>"><span class="nameInfo">이메일 주소</span></li>
						</ul> <!-- userinfoBox -->
					</div> <!-- userInfo -->
				</div> <!-- userProfileBox -->
				<ul class ="tagBox">
					<li><a href="<c:url value='/myPage'/>"><span>tag</span></a></li>
					<li><a href="<c:url value='/myPageQuestion'/>"><span>question</span></a></li>
					<li><a href="<c:url value='/myPageAnswer'/>"><span>answer</span></a></li>
					<li><a href="<c:url value='/myPageComment'/>"><span>comment</span></a></li>
				</ul> <!-- tagBox -->
				
					<div class="questionBox">
						<div class="question">
							<img src="<c:url value='/image/comment.png'/>">
							<a><span class="nickname">닉네임</span>의 0개의 댓글이 있습니다.</a>			
						</div> <!-- question -->
						
						<div class="selectBox">
							<select>
								<option selected>날짜</option>
								<option>답변</option>
								<option>좋아요</option>
							</select>
						</div> <!-- selectBox -->
					</div> <!-- QuestionBox -->
					
			</div><!--myPageBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>