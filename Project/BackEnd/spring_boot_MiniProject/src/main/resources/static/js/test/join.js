/**
 *  회원가입
 */
 
 
 $(document).ready(function(){
 	$('#userName').focus();
 	
 	// 유효성 체크 전역변수
 	var reg, name, msg;
 	
 	// 유효성 체크 프레임
 	function chkFrame(reg, name, msg) {
 		var result = true;
 		if(!reg.test(name.val())) {
 			alert(msg);
 			name.focus();
 			result = false;
 		}
 		return result;
 	}
 	
 	// 유효성 체크
 	function chkSubmit() {
 		var result = true;
 		
		// 이름 유효성 체크
	 	reg = /^[가-힣a-zA-Z]+$/; // 한글 + 영문만
	 	name = $('#userName');
	 	msg = "유효하지 않은 이름입니다. 이름을 다시 확인해주세요.";
	 	
	 	if(!chkFrame(reg, name, msg)) {
			result = false;
			return result;
	 	}
	 	
	 	// 닉네임 유효성 체크
	 	// 닉네임은 한글, 영문, 숫자만 글자 수 제한x
		reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{2,10}$/g;
		name = $('#userNickname');
		msg = "유효하지 않은 닉네임입니다. 한글, 영문, 숫자만 가능하며 2~10자 내로 입력해주세요.";

		if(!chkFrame(reg, name, msg)) {
			result = false;
			return result;
	 	}
		
		// ID 유효성 체크
		// 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 	
		reg = /^[a-z]+[a-z0-9]{5,14}$/g;
		name = $('#userId');
		msg = "유효하지 않은 아이디입니다. 6~14 자 내로 입력해주세요.";
		
		if(!chkFrame(reg, name, msg)) {
			result = false;
			return result;
	 	}
		
		// Email 유효성 체크
		// 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 	
		reg = /^[a-z]+[a-z0-9]{5,14}$/g;
		name = $('#userEmail1');
		msg = "유효하지 않은 이메일입니다. 영문과 숫자를 조합하여 6~14자 내로 입력해주세요.";
		
		if(!chkFrame(reg, name, msg)) {
			result = false;
			return result;
	 	}
		
		// PASSWORD 유효성 체크
		// 최소 8 자, 20자 이하 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식
  		reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
  		name = $('#userPw');
  		msg = "유효하지 않은 비밀번호입니다. 하나 이상의 문자와 숫자 특수 문자를 포함하여 8~20자 내로 입력해주세요."; 
  		
  		if(!chkFrame(reg, name, msg)) {
			result = false;
			return result;
	 	}
  		
  		// 비밀번호 확인
  		const pwCfm = $('.pwCfmInput');
		if(name.val() != pwCfm.val()){
			alert("비밀번호가 일치하지 않습니다.");
			pwCfm.focus();
			result = false;
			return result;	
		}
  		
		// 닉네임, ID, Email 중복 여부 체크
 		$('.chkInput').each(function(index){
			var chkInput = $(this).parent().children().eq(1).children();
			
			if($(this).css('color') == "rgb(255, 0, 0)") {
 		    	alert("중복된 항목이 있습니다.");
 		    	chkInput.focus();
 		    	result = false;
 		    	return result;
 		    } else if($(this).css('color') == "rgb(0, 0, 0)") {
 		    	alert("중복 체크할 항목이 있습니다.");
 		    	chkInput.focus();
 		    	result = false;
 		    	return result;
 		    }
 		});

 		return result; 	
 	} // chkSubmit 함수 종료
	
	// 가입	
	$("#joinFrm").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		var userEmail = $('#userEmail1').val() +'@'+ $('#userEmail2').val();
 		
 		// 소속 항목에 값이 없으면 자동 입력
 		var userCompany = ($('#userCompany').val() == "" ? "무직" : $('#userCompany').val());
 		
 		// 유효성 체크
 		if(!chkSubmit())
 			return false;
 		
 		$.ajax({
 			type:"post",
 			url:"/test/join",
 			data:{
 				"userName":$('#userName').val(),
 				"userNickname":$('#userNickname').val(),
 				"userId":$('#userId').val(),
 				"userEmail":userEmail,
 				"userPw":$('#userPw').val(),
 				"userCompany":userCompany
 			},
			dataType:"text",
			success:function(result){
				if(result == "SUCCESS"){
					alert("가입되었습니다.");
					location.href="/test/joinComplete";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("회원가입 실패");
			}
 		});
	});
	
	// 수정
	$("#editFrm").on('submit', function(){
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		//event.preventDefault();
 		
 		// 유효성 체크(join.js에 포함)
 		
 		if(!chkSubmit())
 			return false;
 		else
 			alert("수정되었습니다.");
 	});
	
	// 닉네임 중복 체크
	// 기존 닉네임 확인(회원 수정에서 필요)
	var chkNickName = $('#userNickname').val();
	$("#chkNickname").on('click', function(){
		// 기본 기능 중단
		event.preventDefault();
		
	 	// 닉네임 유효성 체크
	 	// 변경 감지 확인(회원 수정에서 필요)
	 	if(chkNickName != "" && $('#userNickname').val() == chkNickName) {
	 		alert("기존 값과 일치합니다.");
	 		$('#titleNickname').css('color', 'green');
			return false;
	 	}
	 		
	 	// 닉네임은 한글, 영문, 숫자만 글자 수 제한x
		reg = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]{2,10}$/g;
		name = $('#userNickname');
		msg = "유효하지 않은 닉네임입니다. 한글, 영문, 숫자만 가능하며 2~10자 내로 입력해주세요.";

		if(!chkFrame(reg, name, msg)) {
			return false;
	 	}
 		
 		$.ajax({
 			type:"post",
 			url:"/test/chkNickname",
 			data:{ "userNickname":$('#userNickname').val() },
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "FIND"){
					alert("닉네임이 중복되었습니다.");
					$('#titleNickname').css('color', 'red');
					$('#userNickname').focus();
				}else{
					alert("사용할 수 있는 닉네임입니다.");
					$('#titleNickname').css('color', 'green');
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 				
	});
	
	// ID 중복 체크
	$("#chkId").on('click', function(){
		// 기본 기능 중단
		event.preventDefault();

		// ID 유효성 체크
		// 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 	
		reg = /^[a-z]+[a-z0-9]{5,14}$/g;
		name = $('#userId');
		msg = "유효하지 않은 아이디입니다. 6~14 자 내로 입력해주세요.";
		
		if(!chkFrame(reg, name, msg)) {
			return false;
	 	}
	 	 		
 		$.ajax({
 			type:"post",
 			url:"/test/chkId",
 			data:{ "userId":$('#userId').val() },
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "FIND"){
					alert("ID가 중복되었습니다.");
					$('#titleId').css('color', 'red');
					$('#userId').focus();
				}else{
					alert("사용할 수 있는 ID입니다.");
					$('#titleId').css('color', 'green');
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 				
	});
	
	// Email 중복 체크
	// 기존 이메일 확인(회원 수정에서 필요)
	var chkEmail1 = $('#userEmail1').val();
	var chkEmail = $('#userEmail1').val() + "@" + $('#userEmail2').val();
	$("#chkEmail").on('click', function(){
		// 기본 기능 중단
		event.preventDefault();

		// Email 유효성 체크
	 	// 변경 감지 확인(회원 수정에서 필요)
	 	var confEmail = $('#userEmail1').val() + "@" + $('#userEmail2').val();
	 	if(chkEmail1 != "" && chkEmail == confEmail) {
	 		alert("기존 값과 일치합니다.");
	 		$('#titleEmail').css('color', 'green');
			return false;
	 	}
	 	
		// 첫 글자 영문으로 시작 영문, 숫자만 가능하며 6-20자 	
		reg = /^[a-z]+[a-z0-9]{5,14}$/g;
		name = $('#userEmail1');
		msg = "유효하지 않은 이메일입니다. 영문과 숫자를 조합하여 6~14자 내로 입력해주세요.";
		
		if(!chkFrame(reg, name, msg)) {
			return false;
	 	}

		var userEmail = $('#userEmail1').val() +'@'+ $('#userEmail2').val();
 		
 		$.ajax({
 			type:"post",
 			url:"/test/chkEmail",
 			data:{ "userEmail":userEmail },
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "FIND"){
					alert("Email이 중복되었습니다.");
					$('#titleEmail').css('color', 'red');
					$('#userEmail1').focus();
				}else{
					alert("사용할 수 있는 Email입니다.");
					$('#titleEmail').css('color', 'green');
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 				
	});
	
	// 중복 확인 후 재수정시 항목명 색상 변화
	$('.chkText').on('keyup', function() {
		var chkSpan = $(this).parent().parent().children().eq(0);
		chkSpan.css('color', 'black');
	});
	
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
