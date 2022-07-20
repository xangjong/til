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
				
					<div class="tagActBox">
						<h2>전체 태그 활동</h2>
						<div class="tagAct">
							<div class="interest">
								<a>#1등</a>
								<a><span>Java</span></a>
							</div> <!-- interest -->
							
							<div class="question">
								<a>Question</a>
								<a>1</a>
							</div> <!-- question -->
							
							<div class="answer">
								<a>Answer</a>
								<a>1</a>
							</div> <!-- answer -->
							
							<div class="comment">
								<a>Comment</a>
								<a>0</a> 
							</div> <!-- comment -->
						</div> <!-- tagAct -->
						
					</div> <!-- tagActBox -->
					<div class="tagChtBox">
					<h2>전체 태그 차트</h2>
						 <div class="graph-wrapper">
						    <div class="percent-indicator">
						      <div class="per-0"></div>
						      <div class="per-20"></div>
						      <div class="per-40"></div>
						      <div class="per-60"></div>
						      <div class="per-80"></div>
						      <div class="per-100"></div>
						    </div> <!-- percent-indicator -->
						    
						    <ul class="graph">
						      <li class="item1 p-100"></li>
						      <li class="item2 p-75"></li>
						      <li class="item3 p-60"></li>
						      <li class="item4 p-35"></li>
						      <li class="item5 p-15"></li>
						    </ul> <!-- graph -->
						  </div> <!-- graph-wrapper -->
					</div> <!-- tagChtBox -->
			</div><!--myPageBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>