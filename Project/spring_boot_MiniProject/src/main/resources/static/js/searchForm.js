/**
 *  idSearch
 */
 
 $(document).ready(function(){
	
	
	$("#idSchFrm").on('submit', function(){
		// 기본 기능 중단
		event.preventDefault();
		
		var userEmail = $('#userEmail1').val() + "@" + $('#userEmail2').val();
		
		$.ajax({
 			type:"post",
 			url:"/subPage/idSearch",
 			data:{ "userName":$('#userName').val(),
 			 	   "userEmail":userEmail},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result) {
					alert("당신의 ID는 " + result + "입니다.");
					location.href="/loginForm/" + result;
				} else {
					alert("해당 유저 정보가 없습니다.");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		});
	}); // idSchFrm submit 클릭 시
	
	$("#pwSchFrm").on('submit', function(){
		// 기본 기능 중단
		event.preventDefault();
		
		var userEmail = $('#userEmail1').val() + "@" + $('#userEmail2').val();

		$.ajax({
 			type:"post",
 			url:"/subPage/pwSearch",
 			data:{ "userId":$('#userId').val(),
 		 	 	   "userEmail":userEmail},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result) {
					alert("가입된 유저 정보가 있습니다.");
					location.href="/subPage/pwComplete/" + $('#userId').val();
				} else
					alert("해당 유저 정보가 없습니다.");
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
		});
 	});	// pwSchFrm submit 클릭 시 
	
	// 글자 수 제한
	$('.idInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});	

	$('.nameInput').on('keyup', function(){
		$(this).attr('maxlength', '16');
	});
	
	$('.emailInput').on('keyup', function(){
		$(this).attr('maxlength', '14');
	});
	
}); // document.ready
