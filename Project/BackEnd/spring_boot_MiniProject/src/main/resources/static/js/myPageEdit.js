 /**
 *  마이페이지
 */
 
 
 $(document).ready(function(){
	
	$(".editBtn").on('click', function(){
		
		// 닉네임 유효성 검사 함수 
		function nickname_check(nickname) {
		
		// 닉네임 정규식 	
		var reg_nickname =  /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/  // 닉네임은 한글, 영문, 숫자만 글자 수 제한x
		return reg_nickname.test(nickname);

	  }  // 닉네임 체크 함수
	 
		var nickname = $(".nicknameInput").val(); 

		if(nickname==""){
			alert("닉네임을 입력해주세요.");
			$('.nicknameInput').focus();
		return false;
		
		}else{
		if(!nickname_check(nickname)){ 
			alert("유효하지 않은 닉네임입니다. 한글, 영문, 숫자만 가능하며 2~10자 내로 입력해주세요.");
			$('.nicknameInput').focus();
			return false;
		}
	}
		
	
	
		// 비밀번호 유효성 검사 함수 
		function pw_check(password) {
  		// 최소 8 자, 20자 이하 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
  		var reg_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
  	
  		return reg_pw.test(password);
  	
}		var password = $("#pwInput").val(); 

		if(password==""){
			alert("비밀번호를 입력해주세요.");
			$('.pwInput').focus();
		return false;
		
		}else{
		if(!pw_check(password)) {
  			alert("유효하지 않은 비밀번호입니다. 하나 이상의 문자와 숫자 특수 문자를 포함하여 8~20자 내로 입력해주세요.");
  			$('.pwInput').focus();
    		return false;
		}
	}
		
	// 비밀번호 확인 
		if($('.pwInput').val() != $('.pwCfmInput').val()){
			alert("비밀번호가 일치하지 않습니다.");
			$('.pwCfmInput').focus();
			return false;	
		} // 회원가입 완료 시 
		alert("회원가입 완료");
		window.location.href="joinComplete.html"; 
			
		 
	}); // joinBtn 클릭 시 
	
	// 글자 수 제한
	
	$('.nameInput').on('keyup', function(){
		$(this).attr('maxlength', '10');
	});
	
	$('.nicknameInput').on('keyup', function(){
		$(this).attr('maxlength', '10');
	});
	
	$('.idInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});
	
	$('.emailInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});
	
	$('.pwInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	$('.pwCfmInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	
}); // document.ready
 