<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Admin Detail Comment</title>
	</head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminDetailNoteView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/myPageEdit.css"/>" >
	<script src="<c:url value= '/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/adminDetailCmt.js'/>"></script>
	<script src="<c:url value="/js/noticePage.js"/>" ></script>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="myPageBox">
				<h1>댓글 게시판 수정(관리자) 🛠</h1>
				<form method="post" id="editFrm" class="editFrm" name="editFrm">
					<div class="inputBox">
						<div class="idInputBox">
							<div class="windowFontBox">
								<span class="warnTitle">아이디(수정불가)</span>
								<div class="inputEvent">
									<input type="text" class="idInput" id="commentId" name="commentId" value="${cmt.commentId}" readonly>
									<i></i>
								</div> <!-- inputEvent -->	
							</div> <!-- "windowFontBox" -->
						</div> <!-- idInputBox -->
						
						<div class="windowFontBox">
							<span class="warnTitle">작성자(수정불가)</span>
							<div class="inputEvent">
								<input type="text" class="nameInput" id="userName" name="userName" value="${cmt.userName}" readonly>
								<i></i>
							</div><!--inputEvent  -->
						</div> <!-- "windowFontBox" -->
						
						<div class="windowFontBox">
							<span>게시판 제목</span>
							<div>
								${cmt.noteTitle}
							</div>
						</div>
						
						<div class="windowFontBox">
							<span>내용</span>
							<div>
								${cmt.comment}
							</div>
						</div>
						
						<div class="noticeOthers">
							<div class="TagAnaTime">
								<div class="noticeTime">
									최종 수정일 : <fmt:formatDate value="${cmt.commentUpdatedDate}" pattern="yyyy-MM-dd"/>
								</div>
							</div>
							<div class="noticeUser">
								<span class="noticeUserImg">
									<img src="<c:url value='/image/user.png'/>">
								</span>
								<span class="noticeUserNickName">
									${cmt.userNickname}
								</span>
							</div>
						</div>
						
						<div class="windowFontBox">
							<span>공개</span>
							<div class="viewStateSelectBox">
								<select class="viewStateSelect" id="pageViewState" name="pageViewState">
									<option value="0" <c:if test="${cmt.pageViewState eq '0'}">selected</c:if>>공개</option>
									<option value="1" <c:if test="${cmt.pageViewState eq '1'}">selected</c:if>>비공개</option>
								</select>
							</div> <!-- selectEvent -->
						</div> <!-- "windowFontBox" -->				
							
						<div class="btnBox">
							<input type="submit" class="editBtn btn-gradient blue" value="수정">
							<input type="reset" class="resetBtn btn-gradient red" value="취소">
							<input type="button" id="prevMenu" class="resetBtn btn-gradient" value="돌아가기">
						</div>	<!-- btnBox -->
					</div> <!-- inputBox -->
				</form>
			</div> <!-- myPageBox -->
		</section>
		
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div> <!-- wrapper -->
	</body>
</html>