<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/adminTab.js'/>"></script>
		<script src="<c:url value='/js/adminUser.js'/>"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/buttonE.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminSideBar.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin.css'/>">
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<nav class="cd-side-nav">
				<ul>
					<li class="cd-label">관리</li>
					<li class="has-children user">
						<a href="<c:url value="/subPage/adminUser"/>">사용자</a>
					</li>
					<li class="has-children post">
						<a href="<c:url value="/subPage/adminPost"/>">게시판</a>
					</li>
					<li class="has-children comments">
						<a href="<c:url value="/subPage/adminComment"/>">댓글</a>
					</li>
					<li class="has-children hashtag">
						<a href="<c:url value="/subPage/adminHashTag"/>">해시태그</a>
					</li>
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
				<form method="post" id="userFrm" class="userFrm" name="userFrm" action="<c:url value='/subPage/adminUserSearch'/>">
					<div class="container-fluid" >
						<div class="row">
							<div class="tableBox">
								<ul class="searchIf">
									<li>검색조건</li>
									<li>유저ID : </li>
									<li><input type="text" id="userId" class="userId" name="userId" size="10"></li>
									<li>이름 : </li>
									<li><input type="text" id="userName" class="userName" name="userName" size="10"></li>
									<li>권한 : </li>
									<li class="space">
										<div class="select pageView">
											<select id="roll" class="roll" name="roll">
												<option value="">선택</option>
												<option value="0">사용자</option>
												<option value="1">관리자</option>
											</select>
										</div>
									</li>
									<li>상태 : </li>
									<li class="space">
										<div class="select pageView">
											<select id="userState" class="userState" name="userState">
												<option value="">선택</option>
												<option value="0">정상</option>
												<option value="1">밴</option>
												<option value="2">탈퇴</option>
											</select>
										</div>
									</li>
									<li>
										<input type="submit" id="searchBtn" class="btn-gradient blue" value="검색">
										<input type="submit" id="saveBtn" class="btn-gradient blue" value="저장">
									</li>
								</ul>

								<table class="manage">
									<thead>
										<tr>
											<th>번호</th>
											<th>유저ID</th>
											<th>이름</th>
											<th>이메일</th>
											<th>이미지</th>
											<th>생성일</th>
											<th>접속일</th>
											<th>닉네임</th>
											<th>소속</th>
											<th>권한</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="user" items="${users}" varStatus="loop">
											<tr>
												<td>${loop.count}</td>
												<td><a href="<c:url value='/subPage/adminDetailUserView/${user.userId}'/>">${user.userId}</a></td>
												<td>${user.userName}</td>
												<td>${user.userEmail}</td>
												<td>${user.userImg}</td>
												<td><fmt:formatDate value="${user.userCreatedDate}" pattern="yyyy-MM-dd HH:mm:dd"/></td>
												<td><fmt:formatDate value="${user.userActivateDate}" pattern="yyyy-MM-dd HH:mm:dd"/></td>
												<td>${user.userNickname}</td>
												<td>${user.userCompany}</td>
												<td>
												  	<c:if test="${user.roll eq '0'}">사용자</c:if>
												    <c:if test="${user.roll eq '1'}">관리자</c:if>
												</td>
												<td>
												    <c:if test="${user.userState eq '0'}">정상</c:if>
												    <c:if test="${user.userState eq '1'}">밴</c:if>
												    <c:if test="${user.userState eq '2'}">탈퇴</c:if>
												</td>
											</tr>
										</c:forEach>
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
				</form>
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>