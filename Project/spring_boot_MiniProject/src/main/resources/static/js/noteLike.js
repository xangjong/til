/**
 *  로그인
 */
 $(document).ready(function(){
 
 	$(function(){
 		$.ajax({
 			type:"post",
 			url:"/noteLikeCheck",
 			data:{
 			"noteId":$('#noteId').val()
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "TRUE"){
					$('#noteLike').css('border-color','rgb(112, 190, 248)');
					$('#noteLike').data('chk','TRUE');
				}else{
					$('#noteLike').css('border-color','gray');
					$('#noteLike').data('chk','FALSE');
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				// alert("전송 실패");
			},
 		});
 	});
 	
 
 	$('#noteLike').on('click', function(){ 	
 		
 		$.ajax({
 			type:"post",
 			url:"/noteLikeUpdate",
 			data:{
 			"noteId":$('#noteId').val()
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "TRUE"){
					$('#noteLike').css('border-color','rgb(112, 190, 248)');
					$('#noteLike').data('chk','TRUE');
					var str = $('#noteLikeVal').text() *1 +1;
					$('#noteLikeVal').text(str);
				}else{
					$('#noteLike').css('border-color','gray');
					$('#noteLike').data('chk','FALSE');
					var str = $('#noteLikeVal').text() *1 -1;
					$('#noteLikeVal').text(str);
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			},
 		});
 		
 	});
 });
 