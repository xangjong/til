/**
 *  로그인
 */
 
 
 $(document).ready(function(){
	
	
	// 로그인 버튼 클릭 시 
	$('#loginBtn').on('click',function() {
		
		// 이메일 유효성 검사 함수 
		function email_check(email) {
		
		// 이메일 정규식 	
		var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 
		return reg_email.test(email);

	  }  // 이메일 체크 함수
	
		var email = $("#emailInput").val(); 

		if(email==""){
			alert("이메일을 입력해주세요.");
			$('#emailInput').focus();
		return false;
		
		}else{
		if(!email_check(email)){ // 이메일 함수 체크 호출
			alert("유효하지 않은 이메일입니다.");
			$('#emailInput').focus();
			return false;
		}
	}
		
		// 비밀번호 유효성 검사 함수 
		function pw_check(password) {
  		
  		// 최소 8 자, 20자 이하 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
  		var reg_pw = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
  		
  		return reg_pw.test(password);
  	
	}
		var password = $("#pwInput").val(); 

		if(password==""){
			alert("비밀번호를 입력해주세요.");
			$('#pwInput').focus();
		return false;
		
		}else{
		if(!pw_check(password)) {
  			alert("비밀번호가 일치하지 않습니다.");
  			$('#pwInput').focus();
    		return false;
		}
	} 	// 로그인 성공 시 
		alert("로그인 성공");
		window.location.href="../index.html";
		

}); // loginBtn submit 이벤트
	
	
	// 이메일 비밀번호 글자 수 제한 20
	$('#emailInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	$('#pwInput').on('keyup', function(){
		$(this).attr('maxlength', '20');
	});
	
	
	/* const input = document.querySelector("#input");
	const label = document.querySelector("#label");
	LET TOGGLE = FALSE;
	input.addEventListener("CHANGE",FUNCTION(EVENT){
		LET A = EVENT.TARGET.VALUE;
		IF(A.LENGTH > 0){
			ABEL.CLASSLIST.ADD("가만히 있는 CSS")
			TOGGLE = TRUE
		} ELSE IF (TOGGLE && A.LENGTH =< 0) {
			LABEL.CLASSLIST.REMOVE(".GG")
					}
	}) */
	
	

	
	
}); // document.ready 
 
 