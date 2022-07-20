<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/> "></script>
		<script src="<c:url value='/js/test/MenuTab.js'/> "></script>
		<script src="<c:url value='/js/test/join.js'/> "></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/joinSection.css'/> ">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout_test/top.jsp"/>
		<section>
			<div class="loginBox">
				<h1>회원가입</h1>
				<h2><a href="#"><img src="<c:url value='/image/logo-withus3.PNG'/> "></a></h2>
				<h4>
					계정이 이미 있는 경우에는 <a href="<c:url value='/test/loginForm'/> "><span class="colorFont">로그인</span></a>해주세요.<br><br>
					가입을 하면 <span class="colorFont">WITH:US의 개발자 사이트의 이용약관</span>,<br><br>
					<span class="colorFont">개인정보취급방침</span>에 동의하게 됩니다.<br><br>
					가입 후 아이디는 변경할 수 없습니다.
				</h4>
				
				<form method="post" class="joinFrm" id="joinFrm">
					<div class="inputBox">
						<div class="windowFontBox">
							<span>이름</span>
							<div class="inputEvent">
								<input type="text" class="nameInput" id="userName" required>
								<i></i>
							</div><!--inputEvent  -->
						</div> <!-- "windowFontBox" -->	
					
						<div class="nickNameInputBox">
							<div class="windowFontBox">
								<span id="titleNickname" class="chkInput">닉네임</span>
								<div class="inputEvent">
									<input type="text" id="userNickname" class="chkText nicknameInput" required>
									<i></i>
								</div> <!-- inputEvent -->
							</div> <!-- "windowFontBox" -->
							<div class= nickNameBtnBox>
								<input type="button" id="chkNickname" class="nickNameBtn btn-gradient blue" value="중복 확인">
							</div>
						</div>
					
						<div class="idInputBox">
							<div class="windowFontBox">
								<span id="titleId" class="chkInput">아이디</span>
								<div class="inputEvent">
									<input type="text" id="userId" class="chkText idInput" required>
									<i></i>
								</div> <!-- inputEvent -->
							</div> <!-- "windowFontBox" -->
							<div class= idBtnBox>
								<input type="button" id="chkId" class="idBtn btn-gradient blue" value="중복 확인">
							</div>							
						</div>
					
						<div class ="windowFontBox"> 
							<span>비밀번호</span>
							<div class="inputEvent">
								<input type="password" id="userPw" class="pwInput" required>
								<i></i>
							</div> <!-- inputEvent  -->	
							<a class="pwMent">8자~20자 이내, 영문,숫자,특수문자를 혼합하여 입력해주세요.</a> <!-- pwMent -->
						</div> <!-- windowFontBox -->
						
						<div class ="windowFontBox"> 
							<span>비밀번호 확인</span>
							<div class="inputEvent">
								<input type="password" class="pwCfmInput" required>
								<i></i>
							</div>	<!-- inputEvent -->
						</div> <!-- windowFontBox -->

						<div class="emailBox">
						<div class ="windowFontBox"> 	
							<span id="titleEmail" class="chkInput">이메일</span>
							<div class="inputEvent">
								<input type="text" id="userEmail1" class="chkText emailInput" required>
								<i></i>
							</div> <!-- inputEvent -->
						</div> <!-- windowFontBox -->
						
						<div class="emailSelectBox">
							<select class="emailSelect" id="userEmail2">
								<option value="naver.com" selected>@naver.com</option>
								<option value="daum.net">@daum.net</option>
								<option value="nate.com">@nate.com</option>
								<option value="kakao.com">@kakao.com</option>
								<option value="gmail.com">@gmail.com</option>
							</select>
							<input type="button" id="chkEmail" class="chkInput emailBtn btn-gradient blue" value="중복 확인">
							</div> <!-- emailSelectBox -->
						</div>	<!-- emailBox  -->
							
						<input type="submit" class="joinBtn btn-gradient blue" value="가입하기">
					</div> <!-- inputBox -->
				</form>
				
			</div><!--loginBox  -->
		</section>
		<c:import url="/WEB-INF/views/layout_test/bottom.jsp"/>
	</body>
</html>