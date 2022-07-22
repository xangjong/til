<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/searchForm.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/idpwSearch.css'/>">
	</head>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		
			<section>
			<div class="loginBox">
				<h1>임시 비밀번호 발급</h1> 
				<h2><a href="#"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<h4>
					계정이 이미 있는 경우에는 <a href="<c:url value='loginForm'/>"><span class="colorFont">로그인</span></a>해주세요.<br><br>
					<span class="colorFont">인증된 이메일</span>만 정보 찾기가 가능합니다.
				</h4>
				
				<form method="post" id="pwSchFrm" class="pwSchFrm" name="pwSchFrm">
					<div class="inputBox">
						<div class="windowFontBox">
							<span>아이디</span>
							<div class="inputEvent">
								<input type="text" id="userId" class="idInput" required autofocus/>
								<i></i>
							</div> <!-- inputEvent -->	
						</div> <!-- "windowFontBox" -->
				
					
						<div class="emailBox">
							<div class ="windowFontBox"> 	
								<span>이메일</span>
								<div class="inputEvent">
									<input type="text" id="userEmail1" class="userEmail" required/>
									<i></i>
								</div> <!-- inputEvent -->
								&nbsp;&nbsp;
							</div> <!-- windowFontBox -->
							
							<div class="emailSelectBox">
								<select id="userEmail2" class="emailSelect">
									<option value="naver.com" selected>@naver.com</option>
									<option value="daum.net">@daum.net</option>
									<option value="nate.com">@nate.com</option>
									<option value="kakao.com">@kakao.com</option>
									<option value="gmail.com">@gmail.com</option>
								</select>
							</div> <!-- emailSelectBox -->
						</div>	<!-- emailBox  -->
	
						<input type="submit" class="joinBtn btn-gradient blue" value="확인">
					</div> <!-- inputBox -->
				</form>
			</div><!--loginBox  -->
				
		</section>
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div>
	</body>
</html>