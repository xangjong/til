
$("#filter").on("change",function(){
		
		$.ajax({
			type:"post",
			url:"/myPageQuestion",
			data:{
			"page":0,
			"title":'',
			"filter":$("#filter option:selected").val(),
			"category":1
			},
			success:function(result){
				$('#searchResultBox').html(result);
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 실패");
			},
		});
	
	});