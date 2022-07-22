<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<script src="js/jquery-3.6.0.min.js"></script>
<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>


<!-- tagify
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script
	src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
	 -->
 <script src="<c:url value='/js/tagify.min.js'/>" ></script>
 <script src="<c:url value='/js/tagify.polyfills.min.js'/>" ></script>
 <link href="<c:url value='/css/tagify.css'/> "
	rel="stylesheet" type="text/css" />
	 
	 
<!-- summer note -->
<script src="<c:url value='/js/summernote-lite.js'/> "></script>
<script src="<c:url value='/js/lang/summernote-ko-KR.js'/> "></script>
<link rel="stylesheet" href="<c:url value='/css/summernote-lite.css'/> ">
<!-- custom javascript -->
<script src="<c:url value='/js/write.js'/> "></script>


<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/buttonD.css">
<link rel="stylesheet" type="text/css" href="css/writePage.css">
<style type="text/css">
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" />
	<section>
		<div class="container-fluid" style="margin: 0; padding: 0;">
			<div class="row">
				<div class="col-lg-2 d-none d-xl-block d-lg-block"></div>
				<div class="col-lg-8 col-12">
					<br>

					<nav class="listSize" style="padding: 0; margin: auto">
						<div class="container" style="padding: 10px;">
							<div class="row">
								<div class="col-auto me-auto"
									style="font-size: 1.5em; color: rgba(102, 152, 203, 1)">
									<i class="fa-solid fa-lg fa-pen-to-square"
										style="margin-right: 10px"></i>게시물 작성
								</div>
								<div class="col-auto">
									<button class="btn btn-gradient red" onClick="history.go(-1)">취소</button>
									<button class="btn btn-gradient blue" id="submitBtn">저장</button>
								</div>
							</div>
						</div>
					</nav>
					<ul class="listSize listMainWrap">
						<li>
							<div class="container">
								<div class="row viewSubWrap">
									<div class="col-8">
										<table style="float: left;">
											<tr>
												<td rowspan="2">
													<c:if test="${not empty sessionScope.userImg}">
														<img class="viewProfle" src="${sessionScope.userImg }">
													</c:if>
												</td>
												<td>
													comment.userImg
													<a class="nickNameC" href="#">${sessionScope.userNickname }</a>
												</td>
											</tr>
											<tr>
												<td class="createdDateC"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${now }"/></td>
											</tr>
										</table>
									</div>
									<div class="col-4 align-self-center" style="text-align: right">
									</div>
								</div>
								<div class="row viewSubWrap">
									<div class="input-group mb-3" style="margin-top: 10px">
										<select class="form-select inputGroupSelect02" id="categoryId">
											<c:forEach var="category" items="${categoryList }"
												varStatus="status">
												<option value="${category.categoryId }">${category.categoryName }</option>
											</c:forEach>
										</select>
									</div>
									<div class="mb-3">
										<input type="email"  id="noteTitle"
											class="form-control exampleFormControlInput1"
											placeholder="제목을 입력하세요">
									</div>
									<div>
										<input name='hashtag'
											class="form-control exampleFormControlInput1" placeholder="해시태그를 입력하세요">
									</div>
									<div>
										<p></p>
									</div>
									<div id="summernote"></div>
									<div>
										<p></p>
									</div>
								</div>

							</div>
						</li>
					</ul>

					<div class="col-lg-2 d-none d-xl-block d-lg-block"></div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>