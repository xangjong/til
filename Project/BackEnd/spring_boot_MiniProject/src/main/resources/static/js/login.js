/**
 *  로그인
 */
 
 $(document).ready(function(){
	
 	$('.loginForm').on('submit', function(){
 		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		$.ajax({
 			type:"post",
 			url:"login",
 			data:{"id":$('.idInput').val(),
 				  "pwd":$('.pwInput').val()},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "success"){
					alert("로그인 성공");
					location.href="/";
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

 
	
	// 로그인 버튼 클릭 시 
	$('.loginBtn').on('click',function() {
		
		// 아이디 유효성 검사 함수 
		function id_check(id) {
		
		// 아이디 정규식 	
		var reg_id = /^[a-z]+[a-z0-9]{5,14}$/g; // 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 
		return reg_id.test(id);

	  }  // 아이디 체크 함수
	 
		var id = $(".idInput").val(); 

		if(id==""){
			alert("아이디를 입력해주세요.");
			$('.idInput').focus();
		return false;
		
		}else{
		if(!id_check(id)){ 
			alert("유효하지 않은 아이디입니다. 6~14 자 내로 입력해주세요.");
			$('.idInput').focus();
			return false;
		}
	}
	
		
		// 비밀번호 유효성 검사 함수 
		function pw_check(password) {
  		
  		// 최소 8 자, 20자 이하 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
  		var reg_pw =/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
  		
  		return reg_pw.test(password);
  	
	}
		var password = $(".pwInput").val(); 

		if(password==""){
			alert("비밀번호를 입력해주세요.");
			$('.pwInput').focus();
		return false;
		
		}else{
		if(!pw_check(password)) {
  			alert("비밀번호가 일치하지 않습니다.");
  			$('.pwInput').focus();
    		return false;
		}
	} 	// 로그인 성공 시 
		alert("로그인 성공");
		window.location.href="/";
		

}); // loginBtn submit 이벤트
	
	
	// 이메일 비밀번호 글자 수 제한 20
	$('.emailInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	$('.pwInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	
}); // document.ready 



 
 