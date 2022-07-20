<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TalkPage</title>
		<link rel="stylesheet" type="text/css" href="css/talkPage.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/talkPage.js"></script>
		<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
		<script src="json/dummyData.json" type="text/javascript"></script>
		<script src="js/tabMenu.js"></script>
		<script src="js/session.js"></script>
		<script src="js/chatting.js"></script>
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		
		
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/buttonD.css">
		<link rel="stylesheet" type="text/css" href="css/buttonE.css">
		<link rel="stylesheet" type="text/css" href="css/hashtag1.css">
		<link rel="stylesheet" type="text/css" href="css/listPage2.css">
		<link rel="stylesheet" type="text/css" href="css/chatting.css">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="bodyWrap">
				<div class="talkBoxWrap">
					<div class="container-fluid" style="margin: 0; padding: 0;">
						<div class="row">
							<br>
							<nav class="" style="padding: 0; margin: auto">
								<div class="container" style="padding: 10px;">
									<div class="row"
										style=" padding: 10px; margin: 5px;">
							
										<div class="col-lg-6 col-12" style="height: auto; padding: 11px">
											<form class="d-flex">
												<input class="form-control" type="search" placeholder="검색어를 입력하세요"
													aria-label="Search">
												<button class="btnSearch">
													<i class="fa-solid fa-magnifying-glass"></i>
												</button>
											</form>
										</div>
									</div>
									<div class="row">
										<div class="col-auto me-auto"
											style="color: rgb(112, 190, 248); font-size: 1.5em;">
											<img
												style="width: 40px; height: 40px; margin-right: 10px; filter: opacity(0.4) drop-shadow(0 0 0 #a5d4c0);"
												src="image/Q&A.png">자유게시판
										</div>
									</div>
								</div>
							</nav>
							<div class="row" style="margin: 10px;">
								<div class="col-lg-2"></div>
								<div class="col-lg-8 col-12">
									<div id="carouselExampleCaptions" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-indicators">
											<button type="button" data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="0" class="active" aria-current="true"
												aria-label="Slide 1"></button>
											<button type="button" data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="1" aria-label="Slide 2"></button>
											<button type="button" data-bs-target="#carouselExampleCaptions"
												data-bs-slide-to="2" aria-label="Slide 3"></button>
										</div>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="http://blog.jinbo.net/attach/615/200937431.jpg"
													class="d-block w-100" alt="...">
												<div class="carousel-caption d-none d-md-block">
													<h5>제목1</h5>
													<p>Username1</p>
												</div>
											</div>
											<div class="carousel-item">
												<a href='#'><img
													src="http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg"
													class="d-block w-100" alt="..."></a>
												<div class="carousel-caption d-none d-md-block">
													<h5>제목2</h5>
													<p>Username2</p>
												</div>
											</div>
											<div class="carousel-item">
												<img
													src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=http%3A%2F%2Fcfile28.uf.tistory.com%2Fimage%2F273FD73655215003301686"
													class="d-block w-100" alt="...">
												<div class="carousel-caption d-none d-md-block">
													<h5>제목3</h5>
													<p>Username3</p>
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
												<button class="btnFilter btnFilterActive">최신순</button>
												<button class="btnFilter">추천순</button>
												<button class="btnFilter">댓글순</button>
												<button class="btnFilter">조회순</button>
											</div>
										</div>
										<div class="col-lg-5 col-md-5 col-12" style="height: auto;">
				
										</div>
									</div>
									<div class="cardMenu" class="row row-cols-4 row-cols-md-4 g-4"
										style="margin-top: 2px;">
										<div class="col">
											<div class="card">
												<a href="#">
												<img
													src="https://w.namu.la/s/17dcd3b8702541bd0cbafe33310db996d630b94a47160833a340368f86d250ab8239d519fee1cc4689b41ac3f01a7ad24ddf86302be2ab4b495ddda2d6685f76163c85c4859052b4cb1522397f531467b1ea8b2fa284367527888cbf3da0ff6309a44bd8855489f5f77d1a8a991bdfb1"
													class="card-img-top"></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title" >나노머신, 타코!</h5></a>
													<a href="#" style="color:black;"><p class="card-text">이마트의전설</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#"><img src="https://pbs.twimg.com/media/Di_2tx5UwAAfQaE.jpg"
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#" style="color:black;"><img
													src="https://nastock.com/files/attach/images/2021/04/01/c9416d6fc1c7e85ce36c7638609f6c5d.jpg"
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#" style="color:black;"><img
													src="https://blog.kakaocdn.net/dn/xIvda/btqGftBCTA8/w6KnKeCTbq2C1p99bQkCuK/img.jpg"
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#" style="color:black;"><img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRonCe71zACvpzerz7HCJwQkvz2mgo6KVHrew&usqp=CAU"
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#" style="color:black;"><img
													src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-xs96KruNA61EV7dYCtzym-wxfbSPByiDy8_T7DS2U2g7bAcLG6F5iR3mP5Hasi0xPJk&usqp=CAU"
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
										<div class="col">
											<div class="card">
												<a href="#" style="color:black;"><img
													src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPsAAADJCAMAAADSHrQyAAAAY1BMVEX///+VlZWPj4/j4+O0tLT7+/ucnJyfn5/b29uSkpKkpKSrq6uurq7m5uZmZmaWlpbz8/OIiIjs7Ox5eXlkZGRsbGzNzc2BgYF0dHTU1NRvb2+7u7ve3t7w8PDCwsKKiopcXFxuhZvhAAAELklEQVR4nO3b25KiOhQG4HBIICgHUQgg6rz/U85Kgt3OlNDs6mrdrPm/Kwtzwc9KApIoBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADAU3LBu8/tR8k23i2IW77xcxXqRaGq332OPyRSOviCVjwrX5dfRg+CsH33af6Eqerhc/fLouN3n+cPqF10rdvombzVfLNHrsNrlT//ulZ8s+e+6uVM9Ivi2+f9NDcbfaq65pjdT3PzHX4aD2fNL/uUTc91+MR3+HEM2WX301yQzDyyTVcmyEXKLns+DeY2f353m2bBUYieW/aPpzk981TjZzmKzq7u9dfP8KSMbFtu2Xdrogepa8ssexU+Sfr35QhH35hZ9shnV3N89sg35ph94Xep+wkT+i7PMnu50KBknj1ZaJDpz+zM7u/IvtCAeXb9D2dfXfd/ea5D9pec1ysg+0IDZPefMc+/5LxeAdkXGjxmb3m9o/4vz3W5vU7Msq+su1/AYLQGvT77/TU9n70Hq7N/sU67RWuz31fnGUVfmX2sta86q51Gq7Lra+KjRy87r1dYlT3wVQ9YVX1t9oDbNOeszs5rmnP8usxCg/JedWYdXny9LtP7suuS1zTn+LprtX9OhVN0flX/XIed2Tt87/AMqy4e5vF5DKc5776JaiE6u5vbh3r30b21fYjRbgB8bEDQesdxrN9d8iWckwMAAAAAAAAA/A/FqqyEONtliTExJptez1S7sxBXpXr6nCfKbTDJy+lvg73yDa/u7ySbfYsng6GhfOpE0bpuv+tM5Y5XByVF3DQZfW6bQdtj16Zxixd9YeJsuFX0vUo2nF2Ux+NOiISyx4P9y+Pg12Z89uFg6HPSGbdaVQadvRSyPF7oQpxSERfVG8/8+8qbogra7MqWPD/6/VNT9uxIXdvog627NLE2969ESn0gLi5vPffvKsNrEz1m37vDU5+/dqkQp7PLHnXpeaCwl8N9vXbz2W91Ec9mT81VpMVobPb2mPd2bnjMHlWXarsbrsqbMLe57EUdKnE1tcu+M1XenX32KI7jiMbEsevMdl/clzdJPTmbyV7tjcxK6bLfSn/UZu/DQ0HjvWn7vt9y3eU49LPZWyp9LGx2WVDNE2rj+rzsCwZz3U1Wh11STNnrP7NfquLc9S572jSnU9Pk03hPeWQXmQkKW1MauWP3eI8rLtIc6CZus8cDdXCa+UV1CyWX7BU9uJnCPrZdhcjsTC4+s4tk6IQb7+pAiauCap4N1KZ12Wmev2x2vMuQerpsml+USzfD0CQ+SmVKKfa/anp+S4Q8hjQY3J2tM1LUxjakobAvGhoI291QHdn/84+p3SFd9efzOFVRjhEN/lSKKrUjIRIydfeyiA6JCzXsc7oIqbXt51oAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA+K7fw2lApeR5FTgAAAAASUVORK5CYII="
													class="card-img-top" alt="..."></a>
												<div class="card-body">
													<a href="#" style="color:black;"><h5 class="card-title">Card title</h5></a>
													<a href="#" style="color:black;"><p class="card-text">Username</p></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-2"></div>
							</div>
				
							<ul class="listSize listMainWrap">
				
							</ul>
							<br>
							<div class="row">
								<div class="col"></div>
								<div class="col">
									<div style="display: flex; margin: 0 auto;">
										<button class="btnFilter"><<</button>
										<button class="btnFilter btnFilterActive">1</button>
										<button class="btnFilter">2</button>
										<button class="btnFilter">3</button>
										<button class="btnFilter">>></button>
									</div>
								</div>
								<div class="col"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="sideBox">
					<div class="createTalk">
						<a href="<c:url value='/writePage'/>"><button>새 글 작성하기</button></a>
					</div>
					<div class="chatting">
						<div class="chat_wrap">
							<div class="header">
								CHAT
							</div>
							<div class="chat">
								<ul>
								</ul>
							</div>
							<div class="input-div">
								<textarea placeholder="Press Enter for send message."></textarea>
							</div>
							<!-- format -->
							<div class="chat format">
								<ul>
									<li>
										<div class="sender">
											<span></span>
										</div>
										<div class="message">
											<span></span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>