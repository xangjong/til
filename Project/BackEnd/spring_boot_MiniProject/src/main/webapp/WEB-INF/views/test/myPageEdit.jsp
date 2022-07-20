<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>myPage:Edit</title>
	</head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/myPageEdit.css'/>">
	<script src="<c:url value= '/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/test/myPageEdit.js'/>"></script>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout_test/top.jsp"/>
		<section>
			<div class="myPageBox">
				<h1>회원 정보 수정 🛠</h1>
				<form method="post" id="editFrm" class="editFrm" name="editFrm">
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
							<input type="hidden" id="sessionFile" name="sessionFile" value="${sessionScope.userImg}"/>
							<input type="file" id="uploadFile" name="uploadFile" style="display:none"/>
						</div>
					</div> <!-- userProfileBox -->
				
					<div class="inputBox">
						<div class="windowFontBox">
							<span>이름</span>
							<div class="inputEvent">
								<input type="text" class="nameInput" id="userName" name="userName" value="${user.userName}">
								<c:set var="email1" value="${fn:substringBefore(user.userEmail, '@')}"/>
								<c:set var="email2" value="${fn:substringAfter(user.userEmail, '@')}"/>
								<i></i>
							</div><!--inputEvent  -->
						</div> <!-- "windowFontBox" -->	
					
						<div class="nickNameInputBox">
							<div class="windowFontBox">
								<span id="titleNickname" class="chkInput">닉네임</span>
								<div class="inputEvent">
									<input type="text" class="chkText nicknameInput" id="userNickname" name="userNickname" value="${user.userNickname}">
									<i></i>
								</div> <!-- inputEvent -->
							</div> <!-- "windowFontBox" -->
							<div class= nickNameBtnBox>
								<input type="button" id="chkNickname" class="nickNameBtn btn-gradient blue" value="중복 확인">
							</div>
						</div> <!-- nickNameInputBox -->
	
						<div class="emailBox">
							<div class="windowFontBox">
								<span id="titleEmail" class="chkInput">이메일</span>
								<div class="inputEvent">
									<input type="text" class="chkText emailInput" id="userEmail1" name="userEmail1" value="${email1}">
									<i></i>
								</div>
								<!-- inputEvent -->
								&nbsp;&nbsp;
							</div>
							<!-- windowFontBox -->
	
							<div class="emailSelectBox">
								<select class="emailSelect" id="userEmail2" name="userEmail2">
									<option value="naver.com" <c:if test="${email2 eq 'naver.com'}">selected</c:if>>@naver.com</option>
									<option value="daum.net" <c:if test="${email2 eq 'daum.net'}">selected</c:if>>@daum.net</option>
									<option value="nate.com" <c:if test="${email2 eq 'nate.com'}">selected</c:if>>@nate.com</option>
									<option value="kakao.com" <c:if test="${email2 eq 'kakao.com'}">selected</c:if>>@kakao.com</option>
									<option value="gmail.com" <c:if test="${email2 eq 'gmail.com'}">selected</c:if>>@gmail.com</option>
								</select> &nbsp;&nbsp; 
								<input type="button" id="chkEmail" class="emailBtn btn-gradient blue" value="중복 확인">
							</div><!-- emailSelectBox -->
						</div><!-- emailBox  -->
						
						<div class="companyInputBox">
							<div class="windowFontBox">
								<span>소속</span>
								<div class="inputEvent">
									<input type="text" class="userCompany" id="userCompany" name="userCompany" value="${user.userCompany}">
									<i></i>
								</div> <!-- inputEvent -->
							</div> <!-- "windowFontBox" -->
						</div> <!-- companyInputBox -->
						
						<div class="idInputBox">
							<div class="windowFontBox">
								<span class="titleId">아이디(수정불가)</span>
								<div class="inputEvent">
									<input type="text" class="idInput" id="userId" name="userId" value="${user.userId}" readonly placeholder="아이디 변경 불가">
									<i></i>
								</div> <!-- inputEvent -->	
							</div> <!-- "windowFontBox" -->
						</div> <!-- idInputBox -->
						
						<div class ="windowFontBox"> 
							<span>신규 비밀번호</span>
							<div class="inputEvent">
								<input type="password" id="userPw" class="pwInput" name="userPw">
								<i></i>
							</div> <!-- inputEvent  -->	
							<a class="pwMent">8자~20자 이내, 영문,숫자,특수문자를 혼합하여 입력해주세요.</a> <!-- pwMent -->
						</div> <!-- windowFontBox -->
							
						<div class ="windowFontBox"> 
							<span>신규 비밀번호 확인</span>
							<div class="inputEvent">
								<input type="password" class="pwCfmInput">
								<i></i>
							</div>	<!-- inputEvent -->
						</div> <!-- windowFontBox -->
							
						<div class="btnBox">
							<input type="submit" class="editBtn btn-gradient blue" value="수정">
							<input type="reset" class="resetBtn btn-gradient red" value="취소">
							<input type="button" id="quitUser" class="resetBtn btn-gradient" value="회원탈퇴">
						</div>	<!-- btnBox -->
					</div> <!-- inputBox -->
				</form>
			</div> <!-- myPageBox -->
		</section>
		
			<c:import url="/WEB-INF/views/layout_test/bottom.jsp"/>
		</div> <!-- wrapper -->
	</body>
</html>