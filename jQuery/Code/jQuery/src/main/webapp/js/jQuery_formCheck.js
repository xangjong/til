/**
 * 
 */
 
 $(document).ready(function(){
	$('#id').focus();
		// 키보드 이벤트 
		// 휴대폰 번호 입력 시 첫 번째 번호 입력란에서 입력값이 3개가 되면 포커스 이동
		
	$('#hp1').on('keyup',function(){
		// 입력란 값의 길이가 3이면 hp2로 포커스 이동
		
		if($(this).val().length == 3 ){
			$('#hp2').focus(); 		
		} 
	});
	
	
	$('#hp2').on('keyup',function(){
		// 입력란 값의 길이가 4이면 hp3로 포커스 이동
		
		if($(this).val().length == 4){
			$('#hp3').focus(); 		
		} 
	});
	
	// 엔터키 눌렀을 때 무조건 submit 되지 않도록
	// 문서 전체에 이벤트 처리 
	// [Enter] 키의 아스키 코드 값 : 13
	
	$(document).on('keydown', function(e){
		if(e.keyCode == 13) return false;
	});
	
	
	
	//newMemberForm의 submit 버튼 눌렀을 때 
	$('#newMemberForm').on('submit', function(){
		// 아이디를 입력하지 않은 경우
		if($('#id').val()==""){
			alert("아이디를 입력하세요.");
			$('#id').focus();
			return false; 
		}
		
	if($('#pwd').val()==""){
			alert("비밀번호를 입력하세요.");
			$('#pwd').focus();
			return false; 
		}
		
	/*	// 라디오 버튼 선택하지 않은 경우
		if(!($('input[type=""radio""]').is(':checked'))){
			alert("학년을 선택하세요");
			return false;
		} */
		
		// 라디오 버튼 선택하지 않은 경우 축약형
		if(!($(':radio').is(':checked'))){
			alert("학년을 선택하세요");
			return false;
		}
		
		// 라디오 버튼 선택하지 않은 경우 축약형
		if(!($(':checkbox').is(':checked'))){
			alert("관심분야를 선택하세요");
			return false;
		}
		
		
	});
}); // ready 종료 