<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<c:url value='/js/jquery-3.6.0.min.js'/> "></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>

<script src="<c:url value="/js/noteLike.js"/>"></script>
<script src="<c:url value="/js/writeComment.js"/>"></script>
<script src="<c:url value="/js/updateComment.js"/>"></script>


<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/hashtag2.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewPage.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/buttonD.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/buttonE.css'/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/viewPage2.css'/>">
<title>게시글</title>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section>
		<div class="bodyWrap">
			<div class="questionBoxWrap">
				<div class="container-fluid" style="margin: 0; padding: 0;">
					<div class="row">
						<div class="col-lg-2 d-none d-xl-block d-lg-block"></div>
						<div class="col-lg-8 col-12">
							<br>
							<nav class="listSize" style="padding: 0; margin: auto">
								<div class="container" style="padding: 10px;">
									<div class="viewBtnBox row">
										<div class="viewBtn col-auto">
											<c:if test="${sessionScope.sid == note.userId }">
												<button id="btn" class="btn-gradient red"
													onclick="location.href='/deleteNote/${note.noteId }'">삭제</button>
												<button id="btn" class="btn-gradient blue"
													onclick="location.href='/updateNote/${note.noteId }'">수정</button>
											</c:if>
										</div>
									</div>
								</div>
							</nav>
							<br>
							<ul class="listSize listMainWrap">
								<li>
									<div class="container">
										<div class="row viewSubWrap">
											<div class="col-8">
												<table style="float: left;">
													<tr>
														<td rowspan="2"><img class="viewProfle"
															src="/images/${note.userImg }"></td>
														<td><a class="nickNameB" href="#">${note.userNickname }</a></td>
													</tr>
													<tr>
														<td class="createdDateB"><fmt:formatDate
																pattern="MM-dd hh:mm:ss"
																value="${note.noteCreatedDate }" /></td>
													</tr>
												</table>
											</div>
											<div class="col-4 align-self-center"
												style="text-align: right">
												<div class="row">
													<div class="col-6"></div>
													<div class="col-3">
														<i class="fa-solid fa-xs fa-comment">${note.noteCommentNum }</i>
													</div>
													<div class="col-3">
														<i class="fa-solid fa-xs fa-eye">${note.noteView }</i>
													</div>

												</div>
											</div>
										</div>
										<div class="row viewSubWrap"
											style="border-bottom: none; background-color: rgb(180, 180, 180);">
											<div class="col-lg-12 col-12" style="padding: 5px;">
												<input type="hidden" id="noteId" value="${note.noteId }">
												<span class="text-left"
													style="font-size: 1.1em; font-weight: bold; color: white;">#${note.noteId
													}</span>
													<c:if test="${note.categoryId==0 }">
														<a href="/questionPage" class="category1">공지게시판</a>
													</c:if> 
													<c:if test="${note.categoryId==1 }">
														<a href="/questionPage" class="category1">질문게시판</a>
													</c:if>
													<c:if test="${note.categoryId==2 }">
														<a href="/talkPage" class="category1">자유게시판</a>
													</c:if>  
												<c:forEach var="tag" items="${note.hashname}"
													varStatus="status">
													<a class="tag1" href="#">${tag}</a>
												</c:forEach>
												<p style="line-height: 0.5em;"></p>
												<p
													style="font-size: 1.5em; color: white; font-weight: bold;">${note.noteTitle }</p>
											</div>
										</div>
										<div class="row viewSubWrap">
											<article class="content-text" itemprop="articleBody">
												${note.note }</article>
											<div
												style="height: 120px; display: flex; align-items: center; justify-content: center;">
												<button id="noteLike" data-chk="FALSE" class="btnE btnLike">
													<p>추천</p>
													<p id="noteLikeVal" style="line-height: 5px;">${note.noteLike }</p>
												</button>
											</div>
										</div>
									</div>
								</li>
							</ul>

							<br>
							<ul class="listSize listMainWrap">
								<li>
									<div class="container">
										<div class="row viewSubWrap align-self-center"
											style="padding: 5px;; background-color: rgb(180, 180, 180); color: white; font-weight: bold;">&nbsp댓글</div>
										<c:forEach var="comment" items="${commentList}"
											varStatus="status">
											<div class="row viewSubWrap"
												id="commentBox${comment.commentId }">

												<input type="hidden" id="commentId${comment.commentId }"
													value="${comment.commentId }"> <input type="hidden"
													id="userNickname${comment.commentId }"
													value="${comment.userNickname }"> <input
													type="hidden" id="userImg${comment.commentId }"
													value="/images/${comment.userImg }"> <input type="hidden"
													id="date${comment.commentId }"
													value="${comment.commentCreatedDate }">

												<div class="row">
													<table style="float: left;">
														<tr>
															<td rowspan="2" width="40px"><img class="viewProfle"
																src="/images/${comment.userImg }"></td>
															<td><a class="nickNameB" href="#">${comment.userNickname }</a><span><i
																	class="fa-solid fa-2xs fa-bolt"></i> <c:if
																		test="${sessionScope.sid == comment.userId }">
																		<input type="button"
																			onclick="updateForm(${comment.commentId })"
																			value="수정">
																		<input type="button"
																			onclick="deleteComment(${comment.commentId })"
																			value="삭제">
																	</c:if></td>

														</tr>
														<tr>
															<td class="createdDateB"><fmt:formatDate
																	pattern="MM-dd" value="${comment.commentCreatedDate }" /></td>
														</tr>
													</table>
												</div>
												<div class="row" style="padding: 10px">
													<p class="content-text" itemprop="articleBody"
														id="comment${comment.commentId }">${comment.comment }</p>
												</div>
											</div>

										</c:forEach>
										<c:if test="${not empty sessionScope.sid }">
										<div class="row viewSubWrap">
											<div class="col-lg-9 col-9">
												<div class="row">
													<table style="float: left;">
														<tr>
															<td rowspan="2" width="40px"><img class="viewProfle"
																src="/images/${sessionScope.userImg}"></td>
															<td><a class="nickNameB" href="#">${sessionScope.userNickname}</a><span><i
																	class="fa-solid fa-2xs fa-bolt"></i></td>
														</tr>
														<tr>
															<td class="createdDateB"><fmt:formatDate
																	value="${now}" pattern="hh:mm" /></td>
														</tr>
													</table>
												</div>
												<div class="row" style="padding: 10px">
													<div class="input-group">
														<textarea id="comment" class="form-control"
															aria-label="With textarea"></textarea>
													</div>
												</div>
											</div>
											<div class="col-auto ms-auto align-self-end">
												<button id="commentWriteBtn" class="btn btn-gradient blue">등록</button>
											</div>
										</div>
										</c:if>
									</div>
								</li>
							</ul>
							<br> <br>
							<div class="ms-auto d-none d-xl-block d-lg-block"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="sideBox">
				<div class="createQuestion">
					<c:if test="${ not empty sessionScope.sid }">
					<a href="<c:url value='/writePage'/>"><button
							class="btn-gradient blue">새 질문 작성하기</button></a>
							</c:if>
							<c:if test="${ empty sessionScope.sid }">
							<a href="<c:url value='/writePage'/>"><button
							class="btn-gradient blue" style="background-color:gray;" disabled>새 질문 작성하기</button></a>
							</c:if>
				</div>
				<div class="questionTag">
					<div class="questionTagTitle">
						<span>태그</span><span><i class="fa-solid fa-tags"></i></span>
					</div>
					<div class="sideTagBox">
						<div class="Tag">CSS</div>
						<div class="Tag">HTML</div>
						<div class="Tag">Java</div>
						<div class="Tag">SQL</div>
						<div class="Tag">JSP</div>
						<div class="Tag">Git</div>
						<div class="Tag">jQuery</div>
						<div class="Tag">Ajax</div>
						<div class="Tag">Spring</div>
					</div>
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