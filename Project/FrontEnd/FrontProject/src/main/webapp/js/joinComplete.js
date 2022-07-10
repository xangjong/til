/**
 *  joinComplete 회원가입 완료
 */
 
 
 $(document).ready(function(){
	
	// 로그인 버튼 클릭 시 로그인 페이지 이동
	$('#loginBtn').on('click', function(){
		window.location.href="login.html"; 
	});
	
	// 홈 버튼 클릭 시 메인 페이지 이동
	$('#homeBtn').on('click', function(){
		window.location.href="../index.html"; 
	});
	
}); // document.ready