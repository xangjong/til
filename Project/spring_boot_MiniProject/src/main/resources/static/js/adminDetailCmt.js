 /**
 *  마이페이지
 */
 
 
 $(document).ready(function(){
 	
 	// 기존 값과 비교할 전역변수
 	var pageViewState = $('#pageViewState').val();
	$("#editFrm").on('submit', function(){
		// 기본 기능 중단
		event.preventDefault();
	
		// 기존값 변화여부
		if(pageViewState == $('#pageViewState').val()) {	// 기존 공개와 비교				

		   	// 변화가 없을 때
			alert("수정할 항목이 없습니다.");
			return false;
		}
	
 		
 		var formData = new FormData($('#editFrm')[0]);

 		$.ajax({
 			type:"post",
 			enctype: 'multipart/form-data',
 			url:"/subPage/adminUpdateCmt/",
 			data: formData,
			contentType : false,
        	processData : false,
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("수정되었습니다.");
					location.href="/subPage/adminComment";
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			}
 		}); 
 	});
	
	$('#prevMenu').on('click', function() {
		location.href="/subPage/adminComment";
	});
	
}); // document.ready


 