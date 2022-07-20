/**
 *  로그인
 */
 $(document).ready(function(){
 	$('#loginForm').on('submit', function(){
 		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		$.ajax({
 			type:"post",
 			url:"/test/login",
 			data:{"userId":$('#userId').val(),
 				  "userPw":$('#userPw').val()},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("로그인 성공");
					location.href="/test";
				}else{
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			},
 		});
 	});
 });
 