/**
 * 
 */
 
 
 $(document).ready(function(){
	
	$(".joinBtn").on('click', function(){
		
		
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
		} else {
		// 비밀번호 변경 시 
			alert("비밀번호가 변경되었습니다.");
			location.href='/';
		}	
		
	}); // joinBtn 클릭 시 
	

	$('.pwInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	$('.pwCfmInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	
}); // document.ready