<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자</title>
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/talkPage.js"></script>
		<script src="js/tabMenu.js"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/buttonE.css">
		<link rel="stylesheet" type="text/css" href="css/adminSideBar.css">
		<link rel="stylesheet" type="text/css" href="css/admin.css">
		
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<nav class="cd-side-nav">
				<ul>
					<li class="cd-label">Management</li>
					<li class="has-children user">
						<a href="<c:url value="/adminUser"/>">User</a></li>
					
					<li class="has-children post">
						<a href="<c:url value="/adminPost"/>">Post</a></li>
					
					<li class="has-children comments">
						<a href="<c:url value="/adminComment"/>">Comments</a></li>
					
					<li class="has-children hashtag">
						<a href="<c:url value="/adminHashTag"/>">Hashtag</a></li>
				</ul>
	
				<ul>
					<li class="cd-label">Secondary</li>
					<li class="has-children bookmarks">
						<a href="#0">Bookmarks</a></li>
					<li class="has-children images">
						<a href="#0">Images</a>
					</li>
	
					<li class="has-children users">
						<a href="#0">Users</a>
					</li>
				</ul>
	
				<ul>
					<li class="cd-label">Action</li>
					<li class="action-btn"><a href="#0">+ Button</a></li>
				</ul>
			</nav>
			<div class="bodyWrap">
					<div class="container-fluid" >
						<div class="row">
							<br>
							<div class="container" ">
								<div class="row">
									<div class="searchBox col-lg-6 col-12">
										<form class="d-flex">
											<input class="form-control" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
											<button class="btnSearch">
												<i class="fa-solid fa-magnifying-glass"></i>
											</button>
										</form>
									</div>
								</div>
							</div>
							<div class="tableBox">
								<table class="manage">
									<thead>
										<tr>
											<th>userId</th>
											<th>userPw</th>
											<th>userName</th>
											<th>userEmail</th>
											<th>userImg</th>
											<th>userActDate</th>
											<th>userCrdDate</th>
											<th>userNickName</th>
											<th>userCompany</th>
											<th>roll</th>
											<th>userState</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>유저아이디</td>
											<td>유저비밀번호</td>
											<td>유저이름</td>
											<td>유저이메일</td>
											<td>유저이미지</td>
											<td>유저접속일</td>
											<td>유저생성일</td>
											<td>유저닉네임</td>
											<td>소속</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">관리자</option>
												    <option value="2">사용자</option>
												  </select>
												</div>
											</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">정상</option>
												    <option value="2">밴</option>
												  </select>
												</div>
											</td>
										</tr>
										<tr>
											<td>유저아이디</td>
											<td>유저비밀번호</td>
											<td>유저이름</td>
											<td>유저이메일</td>
											<td>유저이미지</td>
											<td>유저접속일</td>
											<td>유저생성일</td>
											<td>유저닉네임</td>
											<td>소속</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">관리자</option>
												    <option value="2">사용자</option>
												  </select>
												</div>
											</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">정상</option>
												    <option value="2">밴</option>
												  </select>
												</div>
											</td>
										</tr>
										<tr>
											<td>유저아이디</td>
											<td>유저비밀번호</td>
											<td>유저이름</td>
											<td>유저이메일</td>
											<td>유저이미지</td>
											<td>유저접속일</td>
											<td>유저생성일</td>
											<td>유저닉네임</td>
											<td>소속</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">관리자</option>
												    <option value="2">사용자</option>
												  </select>
												</div>
											</td>
											<td>
												<div class="select">
												  <select>
												    <option value="1">정상</option>
												    <option value="2">밴</option>
												  </select>
												</div>
											</td>
										</tr>
									</tbody>	
								</table>						
							</div> <!--tableBox  -->		
						</div>	
						<div class="pageNumBox row">
							<div class="pageNum col">
								<button class="btnFilter"><<</button>
								<button class="btnFilter btnFilterActive">1</button>
								<button class="btnFilter">2</button>
								<button class="btnFilter">3</button>
								<button class="btnFilter">>></button>
							</div>
						</div>
					</div>
				</div>
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>