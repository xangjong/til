<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Admin Detail Note</title>
	</head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminDetailNoteView.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/myPageEdit.css"/>" >
	<script src="<c:url value= '/js/jquery-3.6.0.min.js'/>"></script>
	<script src="<c:url value='/js/adminDetailNote.js'/>"></script>
	<script src="<c:url value="/js/noticePage.js"/>" ></script>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="myPageBox">
				<h1>게시판 수정(관리자) 🛠</h1>
				<form method="post" id="editFrm" class="editFrm" name="editFrm">
					<div class="inputBox">
						<div class="idInputBox">
							<div class="windowFontBox">
								<span class="warnTitle">아이디(수정불가)</span>
								<div class="inputEvent">
									<input type="text" class="idInput" id="noteId" name="noteId" value="${note.noteId}" readonly>
									<i></i>
								</div> <!-- inputEvent -->	
							</div> <!-- "windowFontBox" -->
						</div> <!-- idInputBox -->
						
						<div class="windowFontBox">
							<span class="warnTitle">작성자(수정불가)</span>
							<div class="inputEvent">
								<input type="text" class="nameInput" id="userName" name="userName" value="${note.userName}" readonly>
								<i></i>
							</div><!--inputEvent  -->
						</div> <!-- "windowFontBox" -->
						
						<div class="windowFontBox">
							<span>카테고리</span>
							<div class="categorySelectBox">
								<select class="categorySelect" id="categoryId" name="categoryId">
									<option value="0" <c:if test="${note.categoryId eq '0'}">selected</c:if>>공지</option>
									<option value="1" <c:if test="${note.categoryId eq '1'}">selected</c:if>>질문</option>
									<option value="2" <c:if test="${note.categoryId eq '2'}">selected</c:if>>자유</option>
								</select>
							</div> <!-- selectEvent -->
						</div> <!-- "windowFontBox" -->
						
						<div class="windowFontBox">
							<span>제목</span>
							<div>
								${note.noteTitle}
							</div>
						</div>
						
						<div class="windowFontBox">
							<span>내용</span>
							<div>
								${note.note}
							</div>
						</div>
						
						<div class="noticeOthers">
							<div class="TagAnaTime">
								<div class="noticeTime">
									최종 수정일 : <fmt:formatDate value="${note.noteUpdatedDate}" pattern="yyyy-MM-dd"/>
								</div>
							</div>
							<div class="noticeUser">
								<span class="noticeUserImg">
									<img src="<c:url value='/image/user.png'/>">
								</span>
								<span class="noticeUserNickName">
									${note.userNickname}
								</span>
							</div>
						</div>
						<div class="windowFontBox">						
							<div class="noticeTagBox">
								<c:forEach var="i" begin="1" end="10">
									<c:set var="b" value="hashName${i}" />
									<c:if test="${not empty note[b]}">
										<div class="Tag">
											<div class="Tag">${note[b]}</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						
						<div class="windowFontBox">
							<span>공개</span>
							<div class="viewStateSelectBox">
								<select class="viewStateSelect" id="pageViewState" name="pageViewState">
									<option value="0" <c:if test="${note.pageViewState eq '0'}">selected</c:if>>공개</option>
									<option value="1" <c:if test="${note.pageViewState eq '1'}">selected</c:if>>비공개</option>
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