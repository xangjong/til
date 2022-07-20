<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>bottom</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/footer.css'/>">
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<footer>
			<div class="footerBox">
				<a href="/"><img src="<c:url value='/image/logo-withus2.png'/>" class="footerlogoImg"></a>
			<div class="footerulBox">
				<ul class="withus">
					<li>위더스</li>
					<li>상호명 : <span>With:us</span></li>
					<li>이용약관 | 개인정보 보호 | 도움말</li>
					<li>개인정보관리책임자 : </li>
					<li>연락처 : <span>010-1234-5678</span></li>
					<li>주소 : 서울시 강남구 선릉로</li>
				</ul>
				<ul class="siteMap">
					<li>SITEMAP</li>
					<li><a href="<c:url value='/'/>">HOME</a></li>
					<li><a href="<c:url value='/noticePage'/>">NOTICE</a></li>
					<li><a href="<c:url value='/questionPage'/>">QUESTION</a></li>
					<li><a href="<c:url value='/talkPage'/>">TALK</a></li>
					<li><a href="<c:url value='/ITNewsPage'/>">IT NEWS</a></li>
				</ul>

				<ul class="contact">
					<li>CONTACT US</li>
					<li><a href="<c:url value='/'/>">with:us</a></li>
					<li><a href="<c:url value='https://github.com/'/>" target="_blank">GIT</a></li>
				</ul>
				</div> <!-- footerulBox -->	
			</div><!--footerBox  -->
		</footer>	
	</body>
</html>