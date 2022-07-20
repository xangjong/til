<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>새 비밀번호 생성</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/newPW.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/idpwSearch.css'/>">
	</head>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
			<section>
				<div class="loginBox">
				<h1>새 비밀번호</h1> 
				<h2><a href="#"><img src="<c:url value='/image/logo-withus3.PNG'/>"></a></h2>
				<h4>
					계정이 이미 있는 경우에는 <a href="<c:url value='loginForm'/>"><span class="colorFont">로그인</span></a>해주세요.<br><br>
					<span class="colorFont">인증된 이메일</span>만 정보 찾기가 가능합니다.
				</h4>
				
				<form method="post" class="joinFrm" name="joinFrm">
					<div class="inputBox">
						<div class ="windowFontBox"> 
							<span>새 비밀번호</span>
							<div class="inputEvent">
								<input type="password" class="pwInput">
								<i></i>
							</div> <!-- inputEvent  -->	
							<a class="pwMent">8자~20자 이내, 영문,숫자,특수문자를 혼합하여 입력해주세요.</a> <!-- pwMent -->
						</div> <!-- windowFontBox -->
						
						<div class ="windowFontBox"> 
							<span>비밀번호 확인</span>
							<div class="inputEvent">
								<input type="password" class="pwCfmInput">
								<i></i>
							</div>	<!-- inputEvent -->
						</div> <!-- windowFontBox -->
							
						<input type="submit" class="joinBtn btn-gradient blue" value="확인">
					</div> <!-- inputBox -->
				</form>
			</div><!--loginBox  -->
			</section>
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div>
	</body>
</html>