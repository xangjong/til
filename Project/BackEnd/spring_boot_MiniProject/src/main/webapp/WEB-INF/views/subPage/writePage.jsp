<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<link href="image/logo.png" rel="shortcut icon" type="image/x-icon">
		<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
			rel="stylesheet">
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://kit.fontawesome.com/51724f5bf4.js"></script>
		<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
			rel="stylesheet" type="text/css" />
			<script src="js/summernote-lite.js"></script>
		<script src="js/lang/summernote-ko-KR.js"></script>
		<link rel="stylesheet" href="css/summernote-lite.css">
		<link rel="stylesheet" type="text/css" href="css/common.css">
		<link rel="stylesheet" type="text/css" href="css/buttonD.css">
		<link rel="stylesheet" type="text/css" href="css/writePage.css">
		<style type="text/css">
		
		</style>
	</head>
	<body>
		<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 300,                 // 에디터 높이
				  minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
				  toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['picture','link','video']],
					    ['view', ['fullscreen', 'help']]
					  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		          
			});
		});
		</script>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="container-fluid" style="margin: 0; padding: 0;">
				<div class="row">
					<div class="col-lg-2 d-none d-xl-block d-lg-block">
					</div>
					<div class="col-lg-8 col-12">
						<br>
						
						<nav class="listSize" style="padding: 0; margin: auto">
							<div class="container" style="padding: 10px;">
								<div class="row">
									<div class="col-auto me-auto" style="font-size: 1.5em; color: rgb(112, 190, 248)">
										<i class="fa-solid fa-lg fa-pen-to-square" style="margin-right:10px"></i>게시물 작성</div>
									<div class="col-auto">
										<button class="btn btn-gradient red"  onClick="history.go(-1)">취소</button>
										<button class="btn btn-gradient cyan"  onClick="history.go(-1)">저장</button>
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
											<select class="form-select inputGroupSelect02">
												<option selected>게시판을 선택해 주세요</option>
												<option value="1">Notice</option>
												<option value="2">question</option>
												<option value="3">talk</option>
											</select>
										</div>
										<div class="mb-3">
											<input type="email" class="form-control exampleFormControlInput1"
												 placeholder="제목을 입력하세요">
										</div>
										<div>
											<input name='tags' value='Javascript,css' class="form-control"
												autofocus>
										</div>
										<div>
											<p></p>
										</div>
										<div class="summernote"></div>
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
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
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