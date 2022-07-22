/**
 *  회원가입
 */
 

 $(document).ready(function(){
 
 
 	
 	$('input[name=updateBtn]').each(function(i){
 				
	 	$(this).click(function(e){				

	 		
	 			e.preventDefault();				
		 		alert(i+'번 버튼 '+this.style.background);	
		 		
		 		var commentId = $('input[name=updateCommentId]').eq(i).val();
		 		var userNickname = $('input[name=updateUserNickname]').eq(i).val();
		 		var userImg = $('input[name=updateUserImg').eq(i).val();
		 		var comment = $('input[name=updateComment').eq(i).val();
		 		var date = $('input[name=updateDate').eq(i).val(); 
		 		
		 		console.log(commentId);
		 		
		 		
		 		$(".commentBox").eq(i).empty();
		 		
		 		$(".commentBox").eq(i).append('<div class="col-lg-9 col-9"><div class="row"><input type="hidden" name="updateCommentId" value="'+commentId+'"><input type="hidden" name="updateUserNickname" value="'+userNickname+'"><input type="hidden" name="updateUserImg" value="'+userImg+'"><input type="hidden" name="updateComment" value="'+comment+'"><input type="hidden" name="updateDate" value="'+date+'"><table style="float: left;"><tr><td rowspan="2"width="40px"><img class="viewProfle"src="' + userImg + '"></td><td><a class="nickNameB"href="#">' + userNickname + '</a><span><i class="fa-solid fa-2xs fa-bolt"></i><input type="button" name="updateBtn" value="수정"> <input type="button" value="삭제"></td></tr><tr><td class="createdDateB"><fmt:formatDate value="'+date+'"pattern="hh:mm"/></td></tr></table></div><div class="row"style="padding: 10px"><div class="input-group"><textarea id="comment"class="form-control"aria-label="With textarea">'+comment+'</textarea></div></div></div><div class="col-auto ms-auto align-self-end"><button name="commentUpdateBtn" onclick="update('+commentId+')" class="btn btn-gradient blue">수정</button></div>');
	 	});		
 	});	
 	

	
}); // document.ready

 	function updateForm(data){
		console.log(data);
		
		var id = data+'';
		var commentId = data;
		var userNickname = $('#userNickname'+id).val();
		var userImg = $('#userImg'+id).val();
 		var comment = $('#comment'+id).text();
 		console.log(comment);
 		var date = $('#date'+id).val(); 
 		
 		$("#commentBox"+id).empty();
 		
 		$("#commentBox"+id).append('<div class="col-lg-9 col-9"><div class="row"><input type="hidden"id="userNickname'+commentId+'"value="${comment.userNickname }"><input type="hidden"id="userImg'+commentId+'"value="${comment.userImg }"><input type="hidden"id="date'+commentId+'"value="${comment.commentCreatedDate }"><table style="float: left;"><tr><td rowspan="2"width="40px"><img class="viewProfle"src="'+userImg+'"></td><td><a class="nickNameB"href="#">'+userNickname+'</a><span><i class="fa-solid fa-2xs fa-bolt"></i></td></tr><tr><td class="createdDateB"><fmt:formatDate value="'+date+'"pattern="hh:mm"/></td></tr></table></div><div class="row"style="padding: 10px"><div class="input-group"><textarea id="comment'+commentId+'"class="form-control" >'+comment+'</textarea></div></div></div><div class="col-auto ms-auto align-self-end"><button onclick="update('+commentId+')"class="btn btn-gradient blue">수정</button></div>');	
	}
	
	function update(data){
	
		console.log(data);
		
		var id = data+'';
		
		var commentId = data;
 		var comment1 = $('textarea#comment'+id).val();
 		comment1 = comment1.replaceAll(/(\n|\r\n)/g, "<br>");
 		
 		console.log(commentId);
 		console.log(comment1);
 		
 		$.ajax({
 			type:"post",
 			url:"/updateComment",
 			data:{
 				"commentId":commentId,
 				"comment":comment1
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("수정 완료");
					location.reload();
				}else{
					alert("수정 실패");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 오류");
			}
		});
		
	}
	
	function deleteComment(data){
 		
 		$.ajax({
 			type:"post",
 			url:"/deleteComment",
 			data:{
 				"commentId":data,
 			},
			dataType:"text",
			success:function(result){
				// 성공 시 결과 받음
				if(result == "SUCCESS"){
					alert("삭제 완료");
					location.reload();
				}else{
					alert("삭제 실패");
				}
			},
			error:function(){
				// 오류있을 경우 수행 되는 함수
				alert("전송 오류");
			}
		});
		
	}
	