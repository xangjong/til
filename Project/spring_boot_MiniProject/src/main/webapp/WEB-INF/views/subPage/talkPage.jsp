<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TalkPage</title>
<link rel="stylesheet" type="text/css" href="css/talkPage.css">
<script src="<c:url value='js/jquery-3.6.0.min.js'/>" ></script>
<script src="js/talkPage.js"></script>
<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
<script src="js/tabMenu.js"></script>
<script src="js/session.js"></script>
<script src="js/chatting.js"></script>
<script src="js/server.js"></script>
<script src="<c:url value='/js/talkPaging.js'/> "></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
<script src="/socket.io/socket.io.js"></script>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/buttonD.css">
<link rel="stylesheet" type="text/css" href="css/buttonE.css">
<link rel="stylesheet" type="text/css" href="css/hashtag1.css">
<link rel="stylesheet" type="text/css" href="css/listPage2.css">
<link rel="stylesheet" type="text/css" href="css/chatting.css">
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section>
		<div class="bodyWrap">
			<div class="talkBoxWrap">
				<div class="container-fluid" style="margin: 0; padding: 0;">
					<div class="row">
						<nav class="" style="padding: 0; margin: auto">
							<div class="searchBox col-lg-6 col-12"
								style="height: auto; padding: 11px">
								<form class="d-flex">
									<input id="titleSearch" class="form-control" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
                           			<button class="btnSearch" onclick="titleSearchBtn()">
                              			<i class="fa-solid fa-magnifying-glass"></i>
                           			</button>
								</form>
							</div>
						</nav>
						<div class="row" style="margin: 10px;">
							<div class="col-11">
								<div id="carouselExampleCaptions" class="carousel slide"
									data-bs-ride="carousel">
									<div class="carousel-indicators">
										<button type="button"
											data-bs-target="#carouselExampleCaptions"
											data-bs-slide-to="0" class="active" aria-current="true"
											aria-label="Slide 1"></button>
										<button type="button"
											data-bs-target="#carouselExampleCaptions"
											data-bs-slide-to="1" aria-label="Slide 2"></button>
										<button type="button"
											data-bs-target="#carouselExampleCaptions"
											data-bs-slide-to="2" aria-label="Slide 3"></button>
									</div>
									<div class="carousel-inner">
										
										<div class="carousel-item active">
											<a href="http://localhost:8080/viewPage/59"><img src="http://localhost:8080/summernote_upload/21bc13fe-e01a-4c6e-8973-569740e68a16.png"
												class="d-block w-100" alt="..."></a>
											<div class="carousel-caption d-none d-md-block">
												<h5>몰?루의 산수교실</h5>
												<p>일반유저2</p>
											</div>
										</div>
										
										<div class="carousel-item">
											<a href='http://localhost:8080/viewPage/62'><img
												src="http://localhost:8080/summernote_upload/c69b7c05-75e7-4e15-aa32-17c0c58a70d7.jpg"
												class="d-block w-100" alt="..."></a>
											<div class="carousel-caption d-none d-md-block">
												<h5>일합시다!2</h5>
												<p>일반유저2</p>
											</div>
										</div>
										<div class="carousel-item">
											<a href="http://localhost:8080/viewPage/65"><img
												src="http://localhost:8080/summernote_upload/1eb35378-c7f6-425e-946d-9d1e52ad2131.jpg"
												class="d-block w-100" alt="..."></a>
											<div class="carousel-caption d-none d-md-block">
												<h5>포켓몬빵,띠부씰</h5>
												<p>일반유저</p>
											</div>
										</div>
									</div>
									<button class="carousel-control-prev" type="button"
										data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button"
										data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span>
										<span class="visually-hidden">Next</span>
									</button>
								</div>
								<br>
								<div class="row">
									<div class="col-lg-7 col-md-7 me-auto col-12 align-self-end"
										style="height: auto; font-size: 0.7em;">
										<div style="display: flex;">
											<div class="arrayTitle">
												<button id="btn-noteId" class="btnFilter btnFilterActive">최신순</button>
												<button id="btn-noteLike" class="btnFilter">추천순</button>
												<button id="btn-noteCommentNum" class="btnFilter">댓글순</button>
												<button id="btn-noteView" class="btnFilter">조회순</button>
											</div>
										</div>
									</div>
									<div class="col-lg-5 col-md-5 col-12" style="height: auto;">

									</div>
								</div>
								<div class="cardMenu" id="searchResultBox" class="row row-cols-4 row-cols-md-4 g-4"
									style="margin-top: 2px;">
								</div>
							</div>
						</div>

						<ul class="listSize listMainWrap">

						</ul>
						<br>
						
					</div>
				</div>
			</div>
			<div class="sideBox">
				<div class="createTalk">
					<a href="<c:url value='/writePage'/>"><button
							class="btn-gradient blue">새 글 작성하기</button></a>
				</div>
				<div class="chatWrap">
					<div class="chatHeader">Chat</div>
					<div id="chatView"></div>
					<form id="chatForm" onsubmit="return false">
						<input type="text" autocomplete="off" id="msg"
							placeholder="메시지를 입력하세요"> <input type="submit" id="send"
							value="보내기">
					</form>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>