<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>댓글 관리 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<script src="<c:url value='/js/admin.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/adminSideBar.css'/>">
	</head>
	<body>
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
	<section>
		<main class="cd-main-content">
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
			
			<div class="searchBtn">
				 <input type="text" autofocus class="inputBtn" placeholder="검색어 입력">
			</div>

				<div class="tableBox">
					<form>
						<table class="manage">
							<thead>
								<tr>
									<th>commentId</th>
									<th>userId</th>
									<th>noteId</th>
									<th>comment</th>
									<th>commentCrdDate</th>
									<th>commentUtdDate</th>
									<th>commentLike</th>
									<th>pageViewState</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>댓글아이디</td>
									<td>유저아이디</td>
									<td>게시판아이디</td>
									<td>댓글내용</td>
									<td>작성일</td>
									<td>수정일</td>
									<td>좋아요 수</td>
									<td>
										<div class="select pageView">
										<div class="blank"></div>
										  <select>
										    <option value="1">예</option>
										    <option value="2">아니오</option>
										  </select>
										</div>
									</td>
								</tr>
							</tbody>	
							
							
						</table>						
					</form>		
					
				</div> <!--tableBox  -->
	
		</main> <!-- .cd-main-content -->
	</section>	
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>