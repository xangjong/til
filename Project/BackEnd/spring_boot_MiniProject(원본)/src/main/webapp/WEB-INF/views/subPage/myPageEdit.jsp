<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>myPage:Edit</title>
	</head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/MyPageEdit.css'/>">
	<script src="<c:url value= '/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/join.js'/>"></script>
	<script src="<c:url value='/js/myPageEdit.js'/>"></script>
	
	
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="myPageBox">
					<h1>마이 페이지</h1>
				<div class="userProfileBox">
					<div class="userBox">
						<div class="boxImage"><img src="<c:url value = '/image/user.png'/>"></div>
						<div class="box-file-input">
							<label><input type="file" name="ev_display" class="file-input" accept="image/*">
							</label></div>
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
				</div> <!-- userProfileBox -->
				
				<form method="post" class="EditFrm" name="EditFrm">
					<div class="inputBox">
						<div class="windowFontBox">
							<span>이름</span>
							<div class="inputEvent">
								<input type="text" class="nameInput" readonly placeholder="이름 변경 불가">
								<i></i>
							</div><!--inputEvent  -->
						</div> <!-- "windowFontBox" -->	
					
					<div class="nickNameInputBox">
						<div class="windowFontBox">
							<span>닉네임</span>
							<div class="inputEvent">
								<input type="text" class="nicknameInput">
								<i></i>
							</div> <!-- inputEvent -->
						</div> <!-- "windowFontBox" -->
						<div class= nickNameBtnBox>
								<input type="button" class="nickNameBtn btn-gradient cyan" value="확인">
						</div>
					</div> <!-- nickNameInputBox -->	
						
					<div class="idInputBox">
						<div class="windowFontBox">
							<span>아이디</span>
							<div class="inputEvent">
								<input type="text" class="idInput" readonly placeholder="아이디 변경 불가">
								<i></i>
							</div> <!-- inputEvent -->	
						</div> <!-- "windowFontBox" -->
					</div> <!-- idInputBox -->
					
						<div class="emailBox">
							<div class ="windowFontBox"> 	
								<span>이메일</span>
								<div class="inputEvent">
									<input type="text" class="emailInput">
									<i></i>
								</div> <!-- inputEvent -->
								&nbsp;&nbsp;
							</div> <!-- windowFontBox -->
							
							<div class="emailSelectBox">
								<select class="emailSelect">
									<option value="naver" selected>@naver.com</option>
									<option value="daum">@daum.net</option>
									<option value="nate">@nate.com</option>
									<option value="kakao">@kakao.com</option>
									<option value="gmail">@gmail.com</option>
								</select>
								&nbsp;&nbsp;
								<input type="button" class="emailBtn btn-gradient cyan" value="확인">
								
							</div> <!-- emailSelectBox -->
						</div>	<!-- emailBox  -->
					
						<div class ="windowFontBox"> 
							<span>비밀번호</span>
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
						
						<div class="btnBox">
							<input type="submit" class="editBtn btn-gradient cyan" value="수정">
							<input type="reset" class="resetBtn btn-gradient red" value="취소">
							<input type="button" class="resetBtn btn-gradient" value="회원탈퇴">
						</div>	<!-- btnBox -->
					</div> <!-- inputBox -->
				</form>
			</div> <!-- myPageBox -->
		</section>
		
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div> <!-- wrapper -->
	</body>
</html>