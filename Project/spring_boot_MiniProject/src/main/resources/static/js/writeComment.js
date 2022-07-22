/**
 *  회원가입
 */
 
 
 $(document).ready(function(){
	
	$("#commentWriteBtn").on('click', function(){
	
		var comment1 = $('#comment').val();
 		comment1 = comment1.replaceAll(/(\n|\r\n)/g, "<br>");
	
		// submit 이벤트 기본 기능 : 페이지 새로 고침
 		// 기본 기능 중단
 		event.preventDefault();
 		
 		$.ajax({
 			type:"post",
 			url:"/writeComment",
 			data:{
 				"noteId":$('#noteId').val(),
 				"comment":comment1
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("작성 완료");
					location.reload();
				}else{
					alert("작성 실패");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("작성 실패");
			}
 		});
 		
		
	});
	
}); // document.ready
