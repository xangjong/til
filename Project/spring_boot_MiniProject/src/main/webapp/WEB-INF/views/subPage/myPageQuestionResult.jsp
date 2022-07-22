<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="openDate" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="questionBox">
		<div class="question">
			<img src="<c:url value='/image/question.png'/>"> <a><span
				class="nickname">${sessionScope.userNickname}</span><span
				id="explanation">의 ${maxCount1 }개 작성된 글</span></a>
		</div>
		<!-- question -->

		<div class="selectBox" id="filter">
			<select>
				<option value="noteId" selected>날짜</option>
				<option value="noteCommentNum">답변</option>
				<option value="noteLike">좋아요</option>
			</select>
		</div>
		<!-- selectBox -->
	</div>
	<!-- QuestionBox -->
	<c:forEach var="note" items="${noteList}" varStatus="status">
		<div class="QAContentBox">
			<div class="leftBox">
				<div class="answer">
					<a>${note.noteCommentNum }</a> <a>답변</a>
				</div>
				<!-- answer -->

				<div class="like">
					<a>${note.noteLike }</a> <a>좋아요</a>
				</div>
				<!-- like -->

				<div class="views">
					<a>${note.noteView }</a> <a>조회수</a>
				</div>

				<div class=QAcontent>
					<a href="<c:url value='/viewPage/${note.noteId }'/>">${note.noteTitle }</a>
					<div class="hashtag">
						<a><span>Java</span></a>
					</div>
					<c:forEach var="hashtag" items="${note.hashname}"
						varStatus="status">
						<div class="hashtag">
							<a><span>${hashtag }</span></a>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- leftBox -->

			<div class="hour">
				<fmt:formatDate value="${note.noteCreatedDate}" pattern="yyyyMMdd"
					var="closeDate" />
				<c:if test="${openDate == closeDate}">
					<fmt:formatDate pattern="hh:mm" value="${note.noteCreatedDate }" />
				</c:if>
				<c:if test="${openDate != closeDate}">
					<fmt:formatDate pattern="MM-dd" value="${note.noteCreatedDate }" />
				</c:if>
			</div>
		</div>
	</c:forEach>
	<br>
	<div class="pageNum">
		<button class="btnFilter"
			onClick="pageBtn(${(page -1 < 0)?0:page-1 })">이전</button>
		<c:choose>
			<c:when test="${page == 0}">
				<c:forEach var="i" begin="0"
					end="${(page+4>maxCount)?maxCount:page+4 }">
					<c:if test="${page == i}">
						<button class="btnFilter btnFilterActive" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
					<c:if test="${page != i}">
						<button class="btnFilter" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
				</c:forEach>
			</c:when>
			<c:when test="${page  == 1 }">
				<c:forEach var="i" begin="0"
					end="${(page+3>maxCount)?maxCount:page+3 }">
					<c:if test="${page == i}">
						<button class="btnFilter btnFilterActive" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
					<c:if test="${page != i}">
						<button class="btnFilter" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
				</c:forEach>
			</c:when>
			<c:when test="${page == maxCount}">
				<c:forEach var="i" begin="${(page - 4 < 0)?0:page - 4 }"
					end="${maxCount}">
					<c:if test="${page == i}">
						<button class="btnFilter btnFilterActive" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
					<c:if test="${page != i}">
						<button class="btnFilter" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
				</c:forEach>
			</c:when>
			<c:when test="${page + 1 == maxCount }">
				<c:forEach var="i" begin="${(page - 3 < 0)?0:page - 3 }"
					end="${maxCount}">
					<c:if test="${page == i}">
						<button class="btnFilter btnFilterActive" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
					<c:if test="${page != i}">
						<button class="btnFilter" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="${page - 2 }" end="${page + 2 }">
					<c:if test="${page == i}">
						<button class="btnFilter btnFilterActive" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
					<c:if test="${page != i}">
						<button class="btnFilter" onClick="pageBtn(${i})">${i+1 }</button>
					</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<button class="btnFilter"
			onClick="pageBtn(${(page +1 > maxCount)?maxCount:page+1 })">다음</button>
	</div>
</body>

</html>