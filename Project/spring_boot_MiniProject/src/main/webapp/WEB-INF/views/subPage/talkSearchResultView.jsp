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
	<c:set var="count" value="0" />
	<div class="row">
		<c:forEach var="note" items="${noteList}" varStatus="status">
			<div class="col-3">
				<div class="card">
					<a href="<c:url value="/viewPage/${note.noteId }"/>"> <img src="${note.preView }" alt=""
						class="card-img-top"></a>
					<div class="card-body">
						<a href="<c:url value="/viewPage/${note.noteId }"/>" style="color: black;">
							<h6 class="card-title">${note.noteTitle }</h6>
						</a> <a href="#" style="color: black;"><p class="card-text">${note.userNickname }</p></a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	<div class="container-fluid row" >
		<div class="pageNum col-8"  style="float: none; margin:0 auto;">
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
	</div>
</body>

</html>