/**
 *  pwSearch
 */

 $(document).ready(function(){
	
	$(".joinBtn").on('click', function(){
		
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
	
	// 이메일 유효성 검사 함수 
		function email_check(email) {
		
		// 이메일 정규식 	
		var reg_email = /^[a-z]+[a-z0-9]{5,14}$/g; // 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 
		return reg_email.test(email);

	  }  // 이메일 체크 함수
	 
		var email = $(".emailInput").val(); 

		if(email==""){
			alert("이메일을 입력해주세요.");
			$('.emailInput').focus();
		return false;
		
		}else{
		if(!email_check(email)){ 
			alert("유효하지 않은 이메일입니다. 영문과 숫자를 조합하여 6~14자 내로 입력해주세요.");
			$('.emailInput').focus();
			return false;
		}
	}
	
	}); // joinBtn 클릭 시 
	
	// 글자 수 제한
	$('.idInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});
	
	$('.emailInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});
	
	
	
	
}); // document.ready
	