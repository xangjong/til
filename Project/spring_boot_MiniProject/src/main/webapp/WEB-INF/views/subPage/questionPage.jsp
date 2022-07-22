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
<title>QuestionPage</title>
<link rel="stylesheet" type="text/css" href="css/questionPage.css">
<script src="js/jquery-3.6.0.min.js"></script>
<script src="<c:url value='/js/questionPage.js'/> "></script>
<script src="<c:url value='/js/questionPaging.js'/> "></script>

</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section>
		<div class="bodyWrap">
			<div class="questionBoxWrap">
				<div class="searchBox">
					<form class="d-flex">
						<input id="titleSearch" class="form-control" type="search"
							placeholder="검색어를 입력하세요" aria-label="Search">
						<button class="btnSearch" onclick="titleSearchBtn()">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<div class="slideShow">
					<div class="prevNextButtonBox">
						<img class="prevButton prevNextButton" src="image/prevButton.png">
						<img class="nextButton prevNextButton" src="image/nextButton.png">
					</div>
					<div class="slideShowBox">
						<div class="slidePanel">
							<img src="image/slideImage1.jpeg" class="slideImage"> <img
								src="image/slideImage2.png" class="slideImage"> <img
								src="image/slideImage3.jpeg" class="slideImage"> <img
								src="image/slideImage4.jpeg" class="slideImage"> <img
								src="image/slideImage5.jpeg" class="slideImage">
						</div>
					</div>
					<div class="controlPanel">
						<img src="image/controlButton1.png" class="controlButton"> <img
							src="image/controlButton1.png" class="controlButton"> <img
							src="image/controlButton1.png" class="controlButton"> <img
							src="image/controlButton1.png" class="controlButton"> <img
							src="image/controlButton1.png" class="controlButton">
					</div>
				</div>
				<div class="questionBox">
					<div class="arrayTitle">
						<button id="btn-noteId" class="btnFilter btnFilterActive">최신순</button>
						<button id="btn-noteLike" class="btnFilter">추천순</button>
						<button id="btn-noteCommentNum" class="btnFilter">댓글순</button>
						<button id="btn-noteView" class="btnFilter">조회순</button>
					</div>
				</div>

				<div class="questionBox" id="searchResultBox">
				</div>
			</div>
			<div class="sideBox">
				<div class="createQuestion">
					<c:if test="${empty sessionScope.sid }">
						<a href="<c:url value='/writePage'/>"><button
								class="btn-gradient blue" disabled>새 질문 작성하기</button></a>
					</c:if>
					<c:if test="${not empty sessionScope.sid }">
						<a href="<c:url value='/writePage'/>"><button
								class="btn-gradient blue">새 질문 작성하기</button></a>
					</c:if>

				</div>
				<div class="questionTag">
					<div class="questionTagTitle">
						<span>태그</span><span><i class="fa-solid fa-tags"></i></span>
					</div>
					<div class="sideTagBox" id="sideTagBox"></div>
				</div>
				<div class="hotQuestion">
					<table>
						<tr>
							<th>핫 게시물 <i class="fa-brands fa-hotjar"></i></th>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>30</span>&nbsp;&nbsp;<a
								href="#">Java와 JavaScript의 차이점이 뭔가요?....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>26</span>&nbsp;&nbsp;<a
								href="#">SQL 기본 문법에는 뭐가 있을까요?....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>24</span>&nbsp;&nbsp;<a
								href="#">Docker 명령어에는 어떤 것이 있나요?....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>22</span>&nbsp;&nbsp;<a
								href="#">C에서 입력값의 끝을 판별할 수 있는...</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>21</span>&nbsp;&nbsp;<a
								href="#">PWA 를 apk,ipa로 빌드하고싶습니다....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>18</span>&nbsp;&nbsp;<a
								href="#">C언어 동적할당변수 sizeof값이 이상...</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>15</span>&nbsp;&nbsp;<a
								href="#">트리 순회 질문.....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>14</span>&nbsp;&nbsp;<a
								href="#">라우터 관련 네트워킹 동작 과정이 궁....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>11</span>&nbsp;&nbsp;<a
								href="#">QueryDSL select 에서 에러가 납니다.....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>8</span>&nbsp;&nbsp;<a
								href="#">파이썬 pip 오류 ssl 오류....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>6</span>&nbsp;&nbsp;<a
								href="#">초보개발자) 아이패드 네이티브 vs 웹....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>5</span>&nbsp;&nbsp;<a
								href="#">카이스트 핀토스 환경설정 질문....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>3</span>&nbsp;&nbsp;<a
								href="#">csharp 질문드립니다 한프로젝트에 2개....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>2</span>&nbsp;&nbsp;<a
								href="#">리액트 콘솔과 실제화면이 다르게 나....</a></td>
						</tr>
						<tr>
							<td><i class="fa-regular fa-thumbs-up"></i><span>1</span>&nbsp;&nbsp;<a
								href="#">깃허브 블로그 disqus 댓글기능 관련....</a></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>