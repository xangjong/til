<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>관리자 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/MenuTab.js'/>"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/reset.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/admin.css'/>">
	</head>
	<body>
		<div class="wrapper">
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="adminBox">
				<h2>게시글관리</h2>
				<div class="listBox">
					<a><span>전체 목록</span></a>
					<a><span>게시글 수</span></a>
					<a><span>33건</span></a>
				</div> <!-- listBox -->
				
				<div class="explain">
					<a>그룹 선택, 게시판 선택, 게시물의 원글, 코멘트 선택, 제목, 내용, 회원 아이디,
						글쓴이, 검색어 등록 등으로 검색을 할 수 있습니다.
						<span>그룹검색을 허용을 선택하거나 검색어를 입력</span>하여 
						<span>여러 게시판을 동시에 검색</span> 할 수 있습니다.
						<span>그룹 검색 시 데이터가 많은 경우</span> 느려질 수 있습니다.
					</a>
				</div> <!-- explain -->
			</div> <!-- adminBox -->
			<div class="tableBox">
				<form>
					<table border="1">
						<tr>
							<td><input type="checkbox"></td>
							<td>
								<select>
									<option>공지사항</option>
									<option>자유게시판</option>
									<option>질문게시판</option>
								</select>
							</td>
							
							<td>
								<select>
									<option>전체게시판</option>
									<option>자유게시판</option>
									<option>질문게시판</option>
								</select>
							</td>
							
							<td>
								<select>
									<option>원글만</option>
									<option>자유게시판</option>
									<option>질문게시판</option>
								</select>
							</td>
							
							<td>
								<select>
									<option>선택</option>
									<option>자유게시판</option>
									<option>질문게시판</option>
								</select>
							</td>
						</tr>
					</table>
					
					<table border="1">
						<tr>
							<th><input type="checkbox"></th>
							<th>번호</th>
							<th>그룹</th>
							<th>게시판</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회</th>
							<th>추천</th>
							<th>링크</th>
							<th>명령</th>
						</tr>
						
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						
						<tr>
							<td><input type="checkbox"></td>
							<td>32</td>
							<td><input type="text" placeholder="그룹"></td>
							<td><input type="text" placeholder="게시판"></td>
							<td><input type="text" placeholder="제목"></td>
							<td><input type="text" placeholder="작성자"></td>
							<td><input type="text" placeholder="등록일"></td>
							<td><input type="text" placeholder="조회"></td>
							<td><input type="text" placeholder="추천"></td>
							<td><input type="text" placeholder="링크"></td>
							<td>
								<input type="text" placeholder="수정">
								<input type="text" placeholder="보기">
								<input type="text" placeholder="목록">
							</td>
						</tr>
						
					</table>
				</form>
			</div> <!--tableBox  -->
		</section>	
			<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
		</div> <!-- wrapper -->
	</body>
</html>