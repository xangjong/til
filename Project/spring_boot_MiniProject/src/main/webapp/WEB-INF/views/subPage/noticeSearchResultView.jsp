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

	<c:forEach var="note" items="${noteList}" varStatus="status">
		<div class="notice">
			<div class="noticeTitleBox">
				<div class="noticeTitle">
					<a href="<c:url value='/viewPage/${note.noteId}'/>"><h2>${note.noteTitle }</h2></a>
				</div>
				<div class="viewCount">
					<i class="fa-solid fa-eye"></i>
					<p>${note.noteView }</p>
				</div>
			</div>
			<div class="noticeText">${note.note }</div>
			<div class="noticeOthers">
				<div class="TagAnaTime">
					<div class="noticeTagBox">
						<c:forEach var="hashtag" items="${note.hashname}"
							varStatus="status">
							<button onclick="tagBtn('${hashtag }')" class="Tag">${hashtag }</button>
						</c:forEach>
					</div>
					<div class="noticeTime">
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
				<div class="noticeUser">
					<c:if test="${not empty note.userImg}">
							<span class="noticeUserImg">
								<img src="${note.userImg}">
							</span>
					</c:if>
					<span class="noticeUserNickName"> ${note.userNickname} </span>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="pageNum">
		<button class="btnFilter" onClick="pageBtn(${(page -1 < 0)?0:page-1 })">이전</button>
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
		<button class="btnFilter" onClick="pageBtn(${(page +1 > maxCount)?maxCount:page+1 })">다음</button>
	</div>
</body>

</html>