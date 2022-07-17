<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>NoticePage</title>
		<link rel="stylesheet" type="text/css" href="css/noticePage.css">
		<script src="js/jquery-3.6.0.min.js"></script>
		<script src="js/noticePage.js"></script>
	</head>
	<body>
		<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
			<div class="bodyWrap">
				<div class="createNotice">
					<button>새 공지 작성하기</button>
				</div>
				<div class="noticeBox">
					<div class="arrayTitle">
						<button class="btnFilter btnFilterActive">최신순</button>
						<button class="btnFilter">추천순</button>
						<button class="btnFilter">댓글순</button>
						<button class="btnFilter">조회순</button>
					</div>
					<div class="notice">
						<div class="noticeTitle">
							<a href="#"><h2>CSS Layout의 역사</h2></a>
						</div>
						<div class="noticeText">
							Flexbox가 2012년도에 나왔습니다. 그 전까지는 얼마나 배치하는게 힘들었을까요.(야매가 아니라면) 센스있는 trick들에 의존했겠죠...
						</div>
						<div class="noticeOthers">
							<div class="TagAnaTime">
								<div class="noticeTagBox">
									<div class="Tag">
										CSS
									</div>
								</div>
								<div class="noticeTime">
									<%= sf.format(nowTime) %>
								</div>
							</div>
							<div class="noticeUser">
								<span class="noticeUserImg">
									<img src="image/user.png">
								</span>
								<span class="noticeUserNickName">
									${sessionScope.sid}
								</span>
							</div>
						</div>
					</div>
					<div class="notice">
						<div class="">
							
						</div>
						<div>
						
						</div>
					</div>
					<div class="notice">
						<div class="">
							
						</div>
						<div>
						
						</div>
					</div>
					<div class="notice">
						<div class="">
							
						</div>
						<div>
						
						</div>
					</div>
				</div>
				<div class="pageNum">
					<button class="btnFilter"><<</button>
					<button class="btnFilter btnFilterActive">1</button>
					<button class="btnFilter">2</button>
					<button class="btnFilter">3</button>
					<button class="btnFilter">>></button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/bottom.jsp"/>
	</body>
</html>