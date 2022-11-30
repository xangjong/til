/**
 *  checkForm.js : 폼 유효성 확인
 */
 
 window.onload = function(){
	
	//id가 joinForm인 객체의 submit 버튼이 눌러졌을 때 수행되는 함수
	document.getElementById('joinForm').onsubmit =  function() {
		// 성명을 입력하지 않은 경우 알림창 출력
		var name = document.getElementById('name');
		
		if(name.value == ""){
			alert("성명을 입력하세요");
			name.focus();
			return false; // 다음 페이지로 이동하지 않게
		}
		
		// 아이디를 입력하지 않은 경우
		// 아이디를 입력하세요 출력되고, 아이디 입력란에 포커스
		var id = document.getElementById('id');

	    if(id.value == ""){
	      alert("아이디를 입력하세요");
	      id.focus();
	      // 다음 페이지로 이동하지 않게
	      return false;
	    }

		// 아이디를 6~10자가 안 되게 입력했을 경우
		// 아이디는 6~10자로 입력하세요 출력되고, 입력된 값 삭제하고
		//아이디 입력란에 포커스
		if(id.value.length < 6  || id.value.length > 10) {
			alert("아이디는 6자에서 10자로 입력하세요.");
			id.value = "";  // 입력란 지우기
			id.focus();
			
			return false; // 다음 페이지로 이동하지 않게			
		}
		
		
		// 비밀번호와 비밀번호 확인이 일치않는 경우
		// 비밀번호 확인이 일치하지 않습니다 출력, 비밀번호 확인 입력란 지우고
		// 비밀번호 확인 입력란에 포커스
		var password = document.getElementById('password');
		var passwordCheck = document.getElementById('passwordCheck');
		
		if(password.value != passwordCheck.value){
			alert("비밀번호 확인이 일치하지 않습니다");
			passwordCheck.value = "";
			passwordCheck.focus();
			return false;
		}

		// 직업을 선택하지 않은 경우, 직업을 선택하세요
		 var job = document.getElementById('job');

	    if(job.selectedIndex == 0){ // if(job.value == ""){
	      alert("직업을 선택해주세요");
	      return false;
	    }
	
		// 라디오 버튼 : '이메일 수신 여부' 라디오 버튼을 선택하지 않은 경우
		// 라디오 버튼의 경우 id 속성을 사용하지 않고 그룹 name 속성ㅇ 사용
		// 동일 그룹에 속한 여러 라이오 객체는 name이 동일
		// 그룹 내에 여러 개의 라디오 객체가 있으므로 배열로 처리
		var chk = false;
		for(var i=0; i<joinForm.emailRcv.length; i++){
			if(joinForm.emailRcv[i].checked == true)
				chk = true; //하나라도 체크되면 true가 저장
		}
		
		// 하나도 체크되지 않으면 false 갓 그대로 유지
		if(chk == false) {
			alert("이메일 수신 여부를 선택하세요");
			return false;
		}
		
		// 체크박스인 경우
		var agreement1 = document.getElementById('agreement1');
		var agreement2 = document.getElementById('agreement2');
		
		// 체크박스를 하나도 선택하지 않은 경우, 
		/*if(agreement1.checked == false && agreement2.checked == false) {
			alert("동의 항목을 하나도 선택하지 않았습니다.");
			return false;
		}	*/	
		
		//모두 동의해야 합니다 출력
		if(agreement1.checked == false || agreement2.checked == false) {
			alert("모두 동의해야 합니다");
			return false;
		}
		
	}; // onsubmit 끝
	
}; // window.onload 끝









