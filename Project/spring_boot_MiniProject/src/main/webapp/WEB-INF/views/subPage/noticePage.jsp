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
<title>NoticePage</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/noticePage.css'/>" >
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>" ></script>
<script src="<c:url value='/js/noticePage.js'/>" ></script>
<script src="<c:url value='/js/noticePaging.js'/> "></script>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section>
		<div class="bodyWrap">
			<div class="createNotice">
				<div class="createQuestion">
					<c:if test="${sessionScope.roll == 1 }">
						<button style="width:800px" onclick="location.href='<c:url value='/writePage'/>'" class="btn-gradient blue">새 공지 작성하기</button>
					</c:if>
					<c:if test="${sessionScope.roll != 1 }">
						<button style="width:800px; background-color:gray;" onclick="location.href='<c:url value='/writePage'/>'" class="btn-gradient blue" disabled>새 공지 작성하기</button>
					</c:if>
				</div>
			</div>
			<div class="noticeBox">
				<div class="arrayTitle">
					<button id="btn-noteId" class="btnFilter btnFilterActive">최신순</button>
					<button id="btn-noteLike" class="btnFilter">추천순</button>
					<button id="btn-noteCommentNum" class="btnFilter">댓글순</button>
					<button id="btn-noteView" class="btnFilter">조회순</button>
				</div>
			</div>
			<div class="noticeBox" id="searchResultBox">
				
			</div>

		</div>
	</section>
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>