<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<script src="<c:url value='/js/jquery-3.6.0.min.js'/> "></script>
<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<script src="<c:url value='/js/summernote-lite.js'/> "></script>
<script src="<c:url value='/js/lang/summernote-ko-KR.js'/> "></script>
<script src="<c:url value='/js/test/write.js'/> "></script>
<link rel="stylesheet" href="<c:url value='/css/summernote-lite.css'/> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/buttonD.css'/> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/writePage.css'/> ">
</head>
<body>
	<c:import url="/WEB-INF/views/layout_test/top.jsp" />
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
									style="font-size: 1.5em; color: rgb(112, 190, 248)">
									<i class="fa-solid fa-lg fa-pen-to-square"
										style="margin-right: 10px"></i>게시물 작성
								</div>
								<div class="col-auto">
									<button class="btn btn-gradient red" >취소</button>
									<button class="btn btn-gradient cyan" id="submitBtn">저장</button>
								</div>
							</div>
						</div>
					</nav>
					<form method="post" id="writeFrm">
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
													<td><a class="nickNameC" href="#">플로우</a><i
														class="fa-solid fa-2xs fa-bolt">525</i></td>
												</tr>
												<tr>
													<td class="createdDateC">22-06-17 01:51</td>
												</tr>
											</table>
										</div>
										<div class="col-4 align-self-center" style="text-align: right">
										</div>
									</div>
									<div class="row viewSubWrap">
										<div class="input-group mb-3" style="margin-top: 10px">
											<select class="form-select inputGroupSelect02" id="categoryId">
												<c:forEach var="category" items="${categoryList }" varStatus="status">
													<option value="${category.categoryId }">${category.categoryName }</option>
												</c:forEach>									
											</select>
										</div>
										<div class="mb-3">
											<input type="email" id="noteTitle"
												class="form-control exampleFormControlInput1"
												placeholder="제목을 입력하세요">
										</div>
										<div>
											<input name='hashtag'
												class="form-control exampleFormControlInput1">
											<script>
												
											</script>
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
					</form>
					<div class="col-lg-2 d-none d-xl-block d-lg-block"></div>
				</div>
			</div>
		</div>
	</section>
	<c:import url="/WEB-INF/views/layout_test/bottom.jsp" />
</body>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script
	src="https://unpkg.com/@yaireo/tagify@3.1.0/dist/tagify.polyfills.min.js"></script>
<script>
	// The DOM element you wish to replace with Tagify
	var input = document.querySelector('input[name=tags]');

	// initialize Tagify on the above input node reference
	new Tagify(input)
</script>
</html>