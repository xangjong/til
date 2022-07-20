<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
			<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/hashtag2.css">
		<link rel="stylesheet" type="text/css" href="css/viewPage.css">
		<link rel="stylesheet" type="text/css" href="css/buttonD.css">
		<link rel="stylesheet" type="text/css" href="css/buttonE.css">
		<link rel="stylesheet" type="text/css" href="css/viewPage2.css">
		<title>게시글</title>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
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
												<button id="btn" class="btn-gradient red">삭제</button>
												<button id="btn" class="btn-gradient blue">수정</button>
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
																src="//www.gravatar.com/avatar/FF02F28ACA6FE056672337E6E913DFCC?d=identicon&amp;s=30">
															</td>
															<td><a class="nickNameB" href="#">플로우</a><span><i
																	class="fa-solid fa-2xs fa-bolt">525</i></td>
														</tr>
														<tr>
															<td class="createdDateB">22-06-17 01:51</td>
														</tr>
													</table>
												</div>
												<div class="col-4 align-self-center" style="text-align: right">
													<div class="row">
														<div class="col-6"></div>
														<div class="col-3">
															<i class="fa-solid fa-xs fa-comment">123</i>
														</div>
														<div class="col-3">
															<i class="fa-solid fa-xs fa-eye">1M</i>
														</div>
				
													</div>
												</div>
											</div>
											<div class="row viewSubWrap"
												style="border-bottom: none; background-color: rgb(180, 180, 180);">
												<div class="col-lg-12 col-12" style="padding: 5px;">
													<span class="text-left"
														style="font-size: 1.1em; font-weight: bold; color: white;">#1251974</span>
													<a href="#" class="category1">Tips & 강좌</a> <a class="tag1"
														href="#">layout</a> <a class="tag1" href="#">web.dev</a> <a
														class="tag1" href="#">css</a> <a class="tag1" href="#">flex</a>
													<a class="tag1" href="#">grid</a>
													<p style="line-height: 0.5em;"></p>
													<p
														style="line-height: 0.1em; font-size: 1.5em; color: white; font-weight: bold;">CSS
														Layout의 역사</p>
												</div>
											</div>
											<div class="row viewSubWrap">
												<article class="content-text" itemprop="articleBody">
													<p>
														<img src="//file.okky.kr/images/1655397770132.PNG"
															style="width: 100%">
													</p>
													<p>
														(출처: 구글 web.dev,&nbsp;<a
															href="https://web.dev/learn/css/layout/" rel="nofollow">https://web.dev/learn/css/layout/</a>
														<a href="https://web.dev/learn/css/layout/" target="_blank"
															title="새창으로 열기"><i class="fa fa-external-link"></i></a>)
													</p>
													<p>
														<br>
													</p>
													<p>Flexbox가 2012년도에 나왔습니다.</p>
													<p>그 전까지는 얼마나 배치하는게 힘들었을까요.</p>
													<p>(야매가 아니라면) 센스있는 trick들에 의존했겠죠...</p>
													<p>Flexbox 나오고 환호성이 나왔다고 하는데... 이해가 됩니다.</p>
													<p>
														<br>
													</p>
													<p>그리고 깡패 Grid가 나왔죠, one-dimensional에서 two-dimensional이라니,</p>
													<p>그리고 2021년에는 Container queries까지 (잠깐봤는데&nbsp; ㅎㄷㄷ이더군요.)</p>
													<p>
														<br>
													</p>
													<p>개발이 점점 쉬워지고 있습니다. (물론 복잡해지는 부분도 있습니다.)</p>
													<p>그런데 이렇게 쉬워지는데는 훌륭한 선배 개발자들이 저변을 넓혀줘서 그렇겠지요.</p>
													<p>아무렇지 않게 쓰고 있지만, 리스펙을 보냅니다.</p>
													<p>
														<br>
													</p>
													<p>뉴턴이 한 말</p>
													<p>
														<b
															style="color: rgb(32, 33, 34); font-family: sans-serif; animation-delay: important; animation-duration: important; animation-iteration-count: important; scroll-behavior: important; transition-duration: important">
															"standing on the shoulders of giants"</b>
													</p>
													<p>
														<br>
													</p>
													<p>다시 한번 생각나는 밤이네요.</p>
													<p>늦은시간 모듬회와 에반윌리엄스가또 뻘글을 쓰게 만들었네요.</p>
													<p>
														<br>
													</p>
													<p>즐거운 금요일입니다!</p>
												</article>
												<div
													style="height: 120px; display: flex; align-items: center; justify-content: center;">
													<button class="btnE btnLike">
														<p>추천</p>
														<p style="line-height: 5px;">10</p>
													</button>
													<button id="btn" class="btnE btnDisLike">
														<p>비추천</p>
														<p style="line-height: 5px;">1</p>
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
											<div class="row viewSubWrap">
												<div class="row">
													<table style="float: left;">
														<tr>
															<td rowspan="2" width="40px"><img class="viewProfle"
																src="//www.gravatar.com/avatar/FF02F28ACA6FE056672337E6E913DFCC?d=identicon&amp;s=30">
															</td>
															<td><a class="nickNameB" href="#">플로우</a><span><i
																	class="fa-solid fa-2xs fa-bolt">525</i></td>
														</tr>
														<tr>
															<td class="createdDateB">22-06-17 01:51</td>
														</tr>
													</table>
												</div>
												<div class="row" style="padding: 10px">
													<article class="content-text" itemprop="articleBody">
														편해보이긴한데 가독성은 그닥 안좋은거 같아보이네요.</article>
												</div>
											</div>
											<div class="row viewSubWrap">
												<div class="row">
													<table style="float: left;">
														<tr>
															<td rowspan="2" width="40px"><img class="viewProfle"
																src="//file.okky.kr/profile/2021/1639580399210.png"></td>
															<td><a class="nickNameB" href="#">kenu</a><span><i
																	class="fa-solid fa-2xs fa-bolt">62k</i></td>
														</tr>
														<tr>
															<td class="createdDateB">22-06-17 01:51</td>
														</tr>
													</table>
												</div>
												<div class="row" style="padding: 10px">
													<article class="content-text" itemprop="articleBody">
														해당 게시물은 관리자에 의해 사는얘기에서 Tips & 강좌로 이동 되었습니다.</article>
												</div>
											</div>
											<div class="row viewSubWrap">
												<div class="col-lg-9 col-9">
													<div class="row">
														<table style="float: left;">
															<tr>
																<td rowspan="2" width="40px"><img class="viewProfle"
																	src="//file.okky.kr/profile/2021/1639580399210.png">
																</td>
																<td><a class="nickNameB" href="#">kenu</a><span><i
																		class="fa-solid fa-2xs fa-bolt">62k</i></td>
															</tr>
															<tr>
																<td class="createdDateB">22-06-17 01:51</td>
															</tr>
														</table>
													</div>
													<div class="row" style="padding: 10px">
														<div class="input-group">
															<textarea class="form-control" aria-label="With textarea"></textarea>
														</div>
													</div>
												</div>
												<div class="col-auto ms-auto align-self-end">
													<button class="btn btn-gradient blue">등록</button>
												</div>
											</div>
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
						<a href="<c:url value='/writePage'/>"><button class="btn-gradient blue">새 질문 작성하기</button></a>
					</div >
					<div class="questionTag">
						<div class="questionTagTitle">
							<span>태그</span><span><i class="fa-solid fa-tags"></i></span>
						</div>
						<div class="sideTagBox">	
							<div class="Tag">
								CSS
							</div>
							<div class="Tag">
								HTML
							</div>
							<div class="Tag">
								Java
							</div>
							<div class="Tag">
								SQL
							</div>
							<div class="Tag">
								JSP
							</div>
							<div class="Tag">
								Git
							</div>
							<div class="Tag">
								jQuery
							</div>
							<div class="Tag">
								Ajax
							</div>
							<div class="Tag">
								Spring
							</div>
						</div>
					</div>
					<div class="hotQuestion">
						<table>
							<tr><th>핫 게시물  <i class="fa-brands fa-hotjar"></i></th></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>30</span>&nbsp;&nbsp;<a href="#">Java와 JavaScript의 차이점이 뭔가요?....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>26</span>&nbsp;&nbsp;<a href="#">SQL 기본 문법에는 뭐가 있을까요?....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>24</span>&nbsp;&nbsp;<a href="#">Docker 명령어에는 어떤 것이 있나요?....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>22</span>&nbsp;&nbsp;<a href="#">C에서 입력값의 끝을 판별할 수 있는...</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>21</span>&nbsp;&nbsp;<a href="#">PWA 를 apk,ipa로 빌드하고싶습니다....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>18</span>&nbsp;&nbsp;<a href="#">C언어 동적할당변수 sizeof값이 이상...</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>15</span>&nbsp;&nbsp;<a href="#">트리 순회 질문.....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>14</span>&nbsp;&nbsp;<a href="#">라우터 관련 네트워킹 동작 과정이 궁....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>11</span>&nbsp;&nbsp;<a href="#">QueryDSL select 에서 에러가 납니다.....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>8</span>&nbsp;&nbsp;<a href="#">파이썬 pip 오류 ssl 오류....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>6</span>&nbsp;&nbsp;<a href="#">초보개발자) 아이패드 네이티브 vs 웹....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>5</span>&nbsp;&nbsp;<a href="#">카이스트 핀토스 환경설정 질문....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>3</span>&nbsp;&nbsp;<a href="#">csharp 질문드립니다 한프로젝트에 2개....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>2</span>&nbsp;&nbsp;<a href="#">리액트 콘솔과 실제화면이 다르게 나....</a></td></tr>
							<tr><td><i class="fa-regular fa-thumbs-up"></i><span>1</span>&nbsp;&nbsp;<a href="#">깃허브 블로그 disqus 댓글기능 관련....</a></td></tr>
						</table>
					</div>
				</div>
			</div>	
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>