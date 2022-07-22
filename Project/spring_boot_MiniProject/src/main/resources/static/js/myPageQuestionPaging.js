/**
 * 
 */
 
 var page = 0;
 var title = '';
 var nickname = '';
 var filter = '';
 var category = 1;
 
 $(document).ready(function(){
 	$.ajax({
		type:"post",
		url:"/myPageQuestion",
		data:{
		"page":0,
		"title":'',
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



function pageBtn(data){
	page = data;
	console.log(page);
	
	$.ajax({
		type:"post",
		url:"/myPageQuestion",
		data:{
		"page":page,
		"title":title,
		"filter":filter,
		"category":category
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
	
	
}

function categoryBtn(data){

	event.preventDefault();
	
	console.log(data)
	
	if(data == 1){
		$('#category1 > span').css('background-color','#6698CB');
		$('#category2 > span').css('background-color','#AAAAAA');
		$('#category3 > span').css('background-color','#AAAAAA');
	}else if(data == 2){
		$('#category1 > span').css('background-color','#AAAAAA');
		$('#category2 > span').css('background-color','#6698CB');
		$('#category3 > span').css('background-color','#AAAAAA');
	}else if(data == 3){
		$('#category1 > span').css('background-color','#AAAAAA');
		$('#category2 > span').css('background-color','#AAAAAA');
		$('#category3 > span').css('background-color','#6698CB');
	}
	

	title = $('#titleSearch').val();
	$.ajax({
		type:"post",
		url:"/myPageQuestion",
		data:{
		"page":0,
		"title":'',
		"filter":"noteId",
		"category":data
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
}

function titleSearchBtn(){

	event.preventDefault();

	title = $('#titleSearch').val();
	$.ajax({
		type:"post",
		url:"/myPageQuestion",
		data:{
		"page":0,
		"title":title,
		"filter":filter,
		"category":category
		},
		success:function(result){
			$('#searchResultBox').html(result);
		},
		error:function(){
			// 오류있을 경우 수행 되는 함수
			alert("전송 실패");
		},
	});
}

